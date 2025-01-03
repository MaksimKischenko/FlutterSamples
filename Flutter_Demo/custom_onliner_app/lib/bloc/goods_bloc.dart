import 'package:bloc/bloc.dart';
import 'package:custom_onliner_app/data/data_manager.dart';
import 'package:custom_onliner_app/data/remote_models/get_goods_response.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'goods_event.dart';
part 'goods_state.dart';

class GoodsBloc extends Bloc<GoodsInfoEvent, GoodsInfoState> {
  final DataManager dataManager;

  GoodsBloc({
    required this.dataManager
  }) : super(GoodsInfoInit()) {
    on<GoodsInfoEvent>(_onEvent);


  }

  void _onEvent(
    GoodsInfoEvent event,
    Emitter<GoodsInfoState> emit
  ) {
    if (event is GoodsInfoRun) return _onGoodsInfoRun(event, emit);
  }

  void _onGoodsInfoRun(
    GoodsInfoRun event,
    Emitter<GoodsInfoState> emit
  ) async {

    Stopwatch stopwatch = Stopwatch();
    stopwatch.start();

    emit(GoodsInfoLoading(
      duration: stopwatch.elapsed
    ));

    stopwatch.stop();

    try {
    
     final infoGoods = await dataManager.getGoodsRequest(productName: event.productName);

     emit(GoodsInfoSuccess(
        infoTabs: infoGoods
     ));

    // ignore: avoid_catches_without_on_clauses
    } catch(error, _) {
      emit(GoodsInfoError(
        error: error
      ));
    }
  }
}
