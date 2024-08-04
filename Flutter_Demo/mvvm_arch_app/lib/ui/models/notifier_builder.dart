import 'package:flutter/widgets.dart';

typedef ChangeNotifierWidgetBuilder<T extends ChangeNotifier> = Widget Function(
  BuildContext context,
  T snapshot,
);

/// Listens to [ChangeNotifier]s and triggers rebuilds on events.
class ChangeNotifierBuilder<T extends ChangeNotifier> extends AnimatedWidget {
  final T notifier;
  final ChangeNotifierWidgetBuilder<T> builder;

  const ChangeNotifierBuilder({
    required this.notifier,
    required this.builder,
    Key? key
  }) : super(key: key, listenable: notifier);

  @override
  Widget build(BuildContext context) {
    return builder.call(context, notifier);
  }
}
