
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'accelerometer_event_channel.dart';
import 'breciever_event_channel.dart';


/// Demonstrates how to use [EventChannel] to listen continuous values
/// of Accelerometer Sensor from platform.
///
/// The widget uses a [StreamBuilder] to rebuild it's descendant whenever it
/// listens a new value from the [Accelerometer.readings] stream. It has three
/// [Text] widgets to display the value of [AccelerometerReadings.x],
/// [AccelerometerReadings.y], and [AccelerometerReadings.z] respectively.
class BreceiverChannelDemo extends StatelessWidget {
  const BreceiverChannelDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineSmall;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BreceiverChannelDemo'),
      ),
      body: Center(
        child: StreamBuilder<bool>(
          stream: BReceiver.readings,
          builder: (context, snapshot) {
            return switch (snapshot) {
              AsyncSnapshot(hasError: true) =>
                Text((snapshot.error as PlatformException).message!),
              AsyncSnapshot(hasData: true) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data.toString())
                  ],
                ),
              _ => Text('No Data Available', style: textStyle),
            };
          },
        ),
      ),
    );
  }
}
