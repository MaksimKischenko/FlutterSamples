import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:optimal_prime/generated/translations.g.dart';
import 'package:optimal_prime/presentation/screens/home/home_screen.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/lottie_asset.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/page_view_item.dart';

class IntroScren extends StatefulWidget {
  const IntroScren({super.key});

  static const String route = '/intro';

  @override
  State<IntroScren> createState() => _IntroScrenState();
}

class _IntroScrenState extends State<IntroScren> {
  static const _intoCount = 3;
  late PageController _pageViewController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _pageViewController.addListener(_pageViewControllerHandler);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final introBody = context.t.mobileScreens.intro;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            PageView(
              controller: _pageViewController,
              children: [
                PageViewItem(
                  itemImage: LottieAsset.batteryIntro,
                  itemTitle: introBody.title1,
                  itemDesctiption: introBody.description1,
                ),
                PageViewItem(
                  itemImage: LottieAsset.chart,
                  itemTitle: introBody.title2,
                  itemDesctiption: introBody.description2,
                ),
                PageViewItem(
                  itemImage: LottieAsset.balance,
                  itemTitle: introBody.title3,
                  itemDesctiption: introBody.description3,
                ),
              ],
            ),
            SmoothPageIndicator(
              controller: _pageViewController,
              count: _intoCount,
              effect: WormEffect(
                dotColor: context.colors.onTertiaryContainer,
                activeDotColor: context.colors.secondary,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _pageViewControllerHandler() async {
    final isLastPage = _pageViewController.page == _intoCount - 1;
    if (isLastPage) {
      await Future.delayed(const Duration(seconds: 3));
      context.go(HomeScreen.route);
    }
  }
}