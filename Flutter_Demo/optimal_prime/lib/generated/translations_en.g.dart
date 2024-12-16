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
}
