import 'package:flutter/material.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/battery_info_card_sliver.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/battery_task_card_sliver.dart';
import 'package:optimal_prime/presentation/screens/home/widgets/connectivity_info_sliver.dart';
import 'package:optimal_prime/utils/build_context_extensions.dart';
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
          // title: const Text('Battery'),
          actions: const [],
        ),
        backgroundColor: context.colors.surface,
        body: SafeArea(
          child: Center(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(KSize.margin4x),
                    child: Hero(
                      tag: 'title',
                      child: Text(
                        'Connectivity info',
                        style: context.textTheme.headlineMedium
                            ?.copyWith(color: context.colors.secondary),
                      ),
                    ),
                  ),
                ),
                const ConnectivityInfoSliver(),
                const SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: KSize.margin2x,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(KSize.margin4x),
                    child: Hero(
                      tag: 'title',
                      child: Text(
                        'Battery info',
                        style: context.textTheme.headlineMedium
                            ?.copyWith(color: context.colors.primary),
                      ),
                    ),
                  ),
                ),
                const BatteryInfoCardSliver(),
                const SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: KSize.margin2x),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(KSize.margin4x),
                    child: Hero(
                      tag: 'title',
                      child: Text(
                        'Task manager',
                        style: context.textTheme.headlineMedium
                            ?.copyWith(color: context.colors.tertiary),
                      ),
                    ),
                  ),
                ),
                BatteryTaskCardSliver(),
                SliverPadding(padding: EdgeInsets.only(bottom: context.safeBottomPadding)),
              ],
            ),
          ),
        ),
      );
}
