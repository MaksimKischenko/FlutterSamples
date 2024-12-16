import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optimal_prime/domain/services/local_cache_service.dart';
import 'package:optimal_prime/generated/translations.g.dart';
import 'package:optimal_prime/presentation/bloc/battery_info/battery_info_bloc.dart';
import 'package:optimal_prime/presentation/bloc/theme/theme_cubit.dart';
import 'package:optimal_prime/simple_bloc_observer.dart';

import 'domain/services/battery_info_service.dart';
import 'utils/functions.dart';
import 'utils/lifecycle_watcher.dart';

class AppWrapper extends StatefulWidget {
  final Widget child;

  const AppWrapper({
    super.key,
    required this.child,
  });

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  late LifecycleWatcher _lifecycleWatcher;

  @override
  void initState() {
    super.initState();
    Bloc.observer = getdep<SimpleBlocObserver>();
    _lifecycleWatcher = getdep<LifecycleWatcher>();
    WidgetsBinding.instance.addObserver(_lifecycleWatcher);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_lifecycleWatcher);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TranslationProvider(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BatteryInfoBloc>(
              create: (context) => BatteryInfoBloc(batteryInfoService: getdep<BatteryInfoService>())
                ..add(BatteryInfoListen()),
            ),
            BlocProvider<ThemeCubit>(
              create: (context) => ThemeCubit(
                cacheService: getdep<CacheService>(),
              ),
            ),
          ],
          child: BlocListener<BatteryInfoBloc, BatteryInfoState>(
            listener: (context, state) {},
            child: widget.child,
          ),
        ),
      );
}
