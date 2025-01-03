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
    final batteryTaskSaveMode = BatteryTask();
    final batteryTaskFullCharge = BatteryTask()..type = BatteryTaskType.fullCharge;
    final batteryTaskCharging = BatteryTask()..type = BatteryTaskType.charging;
    final batteryTaskSwitchOffConnections = BatteryTask()
      ..type = BatteryTaskType.switchOffConnections;
    final batteryTaskLowBatteryLevel = BatteryTask()..type = BatteryTaskType.lowBattery;
    final batteryTaskHightBatteryLevel = BatteryTask()..type = BatteryTaskType.hightBattery;
    final finalbatteryTaskDarkMode = BatteryTask()..type = BatteryTaskType.darkMode;
    final batteryTaskOptimizeScreenWork = BatteryTask()..type = BatteryTaskType.optimizeScreenWork;

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

  Future<BatteryTask?> getFirstInstance() async => _isarHelper.isar?.batteryTasks.get(1);

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
    await _isarHelper.writeTxn(
      crudCallBack: () async => await _isarHelper.isar?.batteryTasks.put(object),
    );
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
    await _isarHelper.writeTxn(
      crudCallBack: () async => await _isarHelper.isar?.batteryTasks.put(editetObject),
    );
  }
}
