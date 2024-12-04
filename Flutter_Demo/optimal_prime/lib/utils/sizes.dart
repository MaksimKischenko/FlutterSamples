import 'package:flutter/cupertino.dart';

/// Constants for margins, font sizes and other layout related parameters.
class KSize {
  /// Margins are based roughly on a 4x4 grid.
  static const double marginMinimum = 1;
  static const double marginHalf = 2;
  static const double marginThreeQuarters = 3;
  static const double margin1x = 4;
  static const double margin1Halfx = 6;
  static const double margin1xHalf2 = 7;

  /// Space, size 8dp, See also [Gap.verticalMaterialHalf] or [Gap.horizontalMaterialHalf]
  static const double margin2x = 8;
  static const double margin2Halfx = 10;

  /// Space, size 12dp, See also [Gap.verticalMaterialSmall] or [Gap.horizontalMaterialSmall]
  static const double margin3x = 12;
  static const double margin3Halfx = 14;

  /// Space, size 16dp, See also [MaterialPadding.all], [Gap.verticalMaterial] or [Gap.horizontalMaterial]
  static const double margin4x = 16;
  static const double margin4point5x = 18;

  /// Space, size 20dp
  static const double margin5x = 20;
  static const double margin5xHalf = 22;
  static const double margin6x = 24;
  static const double margin6xHalf = 26;
  static const double margin7x = 28;
  static const double margin7xHalf = 30;
  static const double margin8x = 32;
  static const double margin9x = 36;
  static const double margin9point5x = 38;
  static const double margin10x = 40;
  static const double margin10point5x = 42;
  static const double margin11x = 44;
  static const double margin12x = 48;
  static const double margin13x = 50;
  static const double margin14x = 54;
  static const double margin16x = 64;
  static const double margin17x = 74;
  static const double margin18x = 82;
  static const double margin20x = 90;
  static const double margin32x = 128;
  static const double margin33x = 132;
  static const double margin34x = 136;
  static const double margin35x = 140;
  static const double margin36x = 180;

  static const double radiusSmallExtra = 2;
  static const double radiusSmall = 4;
  static const double radiusDefault = 8;
  static const double radiusDefaultSmall = 10;
  static const double radiusDefaultMedium = 12;
  static const double radiusMedium = 16;
  static const double radiusLarge = 20;
  static const double radiusL = 24;
  static const double radiusLargeMedium = 27;
  static const double radiusLargeExtra = 32;
  static const double radius2XL = 40;
  static const double radiusLargeExtraExtra = 50;
  static const double radiusOfRoundButton = 100;
  static const double radiusAppBar = 70;

  static const double borderWidthVerySmall = 1;
  static const double borderWidthSmallHalf = 1.5;
  static const double borderWidthSmall = 2;
  static const double borderWidthMedium = 3;

  static const double fontSize4XS = 10;
  static const double fontSize3XS = 11;
  static const double fontSize2XS = 12;
  static const double fontSize2XSHalf = 13;
  static const double fontSizeXS = 14;
  static const double fontSizeXSHalf = 15;
  static const double fontSizeS = 16;
  static const double fontSizeM = 18;
  static const double fontSizeML = 19;
  static const double fontSizeL = 20;
  static const double fontSizeXL = 22;
  static const double fontSize2XL = 24;
  static const double fontSize3XL = 30;
  static const double fontSize3XLHalf = 32;
  static const double fontSize4XLHalf = 37;
  static const double fontSize4XL = 42;

  static const double avatar4XS = 12;
  static const double avatar3XS = 15;
  static const double avatar3XSHalf = 16;
  static const double avatar2XSHalf = 17;
  static const double avatar2S = 20;
  static const double avatar2XS = 21;
  static const double avatarXS = 30;
  static const double avatarXSHalf = 32;
  static const double avatarS = 40;
  static const double avatarM = 50;
  static const double avatarL = 60;
  static const double avatarLHalf = 70;
  static const double avatarXLHalf = 76;
  static const double avatarXL = 80;
  static const double avatar2XL = 100;
  static const double avatar3XL = 120;
  static const double avatar3XLHalf = 132;
  static const double avatar4XL = 160;

  static const double calendarGridHeight = 245;

  static const double elevationDefault = 2;
  static const double elevationMedium = 4;
  static const double elevationLarge = 8;

  /// Font weights available with our custom font assets (see `pubspec.yaml`).
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightMediumBold = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;

  static const int fileSizeLimitMb = 50;

  static const double buttonHeight2XS = 31;
  static const double buttonHeightXS = 34;
  static const double buttonHeightS = 36.5;
  static const double buttonHeightM = 44;
  static const double buttonHeightLHalf = 54;
  static const double buttonHeightL = 55;
  static const double buttonHeightLarge = 58;
  static const double buttonHeightXL = 70;
  static const double fancyButtonHeight = buttonHeightLarge;

  ///A copy of progress_indicator.dart _kMinCircularProgressIndicatorSize value 36.0
  static const double defaultCircularProgressIndicatorSize = 36;
  static const double defaultCircularProgressIndicatorSizeStrokeWidth = 4;

  static const double circularProgressIndicatorSizeS = 24;
  static const double circularProgressIndicatorSizeSStrokeWidth = 3;

  static const int fieldLengthS = 10;
  static const int fieldLengthNormal = 16;
  static const int fieldLengthM = 25;
  static const int fieldLengthML = 50;
  static const int fieldLengthL = 128;
  static const int fieldLengthXL = 200;

  static const Size appbarHeight = Size.fromHeight(50);
  static const double searchBarHeight = 35;

  static const double messageBoxWidthToScreenRatio = 0.8;

  static const int bottomSheetLoadingHeightPercent = 40;
  static const int bottomSheetErrorHeightPercent = 40;
  static const int bottomSheetDefaultMaxHeightPercent = 80;
  static const int searchableBottomSheetDefaultMinHeightPercent = 50;
  static const int searchableStateBottomSheetMinHeightPercent = 85;

  static const double platformBreakpoint = 700;
  static const double contentMaxWidth = 600;
  static const double contentMaxHeight = 700;
  static const double contentTopPadding = 250;

  static const double disabledOpacity = 0.3;
  static const double enabledOpacity = 1;

  static const BorderRadius defaultBorderRadius =
      BorderRadius.all(Radius.circular(radiusDefaultMedium));

  static const BorderRadius radiusLBorderRadius = BorderRadius.all(Radius.circular(radiusL));

  static const ShapeBorder bottomSheetShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(KSize.radiusL),
    ),
  );
}
