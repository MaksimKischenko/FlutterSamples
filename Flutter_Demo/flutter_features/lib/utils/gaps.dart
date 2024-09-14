
import 'package:flutter/material.dart';
import 'package:flutter_features/utils/sizes.dart';

/// Helper class contains vertical and horizontal constants of SizedBoxes widget,
/// Name convention according Material design
class Gap {
  /// Private constructor to prevent this class from being instantiated
  Gap._();

  ///height: [KSize.margin4point5x]=18dp
  static const margin4point5x = SizedBox(height: KSize.margin4point5x);

  ///height: [KSize.margin5xHalf]=22dp
  static const margin5xHalf = SizedBox(height: KSize.margin5xHalf);

  ///height: [KSize.margin4x]=16dp
  static const verticalMaterial = SizedBox(height: KSize.margin4x);

  ///height: [KSize.margin3x]=12dp
  static const verticalMaterialSmall = SizedBox(height: KSize.margin3x);

  ///height: [KSize.margin2x]=8dp
  static const verticalMaterialHalf = SizedBox(height: KSize.margin2x);

  ///width: [KSize.margin4x]=16dp
  static const horizontalMaterial = SizedBox(width: KSize.margin4x);

  ///width: [KSize.margin3x]=12dp
  static const horizontalMaterialSmall = SizedBox(width: KSize.margin3x);

  ///width: [KSize.margin2x]=8dp
  static const horizontalMaterialHalf = SizedBox(width: KSize.margin2x);

  ///Shrink SizedBox
  static const shrink = SizedBox.shrink();
}
