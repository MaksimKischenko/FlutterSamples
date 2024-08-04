import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Mixin that provides subscription management for `Cubit` classes.
///
/// This mixin allows a `Cubit` to manage multiple stream subscriptions,
/// ensuring they are properly cancelled when the `Cubit` is closed.
///
/// Example:
/// ```dart
/// class ConnectivityCubit extends Cubit<ConnectivityState> with SubscribeCubitMixin<ConnectivityState> {
///   final Connectivity _connectivity;
///
///   ConnectivityCubit(this._connectivity) : super(ConnectivityInitial()) {
///     subscribe(
///       _connectivity.onConnectivityChanged,
///       listen: (ConnectivityResult result) {
///         if (result == ConnectivityResult.none) {
///           emit(ConnectivityDisconnected());
///         } else {
///           emit(ConnectivityConnected(result));
///         }
///       },
///       onError: (error, stackTrace) {
///         emit(ConnectivityError(error));
///       },
///     );
///   }
/// }
/// ```
mixin SubscribeCubitMixin<S> on Cubit<S> {
  final List<StreamSubscription<Object?>> _subscription = [];

  /// Subscribes to a stream and manages the subscription.
  ///
  /// Adds the stream subscription to a list of subscriptions that will be
  /// cancelled when the `Cubit` is closed. The `listen` callback is invoked
  /// with each value emitted by the stream. An optional `onError` callback
  /// can handle errors, and `cancelOnError` can specify whether the
  /// subscription should be canceled on an error.
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

  /// Cancels all subscriptions and closes the `Cubit`.
  @override
  Future<void> close() => Future.wait([
      for (final subscription in _subscription) subscription.cancel(),
      super.close(),
    ]);
}
