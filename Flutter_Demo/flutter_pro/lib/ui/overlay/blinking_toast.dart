import 'package:flutter/material.dart';

import 'blinking_toast_widget.dart';

class BlinkingToast {
    bool _isVisible = false;

    ///
    /// BuildContext context: the context from which we need to retrieve the Overlay
    /// WidgetBuilder externalBuilder: (compulsory) external routine that builds the Widget to be displayed
    /// Duration duration: (optional) duration after which the Widget will be removed
    /// Offset position: (optional) position where you want to show the Widget
    ///
    void show({
        required BuildContext context,
        required WidgetBuilder externalBuilder, 
        Duration duration = const Duration(seconds: 2),
        Offset position = Offset.zero,
        }) async {

        // Prevent from showing multiple Widgets at the same time
        if (_isVisible){
            return;
        }

        _isVisible = true;

        final OverlayState overlayState = Overlay.of(context);
        final OverlayEntry overlayEntry = OverlayEntry(
            builder: (BuildContext context) => BlinkingToastWidget(
                widget: externalBuilder(context),
                position: position,
            ),
        );
        overlayState.insert(overlayEntry);

        await Future.delayed(duration);

        overlayEntry.remove();

        _isVisible = false;
    }
}