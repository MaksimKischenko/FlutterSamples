///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsEn extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final TranslationsEn _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsMobileScreensEn mobileScreens = _TranslationsMobileScreensEn._(_root);
}

// Path: mobileScreens
class _TranslationsMobileScreensEn extends TranslationsMobileScreensRu {
	_TranslationsMobileScreensEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMobileScreensSplashEn splash = _TranslationsMobileScreensSplashEn._(_root);
	@override late final _TranslationsMobileScreensIntroEn intro = _TranslationsMobileScreensIntroEn._(_root);
	@override late final _TranslationsMobileScreensHomeEn home = _TranslationsMobileScreensHomeEn._(_root);
	@override late final _TranslationsMobileScreensTasksEn tasks = _TranslationsMobileScreensTasksEn._(_root);
}

// Path: mobileScreens.splash
class _TranslationsMobileScreensSplashEn extends TranslationsMobileScreensSplashRu {
	_TranslationsMobileScreensSplashEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get loadingMessage => 'Please wait';
}

// Path: mobileScreens.intro
class _TranslationsMobileScreensIntroEn extends TranslationsMobileScreensIntroRu {
	_TranslationsMobileScreensIntroEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title1 => 'Scan Battery Health';
	@override String get description1 => 'The app will collect data on your battery\'s condition to improve its efficiency and extend its battery life.';
	@override String get title2 => 'Track the Dynamics';
	@override String get description2 => 'The app will display continuous battery health trends over specified time intervals.';
	@override String get title3 => 'Find the Balance';
	@override String get description3 => 'We will find the optimal battery usage balance to ensure prolonged battery life and health.';
	@override String get title4 => 'Complete several tasks in advance';
	@override String get description4 => 'So that we can better understand at what rate you are using up your battery - complete several tasks in advance.';
	@override String get startButton => 'Get Started';
}

// Path: mobileScreens.home
class _TranslationsMobileScreensHomeEn extends TranslationsMobileScreensHomeRu {
	_TranslationsMobileScreensHomeEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMobileScreensHomeBatteryInfoEn batteryInfo = _TranslationsMobileScreensHomeBatteryInfoEn._(_root);
}

// Path: mobileScreens.tasks
class _TranslationsMobileScreensTasksEn extends TranslationsMobileScreensTasksRu {
	_TranslationsMobileScreensTasksEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMobileScreensTasksSaveModeEn saveMode = _TranslationsMobileScreensTasksSaveModeEn._(_root);
	@override late final _TranslationsMobileScreensTasksFullChargeEn fullCharge = _TranslationsMobileScreensTasksFullChargeEn._(_root);
	@override late final _TranslationsMobileScreensTasksChargingEn charging = _TranslationsMobileScreensTasksChargingEn._(_root);
	@override late final _TranslationsMobileScreensTasksSwitchOffConnectionsEn switchOffConnections = _TranslationsMobileScreensTasksSwitchOffConnectionsEn._(_root);
	@override late final _TranslationsMobileScreensTasksLowBatteryLevelEn lowBatteryLevel = _TranslationsMobileScreensTasksLowBatteryLevelEn._(_root);
	@override late final _TranslationsMobileScreensTasksHighBatteryLevelEn highBatteryLevel = _TranslationsMobileScreensTasksHighBatteryLevelEn._(_root);
	@override late final _TranslationsMobileScreensTasksDarkModeEn darkMode = _TranslationsMobileScreensTasksDarkModeEn._(_root);
	@override late final _TranslationsMobileScreensTasksOptimizeScreenWorkEn optimizeScreenWork = _TranslationsMobileScreensTasksOptimizeScreenWorkEn._(_root);
}

// Path: mobileScreens.home.batteryInfo
class _TranslationsMobileScreensHomeBatteryInfoEn extends TranslationsMobileScreensHomeBatteryInfoRu {
	_TranslationsMobileScreensHomeBatteryInfoEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get levelTitle => 'Battery level';
	@override String get saveMode => 'Save Mode';
	@override String get saveModeOff => 'Off';
	@override String get chargingStateTitle => 'Charging state';
	@override late final _TranslationsMobileScreensHomeBatteryInfoChargingStateEn chargingState = _TranslationsMobileScreensHomeBatteryInfoChargingStateEn._(_root);
	@override String get timeToChargeTitle => 'Time to charge';
	@override late final _TranslationsMobileScreensHomeBatteryInfoTimeToChargeStateEn timeToChargeState = _TranslationsMobileScreensHomeBatteryInfoTimeToChargeStateEn._(_root);
}

// Path: mobileScreens.tasks.saveMode
class _TranslationsMobileScreensTasksSaveModeEn extends TranslationsMobileScreensTasksSaveModeRu {
	_TranslationsMobileScreensTasksSaveModeEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Save mode';
	@override String get title => 'Enable Power Saving Mode';
	@override String get description => 'Power saving mode limits background processes and reduces device performance to reduce power consumption.';
	@override String get advice => 'Activate this mode when the battery level is low or when you need to extend the battery life of the device.';
}

// Path: mobileScreens.tasks.fullCharge
class _TranslationsMobileScreensTasksFullChargeEn extends TranslationsMobileScreensTasksFullChargeRu {
	_TranslationsMobileScreensTasksFullChargeEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Full charge';
	@override String get title => 'Charge to 100%';
	@override String get description => 'Charge your device to 100% to calibrate the battery.';
	@override String get advice => 'Fully charging to 100% allows the device to calibrate the battery indicator. Avoid frequent full charging; maintain the charge level between 20% and 80%.';
}

// Path: mobileScreens.tasks.charging
class _TranslationsMobileScreensTasksChargingEn extends TranslationsMobileScreensTasksChargingRu {
	_TranslationsMobileScreensTasksChargingEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Charging';
	@override String get title => 'Do Not Use While Charging';
	@override String get description => 'Leave the device alone while charging.';
	@override String get advice => 'Avoid using the device while charging to prevent overheating and reduce charging efficiency.';
}

// Path: mobileScreens.tasks.switchOffConnections
class _TranslationsMobileScreensTasksSwitchOffConnectionsEn extends TranslationsMobileScreensTasksSwitchOffConnectionsRu {
	_TranslationsMobileScreensTasksSwitchOffConnectionsEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Switch off connections';
	@override String get title => 'Disable Unused Connections';
	@override String get description => 'Turn off Wi-Fi, Bluetooth, and mobile connections when not in use.';
	@override String get advice => 'These connections consume energy even when not in use. Disable them to save battery.';
}

// Path: mobileScreens.tasks.lowBatteryLevel
class _TranslationsMobileScreensTasksLowBatteryLevelEn extends TranslationsMobileScreensTasksLowBatteryLevelRu {
	_TranslationsMobileScreensTasksLowBatteryLevelEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Low battery';
	@override String get title => 'Charge at Low Levels';
	@override String get description => 'Open the app when the charge level is 20-25%.';
	@override String get advice => 'Charge your device as soon as the charge drops below 20% to avoid deep discharge.';
}

// Path: mobileScreens.tasks.highBatteryLevel
class _TranslationsMobileScreensTasksHighBatteryLevelEn extends TranslationsMobileScreensTasksHighBatteryLevelRu {
	_TranslationsMobileScreensTasksHighBatteryLevelEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'High battery';
	@override String get title => 'Avoid Overcharging';
	@override String get description => 'Open the app when the charge level is 80-85%.';
	@override String get advice => 'Keeping the battery level between 20% and 80% can significantly extend its life and reduce degradation.';
}

// Path: mobileScreens.tasks.darkMode
class _TranslationsMobileScreensTasksDarkModeEn extends TranslationsMobileScreensTasksDarkModeRu {
	_TranslationsMobileScreensTasksDarkModeEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Dark mode';
	@override String get title => 'Enable Dark Mode';
	@override String get description => 'Activate dark mode on your device.';
	@override String get advice => 'Dark mode may not always save much battery but can reduce strain on your eyes in low-light environments.';
}

// Path: mobileScreens.tasks.optimizeScreenWork
class _TranslationsMobileScreensTasksOptimizeScreenWorkEn extends TranslationsMobileScreensTasksOptimizeScreenWorkRu {
	_TranslationsMobileScreensTasksOptimizeScreenWorkEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Optimize screen work';
	@override String get title => 'Optimize Screen Brightness';
	@override String get description => 'Adjust screen brightness to an optimal level (20-30%).';
	@override String get advice => 'Reducing screen brightness can significantly reduce battery consumption, as the screen is one of the most energy-intensive components.';
}

// Path: mobileScreens.home.batteryInfo.chargingState
class _TranslationsMobileScreensHomeBatteryInfoChargingStateEn extends TranslationsMobileScreensHomeBatteryInfoChargingStateRu {
	_TranslationsMobileScreensHomeBatteryInfoChargingStateEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get full => 'Fully charged';
	@override String get charging => 'Charging...';
	@override String get discharging => 'Losing energy';
	@override String get unknown => 'Determining...';
}

// Path: mobileScreens.home.batteryInfo.timeToChargeState
class _TranslationsMobileScreensHomeBatteryInfoTimeToChargeStateEn extends TranslationsMobileScreensHomeBatteryInfoTimeToChargeStateRu {
	_TranslationsMobileScreensHomeBatteryInfoTimeToChargeStateEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get yes => 'Necessary';
	@override String get no => 'No';
}
