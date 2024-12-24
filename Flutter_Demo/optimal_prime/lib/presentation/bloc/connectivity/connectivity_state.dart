part of 'connectivity_bloc.dart';

sealed class ConnectivityState extends Equatable {
  const ConnectivityState();

  @override
  List<Object> get props => [];
}

final class ConnectivityLoading extends ConnectivityState {}

final class ConnectivityUpdated extends ConnectivityState {
  final ConnectivityInfo connectivityInfo;

  const ConnectivityUpdated({
    required this.connectivityInfo,
  });

  @override
  List<Object> get props => [connectivityInfo];
}
