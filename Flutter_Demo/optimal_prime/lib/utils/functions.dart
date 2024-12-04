import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

/// Callable class so that you can write `getdep<MyType>` instead of
/// `GetIt.instance.get<MyType>`
T getdep<T extends Object>() => GetIt.instance.get<T>(instanceName: _instances[T]?.toString());

T getdepNamed<T extends Object>(String instanceName) =>
    GetIt.instance.get<T>(instanceName: instanceName);

/// Wrap function for GetIt.registerLazySingleton
void registerDep<T extends Object>(FactoryFunc<T> factoryFunc, {bool allowMultiple = false}) {
  if (!allowMultiple && GetIt.instance.isRegistered<T>()) {
    return;
  }

  // in case of multiple instances, we need to keep track of them
  final instanceName = allowMultiple ? _registerDepName<T>() : null;

  GetIt.instance.registerLazySingleton<T>(factoryFunc, instanceName: instanceName);
}

/// Wrap function for GetIt.unregisterDep
void unregisterDep<T extends Object>() {
  // get the instance name to unregister, if there are multiple instances
  final instanceName = _unregisterDepName<T>();

  GetIt.instance.unregister<T>(instanceName: instanceName);
}

Map<dynamic, int> _instances = {};

String? _registerDepName<T extends Object>() {
  final instanceName = _instances[T]?.toString();
  if (GetIt.instance.isRegistered<T>(instanceName: instanceName)) {
    _instances[T] = (_instances[T] ?? 0) + 1;
  } else {
    _instances[T] = 1;
  }
  return _instances[T]?.toString();
}

String? _unregisterDepName<T extends Object>() {
  final instanceName = _instances[T]?.toString();
  if (instanceName != null) {
    _instances[T] = _instances[T]! - 1;
    if (_instances[T] == 0) {
      _instances.remove(T);
    }
  }
  return instanceName;
}

///Returns the class of type [T] from the GetIt dependency locator or `null` if it's not registered.
///
/// Prevents "Object/factory with  type T is not registered inside GetIt." error.
T? getdepTry<T extends Object>() {
  final instanceName = _instances[T]?.toString();

  return GetIt.instance.isRegistered<T>(instanceName: instanceName)
      ? GetIt.instance.get<T>(instanceName: instanceName)
      : null;
}

/// Builder that registers a dependendency of type [T] on initState and unregisters it on dispose
class DepProvider<T extends ChangeNotifier> extends StatefulWidget {
  const DepProvider({
    super.key,
    required this.dependecy,
    required this.builder,
    this.onInit,
    this.onPostInit,
    this.onChangedDependencies,
  });
  final T Function() dependecy;
  final Widget Function(BuildContext, T) builder;
  final Function(T)? onInit;
  final Function(T)? onPostInit;
  final Function(T)? onChangedDependencies;

  @override
  State<DepProvider<T>> createState() => _DepProviderState<T>();
}

class _DepProviderState<T extends ChangeNotifier> extends State<DepProvider<T>> {
  T get notifier => getdep<T>();

  @override
  void initState() {
    super.initState();
    registerDep<T>(widget.dependecy, allowMultiple: true);
    widget.onInit?.call(notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onPostInit?.call(notifier);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.onChangedDependencies?.call(notifier);
  }

  @override
  void dispose() {
    getdep<T>().dispose();
    unregisterDep<T>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: notifier,
        builder: (context, _) => widget.builder(context, notifier),
      );
}
