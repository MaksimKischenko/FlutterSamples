part of 'goods_bloc.dart';

@immutable
abstract class GoodsInfoEvent  extends Equatable {

  const GoodsInfoEvent();

  @override
  List<Object?> get props => [];
}



class GoodsInfoRun extends GoodsInfoEvent {
  final String productName;

  const GoodsInfoRun({
    required this.productName,
  });

  @override
  List<Object?> get props => [productName];
}

