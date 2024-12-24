import 'package:flutter/foundation.dart';

mixin TargetPlatformService {
  bool get isIOSplatform => defaultTargetPlatform == TargetPlatform.iOS;
}
