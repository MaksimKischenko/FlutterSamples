import 'package:flutter/material.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/sizes.dart';

class AppColors {
  const AppColors._();

  static const double opacityFullyOpaque = 1;
  static const double opacityHalfTransparent = 0.5;

  // background
  static const Color background = Color(0xFFF6F3EE);

  static const Color neutral92 = Color(0xFFE9E9E5);

  static const Color neutral35 = Color(0xFF4F5F56);

  // Greenish black 100
  static const Color onBackground = Color(0xFF183224);

  static const Color onBackgroundLight = Color(0xFF412D00);
  // Green new
  static const Color primary = Color(0xFF2AAA5B);

  // Pure white
  static const Color onPrimary = Color(0xFFFFFFFF);

  // Neutral90 as per M3 naming (former Greenish black 12)
  static const Color tertiaryContainer = Color(0xFFE1E3DF);

  // Greenish black 40
  static const Color onTertiaryContainer = Color(0xFFA3ADA7);

  // background: #E57077;
  static const Color error = Color(0xFFE57077);

  // error light: #FFDADA;
  static const Color errorLight = Color(0xFFFFDADA);

  // error dark: #FFDADA;
  static const Color errorDark = Color(0xFF630C1B);

  // Neutral-variant50 as per M3 naming (former Greenish black 60)
  static const Color onSurfaceVariant = Color(0xFF707974);

  // Status process
  static const Color yellow = Color(0xFFE0A623);

  static const Color tertiary35 = Color(0xFF896202);

  static const Color yellowLight = Color(0xFFFFDEA6);

  // Blue new
  static const Color blue = Color(0xFF3073C2);

  // boss-red
  static const Color bossRed = Color(0xFFE21B23);

  // saving-pass
  static const Color orange = Color(0xFFEE981D);

  // surface tint
  static const Color surfaceTint = Colors.transparent;

  // linear gradient colors
  static const Color linearGradientStart = Color(0xFF13A213);

  static const Color linearGradientEnd = Color(0xFF55D485);

  // 20% opacity white on top of primary color
  static const Color white20OnPrimary = Color(0xFFA6DBBA);

  static const Color primaryContainer = Color(0xFFD2EEDD);

  static const Color onPrimaryContainer = Color(0xFF005226);

  static const Color backgroundOfTabSwitcher = Color(0xFFEEE4D3);

  static const Color greyedOutText = Color(0xFF707974);

  static const Color highlightedText = Color(0xFFFFDEA6);

  static const Color dividerColor = Color(0xFFE1E3DF);

  static const Color secondary = Color(0xFF3073C2);

  static const Color secondaryContainer = Color(0xFFEBF1FF);

  static const Color onSecondaryContainer = Color(0xFF004786);

  static const Color darkRed = Color(0xffd40078);

  static const Color bossRedWithPink = Color(0xffe1232e);

  static const Color bossPink = Color(0xffe12395);

  static const Color bossLink = Color(0xFF1565C0);

  static const Color splashColor = Color(0x1ADEDDD9);

  static const Color insuranceColor = Color(0xFF0166DD);

  static const Color insuranceGradientColor = Color(0xFF0075FF);

  static const Color insuranceDarkGradientColor = Color(0xFF0060D0);

  static const Color insuranceButtonColor = Color(0xFF183224);

  static const Color chevronColor = Color(0xFF71786E);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      linearGradientStart,
      linearGradientEnd,
    ],
    begin: Alignment(-1, 0.5),
    end: Alignment(1, -0.5),
  );

  // box primary shadow
  static const Color boxPrimaryShadow = Color(0xFF00D42F);

  static const LinearGradient shimmerGradient = LinearGradient(
    colors: [
      tertiaryContainer,
      onPrimary,
      tertiaryContainer,
    ],
    stops: [
      0.1,
      0.3,
      0.5,
    ],
    begin: Alignment(-1, -0.15),
    end: Alignment(1, 0.15),
    tileMode: TileMode.clamp,
  );

  static List<BoxShadow> fancyButtonShadow(Color color) => [
        BoxShadow(
          color: color.withOpacity(0.15),
          offset: const Offset(0, 4),
          blurRadius: 14,
        ),
        BoxShadow(
          color: color.withOpacity(0.22),
          offset: const Offset(0, 4),
          blurRadius: 7,
          spreadRadius: 2,
        ),
      ];
}

class BaseMoneyFontFamilies {
  const BaseMoneyFontFamilies._();

  static const String idtSans = 'IDT Sans';
}

enum BaseMoneyButtonSizeType {
  page,
  dialog;

  double get buttonHeight {
    switch (this) {
      case BaseMoneyButtonSizeType.page:
        return KSize.buttonHeightLarge;
      case BaseMoneyButtonSizeType.dialog:
        return KSize.buttonHeightXS;
    }
  }
}

class AppTheme {
  const AppTheme._();

  static const double tabSwitcherRadius = 10;
  static const double radiusDefault = 12;
  static const BorderRadius defaultBorderRadius = BorderRadius.all(
    Radius.circular(AppTheme.radiusDefault),
  );

  static const double _radiusDouble = 24;
  static const BorderRadius doubleDefaultBorderRadius = BorderRadius.all(
    Radius.circular(AppTheme._radiusDouble),
  );

  static BoxShadow defaultBoxShadow = BoxShadow(
    color: Colors.black.withOpacity(0.16),
    offset: const Offset(0, 2),
    spreadRadius: 0,
    blurRadius: 4,
  );

  static BoxShadow coloredBoxShadow(Color color) => BoxShadow(
        color: color,
        offset: const Offset(0, 4),
        spreadRadius: 4,
        blurRadius: 12,
      );

  //https://www.figma.com/file/za4Za3P34ZoCPqktou5i8C/%F0%9F%92%B8-BOSSMoney-(Flutter)?type=design&node-id=12820-62508&mode=design&t=oeIW2Xvs2CkPakig-0
  static BoxShadow floatingSectionShadowOverBeigeColor = BoxShadow(
    color: Colors.black.withOpacity(0.07),
    offset: const Offset(0, 3),
    spreadRadius: 10,
    blurRadius: 15,
  );

  static final _displayLarge = _bodyBase.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    height: 1.12,
  );

  static final _displayMedium = _bodyBase.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  /// Double check why it used in buttons (Submit, ...) and expected value from Figma
  static final _displaySmall = _bodyBase.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final _headlineLarge = _bodyBase.copyWith(
    fontSize: 37,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    height: 1.28,
  );

  static final _headlineMedium = _bodyBase.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    height: 1.125,
  );

  static final _headlineSmall = _bodyBase.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    height: 1.25,
  );

  static final _titleLarge = _bodyBase.copyWith(
    fontSize: 21,
    fontWeight: FontWeight.w600,
  );

  static final _titleMedium = _bodyBase.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.11,
  );

  static final _titleSmall = _bodyBase.copyWith(
    fontWeight: FontWeight.w500,
    height: 1.25,
  );

  /// Aka default text style for common text components according to Figma
  static const _bodyBase = TextStyle(
    fontFamily: BaseMoneyFontFamilies.idtSans,
    package: 'core',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.onBackground,
  );

  static final _bodyLarge = _bodyBase.copyWith(
    height: 1.25,
    letterSpacing: 0,
  );

  static final _bodyMedium = _bodyLarge.copyWith(
    fontSize: 14,
    height: 1.14,
  );

  static final _bodySmall = _bodyLarge.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static final _labelLarge = _bodyBase.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.28,
  );

  static final _labelMedium = _bodyLarge.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final _labelSmall = _bodyLarge.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

  static ThemeData light(
    BuildContext context, {
    Color? primary,
    Color? background,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? surface,
  }) =>
      ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          onSurface: AppColors.onBackground,
          primary: primary ?? AppColors.primary,
          onPrimary: AppColors.onPrimary,
          outline: AppColors.neutral92,
          tertiaryContainer: AppColors.tertiaryContainer,
          onTertiaryContainer: AppColors.onTertiaryContainer,
          onSurfaceVariant: AppColors.onSurfaceVariant,
          error: AppColors.error,
          errorContainer: AppColors.errorLight,
          onErrorContainer: AppColors.errorDark,
          surfaceTint: AppColors.surfaceTint,
          tertiary: AppColors.yellow,
          onTertiary: AppColors.yellowLight,
          primaryContainer: AppColors.primaryContainer,
          onPrimaryContainer: AppColors.onPrimaryContainer,
          secondary: secondary ?? AppColors.secondary,
          secondaryContainer: secondaryContainer ?? AppColors.secondaryContainer,
          onSecondaryContainer: AppColors.onSecondaryContainer,
          onSecondary: onSecondary ?? Colors.black,
          surface: surface ?? AppColors.background,
        ),
        // Based on the design specification the `height` should be set in many of the styles.
        // The following issue arises: the height is only adjusted at the top of the style,
        // at the bottom not which leads to the text not being centered anymore.
        // Can be tested by adding a colored box around the text and playing with the height.
        textTheme: context.textTheme.copyWith(
          /// 32w600
          displayLarge: _displayLarge,

          /// 24w600
          displayMedium: _displayMedium,

          /// 20w600
          displaySmall: _displaySmall,

          /// 37w600
          headlineLarge: _headlineLarge,

          /// 32w600
          headlineMedium: _headlineMedium,

          /// 24w600
          headlineSmall: _headlineSmall,

          /// 21w600
          titleLarge: _titleLarge,

          /// 18w600
          titleMedium: _titleMedium,

          /// 16w600
          titleSmall: _titleSmall,

          /// 16w400
          bodyLarge: _bodyLarge,

          /// 14w400
          bodyMedium: _bodyMedium,

          /// 12w500
          bodySmall: _bodySmall,

          /// 15w400
          labelLarge: _labelLarge,

          /// 12w400
          labelMedium: _labelMedium,

          /// 10w500
          labelSmall: _labelSmall,
        ),
      ).copyWith(
        splashColor: AppColors.splashColor,
        brightness: Brightness.light,
        scaffoldBackgroundColor: background ?? AppColors.background,
        dialogBackgroundColor: AppColors.onPrimary,
        dividerColor: AppColors.dividerColor,
        snackBarTheme: context.theme.snackBarTheme.copyWith(
          backgroundColor: AppColors.onSurfaceVariant,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.onPrimary),
            borderRadius: KSize.defaultBorderRadius,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.onPrimary),
            borderRadius: KSize.defaultBorderRadius,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.onPrimary),
            borderRadius: KSize.defaultBorderRadius,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.error),
            borderRadius: KSize.defaultBorderRadius,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.error),
            borderRadius: KSize.defaultBorderRadius,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.onPrimary),
            borderRadius: KSize.defaultBorderRadius,
          ),
          fillColor: AppColors.onPrimary,
          filled: true,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size(double.infinity, KSize.buttonHeightLarge),
            shape: const RoundedRectangleBorder(borderRadius: defaultBorderRadius),
            textStyle: _titleMedium,
            elevation: KSize.elevationDefault,
            disabledBackgroundColor: AppColors.tertiaryContainer,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(0, KSize.buttonHeightS),
            shape: const RoundedRectangleBorder(borderRadius: defaultBorderRadius),
            textStyle: _bodyLarge.copyWith(fontWeight: FontWeight.w500),
            elevation: KSize.elevationDefault,
            disabledBackgroundColor: AppColors.tertiaryContainer,
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.onPrimary,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: background ?? AppColors.background,
          iconTheme: const IconThemeData(color: AppColors.onBackground),
        ),
      );
}

class AppCustomTheme extends StatelessWidget {
  const AppCustomTheme({
    this.themeData,
    required this.builder,
    super.key,
  });

  final ThemeData? themeData;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) => Theme(
        data: themeData ?? AppTheme.light(context),
        child: Builder(
          builder: builder,
        ),
      );
}

typedef ThemeDataBuilder = ThemeData Function(BuildContext context);
