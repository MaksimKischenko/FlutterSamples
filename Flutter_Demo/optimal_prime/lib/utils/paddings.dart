import 'package:flutter/widgets.dart';
import 'package:optimal_prime/utils/sizes.dart';

/// Helper class contains vertical and horizontal paddings
/// Name convention according Material design
class MaterialPadding {
  static const EdgeInsets all = EdgeInsets.all(KSize.margin4x);

  static const EdgeInsets vertical = EdgeInsets.symmetric(vertical: KSize.margin4x);

  static const EdgeInsets horizontal = EdgeInsets.symmetric(horizontal: KSize.margin4x);

  static const EdgeInsets top = EdgeInsets.only(top: KSize.margin4x);

  static const EdgeInsetsGeometry start = EdgeInsetsDirectional.only(start: KSize.margin4x);

  static const EdgeInsetsGeometry end = EdgeInsetsDirectional.only(end: KSize.margin4x);

  static const EdgeInsets bottom = EdgeInsets.only(bottom: KSize.margin4x);

  MaterialPadding._();
}
