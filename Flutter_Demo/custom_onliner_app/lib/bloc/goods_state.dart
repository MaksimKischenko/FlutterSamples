part of 'goods_bloc.dart';

@immutable
abstract class GoodsInfoState extends Equatable {
  
  const GoodsInfoState();
  
  @override
  List<Object?> get props => [];

}

class GoodsInfoInit extends GoodsInfoState {
  
}

class GoodsInfoLoading extends GoodsInfoState {
  Duration? duration;
  
  GoodsInfoLoading({
     this.duration,
  });
}

class GoodsInfoError extends GoodsInfoState {
  final Object error;

  const GoodsInfoError({
    required this.error
  });

  @override
  List<Object?> get props => [error];
}

class GoodsInfoSuccess extends GoodsInfoState {
  final GoodsInfo infoTabs;

  const GoodsInfoSuccess({
    required this.infoTabs
  });

  @override
  List<Object?> get props => [infoTabs];
}

