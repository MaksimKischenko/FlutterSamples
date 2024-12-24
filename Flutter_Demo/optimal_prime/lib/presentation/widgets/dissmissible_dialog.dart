import 'package:flutter/material.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/paddings.dart';
import 'package:optimal_prime/utils/sizes.dart';

Future<T?> showDismissibleDialog<T>({
  required BuildContext context,
  required Function(BuildContext dialogContext) onDismissed,
  required Widget Function(BuildContext) dialogContent,
  Function(BuildContext dialogContext)? onDismissedByTimer,
  bool barrierDismissible = false,
  bool canPop = false,
}) async {
  const offsetBegin = Offset(0, 1);
  const offsetEnd = Offset.zero;
  const curve = Curves.linear;
  const dismissibleKey = Key('Dismissibledialog');

  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    pageBuilder: (dialogContext, animation, __) {
      onDismissedByTimer?.call(dialogContext);
      return SlideTransition(
        position: Tween<Offset>(
          begin: offsetBegin,
          end: offsetEnd,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: curve,
          ),
        ),
        child: PopScope(
          canPop: canPop,
          child: Dismissible(
            key: dismissibleKey,
            direction: DismissDirection.down,
            onDismissed: (direction) {
              onDismissed.call(dialogContext);
            },
            child: AlertDialog(
              alignment: Alignment.bottomCenter,
              shape: const RoundedRectangleBorder(
                borderRadius: KSize.radiusLBorderRadius,
              ),
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.symmetric(
                horizontal: KSize.margin4x,
                vertical: context.safeBottomPadding,
              ), //
              content: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: KSize.platformBreakpoint,
                ),
                child: Padding(
                  padding: MaterialPadding.all,
                  child: dialogContent.call(dialogContext),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
