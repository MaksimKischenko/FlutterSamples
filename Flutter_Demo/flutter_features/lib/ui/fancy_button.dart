import 'package:flutter/material.dart';
import 'package:flutter_features/utils/utils.dart';

class FancyButton extends StatefulWidget implements PreferredSizeWidget {
  const FancyButton({
    super.key,
    required this.isLoading,
    required this.buttonText,
    required this.onActionPressed,
    required this.onScrollDownPressed,
    required this.scrollController,
  });

  final String buttonText;
  final bool isLoading;
  final VoidCallback? onActionPressed;
  final ValueGetter<bool>? onScrollDownPressed;
  final ScrollController scrollController;

  @override
  State<FancyButton> createState() => _FancyButtonState();

  @override
  Size get preferredSize => const Size.fromHeight(58.0 + 16);
}

class _FancyButtonState extends State<FancyButton>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late final _animationController = AnimationController(
    vsync: this,
    lowerBound: 0, // Collapsed state
    upperBound: 1, // Expanded state
    duration: const Duration(milliseconds: 1000),
  );
  late final _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.easeIn,
    reverseCurve: Curves.easeOut.flipped,
  );

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_handleScroll);
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _handleScroll(animated: false);
    });
  }

  @override
  void didUpdateWidget(covariant FancyButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollController != widget.scrollController) {
      oldWidget.scrollController.removeListener(_handleScroll);
      widget.scrollController.addListener(_handleScroll);
    }
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    //needed to update the state of the Fancy button when the keyboard is opened/hidden (the
    // scroll position is not changed)
    // Wrapped into addPostFrameCallback to fix incorrect behavior on native Calling app [NEST-11100]
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _handleScroll();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    widget.scrollController.removeListener(_handleScroll);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  late bool isCollapsed = _animation.value < 1.0;

  VoidCallback? _handleOnClick() {
    if (isCollapsed) {
      if (widget.isLoading) {
        return widget.scrollController.animateToBottom;
      } else {
        return _roundButtonTap;
      }
    } else {
      //When the fancy button is expanded on the bottom:
      return widget.isLoading ? null : widget.onActionPressed;
    }
  }

  void _roundButtonTap() {
    final scrollBottomAfterCallback = widget.onScrollDownPressed?.call() ?? true;
    if (scrollBottomAfterCallback) {
      widget.scrollController.animateToBottom();
    }
  }

  void _handleScroll({bool animated = true}) {
    if (!widget.scrollController.hasClients) {
      return;
    }

    //Returns true when the scroll position is at the end of the screen and less than half the
    // height of the button remains to the end.
    final closeToBottom = widget.scrollController.position.pixels >
        widget.scrollController.position.maxScrollExtent - widget.preferredSize.height / 2;
    // Check if the Fancy button should be collapsed or expanded
    if (closeToBottom) {
      if (isCollapsed) {
        setState(() {
          isCollapsed = false;
        });
        if (animated) {
          _animationController.forward();
        } else {
          _animationController.value = 1;
        }
      }
    } else {
      if (!isCollapsed) {
        setState(() {
          isCollapsed = true;
        });

        if (animated) {
          _animationController.reverse();
        } else {
          _animationController.value = 0;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final expandedWidth = MediaQuery.sizeOf(context).width - 18 * 2;
    final widthTween = Tween(begin: 48.0, end: expandedWidth);
    final textOpacity = CurveTween(curve: const Interval(0.5, 1.0));
    final arrowOpacity = CurveTween(curve: const Interval(0, 0.5));
    return AnimatedBuilder(
      animation: _animationController,
      builder: (ctx, child) {
        final borderRadius = BorderRadius.circular(12);
        return Container(
          width: widthTween.evaluate(_animation),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: borderRadius,
            boxShadow: const [
              BoxShadow(color: Colors.amber)
            ]
          ),
          child: Material(
            color: Colors.transparent,
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: _handleOnClick(),
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: arrowOpacity.transform(1 - _animation.value),
                      child: const Icon(Icons.access_alarm)
                    ),
                    Opacity(
                      opacity: textOpacity.evaluate(_animation),
                      child: widget.isLoading
                          ? const CircularProgressIndicator()
                          : Text(
                              key: ValueKey(widget.buttonText),
                              widget.buttonText,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
