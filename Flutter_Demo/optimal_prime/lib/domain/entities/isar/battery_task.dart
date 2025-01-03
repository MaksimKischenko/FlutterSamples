import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:optimal_prime/generated/translations.g.dart';

part 'battery_task.g.dart';

@collection
class BatteryTask {
  Id id = Isar.autoIncrement;
  TaskState? state;
  @enumerated
  BatteryTaskType type = BatteryTaskType.saveMode;
}

enum BatteryTaskType {
  saveMode,
  fullCharge,
  charging,
  switchOffConnections,
  lowBattery,
  hightBattery,
  darkMode,
  optimizeScreenWork,
}

extension BatteryTaskTypeExtension on BatteryTaskType {
  String getUrlLinks() {
    switch (this) {
      case BatteryTaskType.saveMode:
        return 'https://www.apple.com/batteries/maximizing-performance/?utm_source=chatgpt.com';
      case BatteryTaskType.fullCharge:
        return 'https://www.techadvisor.com/article/727861/how-to-properly-charge-a-phone-battery.html#:~:text=not%20too%20high.-,Should%20I%20charge%20my%20phone%20battery%20to%20100%25%3F,-No%2C%20or%20at';
      case BatteryTaskType.charging:
        return 'https://www.reddit.com/r/AndroidQuestions/comments/189kiqy/what_is_the_most_optimal_phone_charging_practice/';
      case BatteryTaskType.switchOffConnections:
        return 'https://discussions.apple.com/thread/254818411?utm_source=chatgpt.com&sortBy=rank';
      case BatteryTaskType.lowBattery:
        return 'https://batteryuniversity.com/article/bu-409-charging-lithium-ion?utm_source=chatgpt.com';
      case BatteryTaskType.hightBattery:
        return 'https://electronics.stackexchange.com/questions/623358/wouldnt-charging-a-lithium-battery-to-80-only-defeat-the-purpose-of-putting-th?utm_source=chatgpt.com';
      case BatteryTaskType.darkMode:
        return 'https://www.purdue.edu/newsroom/archive/releases/2021/Q3/dark-mode-may-not-save-your-phones-battery-life-as-much-as-you-think%2C-but-there-are-a-few-silver-linings.html?utm_source=chatgpt.com#:~:text=Let%E2%80%99s%20say%20that,in%20light%20mode.';
      case BatteryTaskType.optimizeScreenWork:
        return 'https://www.thescottishsun.co.uk/tech/13743681/android-battery-life-improve-charge-extra-extreme-saver/?utm_source=chatgpt.com';
    }
  }

  int getPoints() {
    switch (this) {
      case BatteryTaskType.saveMode:
        return 100;
      case BatteryTaskType.fullCharge:
        return 250;
      case BatteryTaskType.charging:
        return 350;
      case BatteryTaskType.switchOffConnections:
        return 500;
      case BatteryTaskType.lowBattery:
        return 750;
      case BatteryTaskType.hightBattery:
        return 1000;
      case BatteryTaskType.darkMode:
        return 1200;
      case BatteryTaskType.optimizeScreenWork:
        return 1500;
    }
  }

  String getAdvice(BuildContext context) {
    switch (this) {
      case BatteryTaskType.saveMode:
        return context.t.mobileScreens.tasks.saveMode.advice;
      case BatteryTaskType.fullCharge:
        return context.t.mobileScreens.tasks.fullCharge.advice;
      case BatteryTaskType.charging:
        return context.t.mobileScreens.tasks.charging.advice;
      case BatteryTaskType.switchOffConnections:
        return context.t.mobileScreens.tasks.switchOffConnections.advice;
      case BatteryTaskType.lowBattery:
        return context.t.mobileScreens.tasks.lowBatteryLevel.advice;
      case BatteryTaskType.hightBattery:
        return context.t.mobileScreens.tasks.highBatteryLevel.advice;
      case BatteryTaskType.darkMode:
        return context.t.mobileScreens.tasks.darkMode.advice;
      case BatteryTaskType.optimizeScreenWork:
        return context.t.mobileScreens.tasks.optimizeScreenWork.advice;
    }
  }

  String getTitle(BuildContext context) {
    switch (this) {
      case BatteryTaskType.saveMode:
        return context.t.mobileScreens.tasks.saveMode.title;
      case BatteryTaskType.fullCharge:
        return context.t.mobileScreens.tasks.fullCharge.title;
      case BatteryTaskType.charging:
        return context.t.mobileScreens.tasks.charging.title;
      case BatteryTaskType.switchOffConnections:
        return context.t.mobileScreens.tasks.switchOffConnections.title;
      case BatteryTaskType.lowBattery:
        return context.t.mobileScreens.tasks.lowBatteryLevel.title;
      case BatteryTaskType.hightBattery:
        return context.t.mobileScreens.tasks.highBatteryLevel.title;
      case BatteryTaskType.darkMode:
        return context.t.mobileScreens.tasks.darkMode.title;
      case BatteryTaskType.optimizeScreenWork:
        return context.t.mobileScreens.tasks.optimizeScreenWork.title;
    }
  }

  String getDescription(BuildContext context) {
    switch (this) {
      case BatteryTaskType.saveMode:
        return context.t.mobileScreens.tasks.saveMode.description;
      case BatteryTaskType.fullCharge:
        return context.t.mobileScreens.tasks.fullCharge.description;
      case BatteryTaskType.charging:
        return context.t.mobileScreens.tasks.charging.description;
      case BatteryTaskType.switchOffConnections:
        return context.t.mobileScreens.tasks.switchOffConnections.description;
      case BatteryTaskType.lowBattery:
        return context.t.mobileScreens.tasks.lowBatteryLevel.description;
      case BatteryTaskType.hightBattery:
        return context.t.mobileScreens.tasks.highBatteryLevel.description;
      case BatteryTaskType.darkMode:
        return context.t.mobileScreens.tasks.darkMode.description;
      case BatteryTaskType.optimizeScreenWork:
        return context.t.mobileScreens.tasks.optimizeScreenWork.description;
    }
  }

  String getName(BuildContext context) {
    switch (this) {
      case BatteryTaskType.saveMode:
        return context.t.mobileScreens.tasks.saveMode.name;
      case BatteryTaskType.fullCharge:
        return context.t.mobileScreens.tasks.fullCharge.name;
      case BatteryTaskType.charging:
        return context.t.mobileScreens.tasks.charging.name;
      case BatteryTaskType.switchOffConnections:
        return context.t.mobileScreens.tasks.switchOffConnections.name;
      case BatteryTaskType.lowBattery:
        return context.t.mobileScreens.tasks.lowBatteryLevel.name;
      case BatteryTaskType.hightBattery:
        return context.t.mobileScreens.tasks.highBatteryLevel.name;
      case BatteryTaskType.darkMode:
        return context.t.mobileScreens.tasks.darkMode.name;
      case BatteryTaskType.optimizeScreenWork:
        return context.t.mobileScreens.tasks.optimizeScreenWork.name;
    }
  }
}

@embedded
class TaskState {
  bool? isEnabled;
  bool? isFinished;
  DateTime? startDate;
  DateTime? finishDate;
}
