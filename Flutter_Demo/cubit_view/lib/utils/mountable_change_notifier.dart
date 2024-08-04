import 'package:flutter/material.dart';

/// Extend ChangeNotifier to track the mounted status, similar to
/// [StatefulWidget]s.
///
/// Since it tries to safely invoke notifyListeners, it should be the first
/// mixin in the with clause (so that it runs before any other potential
/// overrides of notifyListeners).
///
/// https://github.com/rrousselGit/provider/issues/78
mixin Mountable on ChangeNotifier {
  /// Start off as mounted.
  bool _mounted = true;

  @override
  void dispose() {
    // Unmount when disposed.
    _mounted = false;
    super.dispose();
  }

  /// Return true if we haven't yet been disposed.
  ///
  /// This is meant to emulate the [StatefulWidget.mounted] property for change
  /// notifiers that we use as our view models.
  bool get mounted => _mounted;

  /// Notify listeners only if we haven't been disposed.
  @override
  void notifyListeners() {
    if (mounted) {
      super.notifyListeners();
    }
  }
}
