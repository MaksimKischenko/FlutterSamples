import 'package:isar/isar.dart';

part 'battery_task.g.dart';

@collection
class BatteryTask {
  Id id = Isar.autoIncrement;
  String? description;
  String? advice;
  String? urlLink;
  BatteryTaskState? state;

  @enumerated
  BatteryTaskType type = BatteryTaskType.saveMode;
}

enum BatteryTaskType {
  saveMode(100, 'https://www.apple.com/batteries/maximizing-performance/?utm_source=chatgpt.com'),
  fullCharge(250,
      'https://www.techadvisor.com/article/727861/how-to-properly-charge-a-phone-battery.html#:~:text=not%20too%20high.-,Should%20I%20charge%20my%20phone%20battery%20to%20100%25%3F,-No%2C%20or%20at'),
  charging(300,
      'https://www.reddit.com/r/AndroidQuestions/comments/189kiqy/what_is_the_most_optimal_phone_charging_practice/'),
  switchOffConnections(
      450, 'https://discussions.apple.com/thread/254818411?utm_source=chatgpt.com&sortBy=rank'),
  lowBattery(550,
      'https://batteryuniversity.com/article/bu-409-charging-lithium-ion?utm_source=chatgpt.com'),
  hightBattery(700,
      'https://electronics.stackexchange.com/questions/623358/wouldnt-charging-a-lithium-battery-to-80-only-defeat-the-purpose-of-putting-th?utm_source=chatgpt.com'),
  darkMode(1000,
      'https://www.purdue.edu/newsroom/archive/releases/2021/Q3/dark-mode-may-not-save-your-phones-battery-life-as-much-as-you-think%2C-but-there-are-a-few-silver-linings.html?utm_source=chatgpt.com#:~:text=Let%E2%80%99s%20say%20that,in%20light%20mode.'),
  optimizeScreenWork(1500,
      'https://www.thescottishsun.co.uk/tech/13743681/android-battery-life-improve-charge-extra-extreme-saver/?utm_source=chatgpt.com');

  const BatteryTaskType(this.totalPoints, this.urlLink);
  final int totalPoints;
  final String urlLink;
}

@embedded
class BatteryTaskState {
  bool? isEnabled;
  bool? isFinished;
  DateTime? startDate;
  DateTime? finishDate;
}
