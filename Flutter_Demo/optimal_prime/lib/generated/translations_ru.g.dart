///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsRu = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  );

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final TranslationsMobileScreensRu mobileScreens = TranslationsMobileScreensRu.internal(_root);
}

// Path: mobileScreens
class TranslationsMobileScreensRu {
	TranslationsMobileScreensRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsMobileScreensSplashRu splash = TranslationsMobileScreensSplashRu.internal(_root);
	late final TranslationsMobileScreensIntroRu intro = TranslationsMobileScreensIntroRu.internal(_root);
	late final TranslationsMobileScreensHomeRu home = TranslationsMobileScreensHomeRu.internal(_root);
	late final TranslationsMobileScreensTasksRu tasks = TranslationsMobileScreensTasksRu.internal(_root);
}

// Path: mobileScreens.splash
class TranslationsMobileScreensSplashRu {
	TranslationsMobileScreensSplashRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get loadingMessage => 'Пожалуйста, подождите';
}

// Path: mobileScreens.intro
class TranslationsMobileScreensIntroRu {
	TranslationsMobileScreensIntroRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title1 => 'Проверка состояния батареи';
	String get description1 => 'Приложение соберет данные о состоянии вашей батареи для повышения ее эффективности и увеличения срока службы.';
	String get title2 => 'Отслеживайте динамику';
	String get description2 => 'Приложение покажет изменения состояния батареи за выбранный период времени.';
	String get title3 => 'Найдите баланс';
	String get description3 => 'Мы найдем оптимальный режим использования батареи для ее долгой работы.';
	String get title4 => 'Выполните несколько задач заранее';
	String get description4 => 'Чтобы мы могли лучше понять, с какой скоростью вы разряжаете батарею, заранее выполните несколько задач.';
	String get startButton => 'Давайте начнем';
}

// Path: mobileScreens.home
class TranslationsMobileScreensHomeRu {
	TranslationsMobileScreensHomeRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsMobileScreensHomeBatteryInfoRu batteryInfo = TranslationsMobileScreensHomeBatteryInfoRu.internal(_root);
}

// Path: mobileScreens.tasks
class TranslationsMobileScreensTasksRu {
	TranslationsMobileScreensTasksRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsMobileScreensTasksSaveModeRu saveMode = TranslationsMobileScreensTasksSaveModeRu.internal(_root);
	late final TranslationsMobileScreensTasksFullChargeRu fullCharge = TranslationsMobileScreensTasksFullChargeRu.internal(_root);
	late final TranslationsMobileScreensTasksChargingRu charging = TranslationsMobileScreensTasksChargingRu.internal(_root);
	late final TranslationsMobileScreensTasksSwitchOffConnectionsRu switchOffConnections = TranslationsMobileScreensTasksSwitchOffConnectionsRu.internal(_root);
	late final TranslationsMobileScreensTasksLowBatteryLevelRu lowBatteryLevel = TranslationsMobileScreensTasksLowBatteryLevelRu.internal(_root);
	late final TranslationsMobileScreensTasksHighBatteryLevelRu highBatteryLevel = TranslationsMobileScreensTasksHighBatteryLevelRu.internal(_root);
	late final TranslationsMobileScreensTasksDarkModeRu darkMode = TranslationsMobileScreensTasksDarkModeRu.internal(_root);
	late final TranslationsMobileScreensTasksOptimizeScreenWorkRu optimizeScreenWork = TranslationsMobileScreensTasksOptimizeScreenWorkRu.internal(_root);
}

// Path: mobileScreens.home.batteryInfo
class TranslationsMobileScreensHomeBatteryInfoRu {
	TranslationsMobileScreensHomeBatteryInfoRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get levelTitle => 'Уровень заряда';
	String get saveMode => 'Режим экономии';
	String get saveModeOff => 'Выключено';
	String get chargingStateTitle => 'Состояние зарядки';
	late final TranslationsMobileScreensHomeBatteryInfoChargingStateRu chargingState = TranslationsMobileScreensHomeBatteryInfoChargingStateRu.internal(_root);
	String get timeToChargeTitle => 'Время до зарядки';
	late final TranslationsMobileScreensHomeBatteryInfoTimeToChargeStateRu timeToChargeState = TranslationsMobileScreensHomeBatteryInfoTimeToChargeStateRu.internal(_root);
}

// Path: mobileScreens.tasks.saveMode
class TranslationsMobileScreensTasksSaveModeRu {
	TranslationsMobileScreensTasksSaveModeRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Режим экономии';
	String get title => 'Включите режим экономии';
	String get description => 'Режим экономии ограничивает фоновые процессы и снижает производительность устройства для уменьшения потребления энергии.';
	String get advice => 'Активируйте этот режим, когда заряд батареи низкий или необходимо продлить время работы устройства.';
}

// Path: mobileScreens.tasks.fullCharge
class TranslationsMobileScreensTasksFullChargeRu {
	TranslationsMobileScreensTasksFullChargeRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Полная зарядка';
	String get title => 'Зарядите до 100%';
	String get description => 'Зарядите устройство до 100% для калибровки батареи.';
	String get advice => 'Полная зарядка позволяет откалибровать индикатор батареи. Избегайте частой полной зарядки и поддерживайте уровень заряда в пределах 20-80%.';
}

// Path: mobileScreens.tasks.charging
class TranslationsMobileScreensTasksChargingRu {
	TranslationsMobileScreensTasksChargingRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Зарядка';
	String get title => 'Не используйте устройство во время зарядки';
	String get description => 'Оставьте устройство в покое во время зарядки.';
	String get advice => 'Избегайте использования устройства во время зарядки, чтобы предотвратить перегрев и снизить эффективность зарядки.';
}

// Path: mobileScreens.tasks.switchOffConnections
class TranslationsMobileScreensTasksSwitchOffConnectionsRu {
	TranslationsMobileScreensTasksSwitchOffConnectionsRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Отключите соединения';
	String get title => 'Отключите неиспользуемые соединения';
	String get description => 'Выключите Wi-Fi, Bluetooth и мобильные соединения, если они не используются.';
	String get advice => 'Эти соединения потребляют энергию, даже когда не используются. Отключите их для экономии заряда.';
}

// Path: mobileScreens.tasks.lowBatteryLevel
class TranslationsMobileScreensTasksLowBatteryLevelRu {
	TranslationsMobileScreensTasksLowBatteryLevelRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Низкий заряд';
	String get title => 'Заряжайте при низком уровне';
	String get description => 'Откройте приложение, когда заряд составляет 20-25%.';
	String get advice => 'Зарядите устройство, как только заряд упадет ниже 20%, чтобы избежать глубокого разряда.';
}

// Path: mobileScreens.tasks.highBatteryLevel
class TranslationsMobileScreensTasksHighBatteryLevelRu {
	TranslationsMobileScreensTasksHighBatteryLevelRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Высокий заряд';
	String get title => 'Избегайте перезарядки';
	String get description => 'Откройте приложение, когда заряд составляет 80-85%.';
	String get advice => 'Поддержание уровня заряда между 20% и 80% может значительно продлить срок службы батареи.';
}

// Path: mobileScreens.tasks.darkMode
class TranslationsMobileScreensTasksDarkModeRu {
	TranslationsMobileScreensTasksDarkModeRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Темный режим';
	String get title => 'Включите темный режим';
	String get description => 'Активируйте темный режим на устройстве.';
	String get advice => 'Темный режим может не всегда значительно экономить заряд батареи, но снижает нагрузку на глаза при слабом освещении.';
}

// Path: mobileScreens.tasks.optimizeScreenWork
class TranslationsMobileScreensTasksOptimizeScreenWorkRu {
	TranslationsMobileScreensTasksOptimizeScreenWorkRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Оптимизация экрана';
	String get title => 'Оптимизируйте яркость экрана';
	String get description => 'Настройте яркость экрана на оптимальный уровень (20-30%).';
	String get advice => 'Уменьшение яркости экрана может значительно снизить расход заряда, так как экран является одним из самых энергозатратных компонентов.';
}

// Path: mobileScreens.home.batteryInfo.chargingState
class TranslationsMobileScreensHomeBatteryInfoChargingStateRu {
	TranslationsMobileScreensHomeBatteryInfoChargingStateRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get full => 'Полностью заряжено';
	String get charging => 'Идет зарядка...';
	String get discharging => 'Теряет заряд';
	String get unknown => 'Определяем...';
}

// Path: mobileScreens.home.batteryInfo.timeToChargeState
class TranslationsMobileScreensHomeBatteryInfoTimeToChargeStateRu {
	TranslationsMobileScreensHomeBatteryInfoTimeToChargeStateRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get yes => 'Необходимо';
	String get no => 'Не требуется';
}
