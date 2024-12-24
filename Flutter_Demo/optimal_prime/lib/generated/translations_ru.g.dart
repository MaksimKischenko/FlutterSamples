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
	String get title1 => 'Просканируем состояние';
	String get description1 => 'Приложение будет собирать данные о состоянии вашего аккумулятора для повышения эффективности работы и продления времени его автономной работы.';
	String get title2 => 'Покажем динамику';
	String get description2 => 'Приложение будет показывать постоянную динамику состояния вашего аккумулятора по заданным отрезкам времени.';
	String get title3 => 'Найдем баланс';
	String get description3 => 'Мы найдем оптимальный баланс в использовании батареи, который гарантированно продлит срок её службы и сохранит её здоровье.';
}

// Path: mobileScreens.home
class TranslationsMobileScreensHomeRu {
	TranslationsMobileScreensHomeRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsMobileScreensHomeBatteryInfoRu batteryInfo = TranslationsMobileScreensHomeBatteryInfoRu.internal(_root);
}

// Path: mobileScreens.home.batteryInfo
class TranslationsMobileScreensHomeBatteryInfoRu {
	TranslationsMobileScreensHomeBatteryInfoRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get levelTitle => 'Уровень заряда батареи';
	String get saveMode => 'Режим энергосбережения';
	String get saveModeOff => 'Выключен';
	String get chargingStateTitle => 'Состояние зарядки';
	late final TranslationsMobileScreensHomeBatteryInfoChargingStateRu chargingState = TranslationsMobileScreensHomeBatteryInfoChargingStateRu.internal(_root);
	String get timeToChargeTitle => 'Время до полной зарядки';
	late final TranslationsMobileScreensHomeBatteryInfoTimeToChargeStateRu timeToChargeState = TranslationsMobileScreensHomeBatteryInfoTimeToChargeStateRu.internal(_root);
}

// Path: mobileScreens.home.batteryInfo.chargingState
class TranslationsMobileScreensHomeBatteryInfoChargingStateRu {
	TranslationsMobileScreensHomeBatteryInfoChargingStateRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get full => 'Полностью заряжен';
	String get charging => 'Заряжается...';
	String get discharging => 'Разряжается';
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
