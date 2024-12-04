import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optimal_prime/domain/entities/event_types.dart';
import 'package:optimal_prime/domain/services/local_cache_service.dart';
import 'package:optimal_prime/presentation/bloc/stream_manager/stream_manager_bloc.dart';
import 'package:optimal_prime/presentation/bloc/theme/theme_cubit.dart';
import 'package:optimal_prime/simple_bloc_observer.dart';

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
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<StreamManagerBloc>(
            create: (context) =>
                StreamManagerBloc()..add(const FireEvent(type: EventType.testEvent)),
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(
              cacheService: getdep<CacheService>(),
            ),
          ),
        ],
        child: BlocListener<StreamManagerBloc, StreamManagerState>(
          listener: (context, state) {
            if (state is StreamManagerRecieved<EventType>) {
              switch (state.recievedEvent) {
                case EventType.testEvent:
                  break;
                default:
              }
            }
          },
          child: widget.child,
        ),
      );
}
