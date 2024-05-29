// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/services.dart';

/// This class includes the implementation for [EventChannel] to listen to value
/// changes from the Accelerometer sensor from native side. It has a [readings]
/// getter to provide a stream of [AccelerometerReadings].
class BReceiver {
  static const _eventChannel = EventChannel('eventChanneBReciever');

  /// Method responsible for providing a stream of [AccelerometerReadings] to listen
  /// to value changes from the Accelerometer sensor.
  static Stream<bool> get readings {
    return _eventChannel.receiveBroadcastStream().map(
          (dynamic event) => event as bool
    );
  }
}
