part of 'goods_bloc.dart';

@immutable
abstract class GoodsInfoEvent  extends Equatable {

  const GoodsInfoEvent();

  @override
  List<Object?> get props => [];
}



class GoodsInfoRun extends GoodsInfoEvent {
  final String productName;
  final int listSize;

  const GoodsInfoRun({
    required this.productName,
    required this.listSize,
  });

  @override
  List<Object?> get props => [productName, listSize];
}

