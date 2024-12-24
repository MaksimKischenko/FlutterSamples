import 'package:flutter/material.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/sizes.dart';
import 'package:optimal_prime/utils/theme.dart';

class AppBottomSheet extends StatelessWidget {
  /// Bottom sheet with a simple height shrinking content, for example Column
  factory AppBottomSheet.shrinkContent({
    required Widget Function(BuildContext) builder,
    Key? key,
    ThemeData? themeData,
    Widget? handlePadding,
  }) =>
      AppBottomSheet._(
        key: key,
        themeData: themeData,
        shrinkBuilder: builder,
        handlePadding: handlePadding,
      );

  ///Bottom sheet with a scrollable content in a given ratio to screen container
  factory AppBottomSheet.scrollableContent({
    Key? key,
    required ScrollableWidgetBuilder builder,
    double? minSize,
    double? maxSize,
    double? initialChildSize,
    ThemeData? themeData,
    Widget? handlePadding,
  }) =>
      AppBottomSheet._(
        scrollBuilder: builder,
        minSize: minSize,
        maxSize: maxSize,
        initialChildSize: initialChildSize,
        key: key,
        themeData: themeData,
        handlePadding: handlePadding,
      );

  const AppBottomSheet._({
    super.key,
    double? minSize,
    double? maxSize,
    double? initialChildSize,
    this.themeData,
    this.scrollBuilder,
    this.shrinkBuilder,
    Widget? handlePadding,
  })  : handlePadding = handlePadding ?? const SizedBox(height: KSize.margin7x),
        minSize = minSize ?? 0.5,
        maxSize = maxSize ?? 1.0,
        initialChildSize = initialChildSize ?? 0.5,
        assert(
          (scrollBuilder != null) ^ (shrinkBuilder != null),
          'Either `scrollBuilder` or `shrinkBuilder` must be provided',
        );

  final double minSize;
  final double maxSize;
  final double initialChildSize;
  final ScrollableWidgetBuilder? scrollBuilder;
  final Widget Function(BuildContext)? shrinkBuilder;
  final ThemeData? themeData;
  final Widget handlePadding;

  @override
  Widget build(BuildContext context) => shrinkBuilder != null
      ? _BottomSheetCard(
          handlePadding: handlePadding,
          themeData: themeData,
          child: ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const SizedBox(height: KSize.margin2Halfx),
              const BottomSheetHandle(key: ValueKey('bottomSheetHandle')),
              handlePadding,
              shrinkBuilder!(context),
              SizedBox(height: context.safeBottomPaddingForBottomSheets),
            ],
          ),
        )
      : LayoutBuilder(
          builder: (context, constraints) {
            final rootContext = Navigator.of(context, rootNavigator: true).context;
            final mediaQueryData = MediaQuery.of(rootContext);
            final screenHeight = mediaQueryData.size.height;
            final calculatedMaxSize = ((screenHeight - mediaQueryData.padding.top) / screenHeight)
                .clamp(minSize, maxSize)
                .toDouble();
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: DraggableScrollableSheet(
                minChildSize: minSize,
                maxChildSize: calculatedMaxSize,
                initialChildSize: initialChildSize,
                snapSizes: [calculatedMaxSize],
                snap: true,
                expand: false,
                builder: (BuildContext context, ScrollController scrollController) =>
                    _BottomSheetCard(
                  handlePadding: handlePadding,
                  themeData: themeData,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: KSize.margin2Halfx),
                      const BottomSheetHandle(key: ValueKey('bottomSheetHandle')),
                      handlePadding,
                      Expanded(
                        child: scrollBuilder!(context, scrollController),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
}

class _BottomSheetCard extends StatelessWidget {
  const _BottomSheetCard({
    required this.child,
    required this.handlePadding,
    this.themeData,
  });

  static const BorderRadius _borderRadius = BorderRadius.vertical(
    top: Radius.circular(KSize.radiusL),
  );
  final ThemeData? themeData;
  final Widget handlePadding;
  final Widget child;

  @override
  Widget build(BuildContext context) => AppCustomTheme(
        themeData: themeData,
        builder: (context) => ClipRRect(
          borderRadius: _borderRadius,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.colors.onPrimary,
              borderRadius: _borderRadius,
            ),
            child: child,
          ),
        ),
      );
}

class BottomSheetHandle extends StatelessWidget {
  const BottomSheetHandle({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colors.tertiaryContainer,
            borderRadius: BorderRadius.circular(2),
          ),
          child: const SizedBox(
            width: 76,
            height: 4,
          ),
        ),
      );
}
