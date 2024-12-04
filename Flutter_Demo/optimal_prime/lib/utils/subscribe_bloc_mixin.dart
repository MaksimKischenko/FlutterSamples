import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

mixin SubscribeBlocMixin<E, S> on Bloc<E, S> {
  final List<StreamSubscription<Object?>> _subscription = [];

  @protected
  void subscribe<T>(
    Stream<T> stream, {
    required void Function(T value) listen,
    void Function(Object error, StackTrace stackTrace)? onError,
    bool? cancelOnError,
  }) {
    _subscription.add(
      stream.listen(
        listen,
        onError: onError ?? this.onError,
        cancelOnError: cancelOnError,
      ),
    );
  }

  @override
  Future<void> close() => Future.wait([
        for (final subscription in _subscription) subscription.cancel(),
        super.close(),
      ]);
}
