import 'package:isar/isar.dart';
import 'package:optimal_prime/data/local/isar_helper.dart';
import 'package:optimal_prime/domain/app_repository.dart';
import 'package:optimal_prime/domain/entities/isar/battery_task.dart';

class BatteryTaskRepository implements AppRepository<BatteryTask> {
  BatteryTaskRepository({
    required IsarHelper isarHelper,
  }) : _isarHelper = isarHelper;

  final IsarHelper _isarHelper;

  @override
  Future<void> init() async {
    final batteryTaskSaveMode = BatteryTask()
      ..description = 'Enable power saving mode on your device'
      ..advice =
          'Power saving mode limits background processes and reduces device performance to reduce\n'
              ' power consumption. Activate this mode when the battery level is low or when you need to extend the battery life of the device.\n'
              'This will help reduce battery consumption and increase device operating time.';
    final batteryTaskFullCharge = BatteryTask()
      ..type = BatteryTaskType.fullCharge
      ..description = 'Charge your device to 100% to calibrate the battery'
      ..advice = 'Fully charging to 100% allows the device to calibrate the battery indicator and provide maximum capacity for use.\n'
          ' Tip: Avoid frequent full charging; It is optimal to maintain the charge level between 20% and 80% to extend battery life.\n '
          ' Constantly keeping your phone fully charged puts strain on the battery, causing it to wear out faster.';
    final batteryTaskCharging = BatteryTask()
      ..type = BatteryTaskType.charging
      ..description = 'Leave the device alone while charging.'
      ..advice =
          'Avoid using the device while charging: This may cause overheating and reduce charging efficiency.';
    final batteryTaskSwitchOffConnections = BatteryTask()
      ..type = BatteryTaskType.switchOffConnections
      ..description = 'Turn off all Wi-Fi, Bluetooth, Mobile, etc connections when not in use'
      ..advice =
          'Turn off Wi-Fi, Bluetooth, and mobile data when not in use to reduce battery consumption. These connections consume energy even when not in use.\n';
    final batteryTaskLowBatteryLevel = BatteryTask()
      ..type = BatteryTaskType.lowBattery
      ..description =
          'To complete this task, open the application (or be in) when the charge level is 20-25%'
      ..advice =
          'Charge your device as soon as the charge drops below 20% to avoid deep discharge.';
    final batteryTaskHightBatteryLevel = BatteryTask()
      ..type = BatteryTaskType.hightBattery
      ..description =
          'To complete this task, open the application (or be in) when the charge level is 80-85%'
      ..advice = 'Keeping lithium-ion batteries between 20% and 80% charge can significantly extend their life.\n'
          'Research shows that limiting the maximum charge to 80% reduces the load on the battery and slows down degradation processes.\n'
          ' For example, when charging a battery to 80%, each cycle causes 5 times less damage than charging to 100%';
    final finalbatteryTaskDarkMode = BatteryTask()
      ..type = BatteryTaskType.darkMode
      ..description = 'Enable dark mode on your device'
      ..advice =
          'A new study reveals that dark mode doesn’t necessarily save much battery life. But there are a few ways that users can take better advantage of the feature, Purdue University researchers say.';
    final batteryTaskOptimizeScreenWork = BatteryTask()
      ..type = BatteryTaskType.optimizeScreenWork
      ..description = 'Change the screen brightness to the optimal level for your device (20-30%)'
      ..advice =
          'The screen is one of the most energy-consuming components of a smartphone. Reducing the brightness of the screen can significantly reduce battery consumption.\n';
    //На устройствах с OLED- или AMOLED-экранами темный режим потребляет меньше энергии, что способствует экономии батареи
    //Вибрация потребляет больше энергии, чем звуковые уведомления. Отключите вибрацию, если в ней нет необходимости.
    //Калибруйте батарею: Раз в несколько месяцев полностью разрядите и затем полностью зарядите устройство для калибровки индикатора батареи.
    //Сократите время, через которое экран автоматически отключается при бездействии, чтобы уменьшить расход энергии.
    //В местах с низким уровнем сигнала устройство потребляет больше энергии в попытках подключиться к сети. В таких ситуациях включайте режим полета.
    //Отключайте уведомления ненужных приложений: Постоянные уведомления заставляют экран загораться и потребляют энергию. Отключите уведомления для приложений, которые не являются приоритетными.

    await Future.wait([
      saveInstance(batteryTaskSaveMode),
      saveInstance(batteryTaskFullCharge),
      saveInstance(batteryTaskCharging),
      saveInstance(batteryTaskSwitchOffConnections),
      saveInstance(batteryTaskLowBatteryLevel),
      saveInstance(batteryTaskHightBatteryLevel),
      saveInstance(finalbatteryTaskDarkMode),
      saveInstance(batteryTaskOptimizeScreenWork),
    ]);
  }

  Future<BatteryTask?> getFirstInstance() async => _isarHelper.isar?.batteryTasks.get(0);

  @override
  Future<BatteryTask?> getInstance() async => _isarHelper.isar?.batteryTasks
      .where()
      .filter()
      .state((state) => state.isEnabledEqualTo(true))
      .findFirst();

  @override
  Future<List<BatteryTask>?> getInstances() async =>
      _isarHelper.isar?.batteryTasks.where().findAll();

  @override
  Future<void> saveInstance(BatteryTask object) async {
    await _isarHelper.isar?.batteryTasks.put(object);
  }

  @override
  Future<void> deleteInstance() async {
    await _isarHelper.isar?.batteryTasks
        .where()
        .filter()
        .state((state) => state.isFinishedEqualTo(true))
        .deleteFirst();
  }

  @override
  Future<void> editInstance({required BatteryTask editetObject, required int id}) async {
    await _isarHelper.isar?.batteryTasks.put(editetObject);
  }
}
