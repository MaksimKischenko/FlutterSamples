import 'package:optimal_prime/data/repositories/battery_task_repository.dart';
import 'package:optimal_prime/domain/entities/isar/battery_task.dart';
import 'package:optimal_prime/domain/services/battery_info_service.dart';
import 'package:optimal_prime/domain/services/device_resource_monitoring_service.dart';
import 'package:optimal_prime/domain/services/local_cache_service.dart';
import 'package:optimal_prime/utils/collections.dart';
import 'package:optimal_prime/utils/mocked/mocked_battery.dart';
import 'package:rxdart/rxdart.dart';

class BatteryTaskService {
  BatteryTaskService({
    required CacheService cacheService,
    required BatteryInfoService batteryInfoService,
    required DeviceResourceMonitoringService deviceResourceMonitoringService,
    required BatteryTaskRepository batteryTaskRepository,
  })  : _cacheService = cacheService,
        _batteryInfoService = batteryInfoService,
        _deviceResourceMonitoringService = deviceResourceMonitoringService,
        _batteryTaskRepository = batteryTaskRepository;

  final CacheService _cacheService;
  final BatteryTaskRepository _batteryTaskRepository;
  final DeviceResourceMonitoringService _deviceResourceMonitoringService;
  final BatteryInfoService _batteryInfoService;
  final _batteryTaskTypeSubject = BehaviorSubject<BatteryTaskType>();
  ValueStream<BatteryTaskType> get batteryTaskTypeStream => _batteryTaskTypeSubject.stream;

  Future<BatteryTask?> firstAvailableTask() async {
    final batteryTasks = await _batteryTaskRepository.getInstances();
    final currentTask = batteryTasks
        ?.firstWhereOrNull((task) => (task.state?.isEnabled ?? false) || task.state == null);
    return currentTask;
  }

  Future<void> initCurrentTask(BatteryTask? currentTask) async {
    if (currentTask == null) return;
    currentTask.state = TaskState()
      ..isEnabled = true
      ..startDate = DateTime.now();
    await _batteryTaskRepository.editInstance(
      editetObject: currentTask,
      id: currentTask.id,
    );
  }

  Future<void> startListenForCurrentTask() async {
    final batteryTasks = await _batteryTaskRepository.getInstances();
    final currentTask = batteryTasks?.firstWhereOrNull((task) => task.state?.isEnabled ?? false);
    if (currentTask == null) return;
    switch (currentTask.type) {
      case BatteryTaskType.saveMode:
        _batteryInfoService.batteryInfoStream?.listen((batteryInfo) async {
          if (batteryInfo?.isInBatterySaveMode ?? false) await _finishCurrentTask(currentTask);
        });
        break;
      case BatteryTaskType.charging:
        _batteryInfoService.batteryInfoStream?.listen((batteryInfo) async {
          if (batteryInfo?.batteryState == MockedBatteryState.charging) {
            await _finishCurrentTask(currentTask);
          }
        });
        break;
      //TODO save Full
      case BatteryTaskType.fullCharge:
        _batteryInfoService.batteryInfoStream?.listen((batteryInfo) async {
          if (batteryInfo?.batteryState == MockedBatteryState.full) {
            await _finishCurrentTask(currentTask);
          }
        });
        break;
      case BatteryTaskType.switchOffConnections:
        _deviceResourceMonitoringService.resourceMonitoringStream.listen((resources) async {
          if (!resources.isBluetoothConnection &&
              !resources.isMobileNetwork &&
              !resources.isVpnConnection &&
              !resources.isWifiNetwork) {
            await _finishCurrentTask(currentTask);
          }
        });
        break;
      case BatteryTaskType.hightBattery:
        _batteryInfoService.batteryInfoStream?.listen((batteryInfo) async {
          if ((batteryInfo?.batteryLevel ?? 0) >= 80 && (batteryInfo?.batteryLevel ?? 0) <= 85) {
            await _finishCurrentTask(currentTask);
          }
        });
        break;
      case BatteryTaskType.lowBattery:
        _batteryInfoService.batteryInfoStream?.listen((batteryInfo) async {
          if ((batteryInfo?.batteryLevel ?? 0) >= 20 && (batteryInfo?.batteryLevel ?? 0) <= 25) {
            await _finishCurrentTask(currentTask);
          }
        });
        break;
      default:
    }
  }

  Future<void> dispose() async {
    await _batteryTaskTypeSubject.close();
  }

  Future<void> _finishCurrentTask(BatteryTask task) async {
    task.state = task.state
      ?..isEnabled = false
      ..isFinished = true
      ..finishDate = DateTime.now();

    await _batteryTaskRepository.editInstance(
      editetObject: task,
      id: task.id,
    );
    _batteryTaskTypeSubject.add(task.type);
    // currentTask.type.totalPoints;
  }
}
