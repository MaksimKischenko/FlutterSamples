import 'package:isar/isar.dart';
import 'package:optimal_prime/domain/entities/isar/battery_task.dart';
import 'package:optimal_prime/domain/entities/isar/user.dart';
import 'package:path_provider/path_provider.dart';

class IsarHelper<T> {
  Isar? isar;
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [BatteryTaskSchema, UserSchema],
      directory: dir.path,
    );
  }

  Future<void> writeTxn({required Future<T> Function() crudCallBack}) async {
    await isar?.writeTxn(crudCallBack);
  }
}
