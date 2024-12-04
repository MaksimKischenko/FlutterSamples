import 'package:flutter/widgets.dart';

/// LifecycleWatcher is an utility class to watch the lifecycle of the app,
/// for instance the user of this class can be notified when the app is
/// detached, or resumed
class LifecycleWatcher extends WidgetsBindingObserver {
  LifecycleWatcher({
    this.onDetached,
    this.onResumed,
    this.onInactive,
    this.onPaused,
    this.onHidden,
  });

  final VoidCallback? onDetached;
  final VoidCallback? onResumed;
  final VoidCallback? onInactive;
  final VoidCallback? onPaused;
  final VoidCallback? onHidden;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        onInactive?.call();

        break;
      case AppLifecycleState.paused:
        onPaused?.call();
        break;
      case AppLifecycleState.detached:
        onDetached?.call();
        break;
      case AppLifecycleState.resumed:
        onResumed?.call();
        break;
      case AppLifecycleState.hidden:
        onHidden?.call();
        break;
    }
  }
}
