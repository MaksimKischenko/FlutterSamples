import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/battery_info_card_sliver.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
import 'package:optimal_prime/utils/lottie_asset.dart';
import 'package:optimal_prime/utils/sizes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String route = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Battery'),
          actions: [
            Lottie.asset(
              LottieAsset.low,
              width: KSize.avatarXSHalf,
              height: KSize.avatarXSHalf,
              fit: BoxFit.contain,
            ),
          ],
        ),
        backgroundColor: context.colors.surface,
        body: SafeArea(
          child: Center(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: const [
                // SliverToBoxAdapter(
                //   child: Center(
                //     child: Padding(
                //       padding: const EdgeInsets.only(
                //         left: KSize.margin4x,
                //         right: KSize.margin4x,
                //         top: KSize.margin1x,
                //         bottom: KSize.margin2Halfx,
                //       ),
                //       child: Hero(
                //         tag: 'title',
                //         child: Text(
                //           'Battery',
                //           style: context.textTheme.displayLarge,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: KSize.margin6x,
                  ),
                ),
                BatteryInfoCardSliver()
              ],
            ),
          ),
        ),
      );
}
