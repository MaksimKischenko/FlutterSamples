import 'package:bloc/bloc.dart';
import 'package:cubit_view/bloc/subscribe_cubit_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_state.dart';
part 'counter_cubit.freezed.dart';

class CounterCubit extends Cubit<CounterState> with SubscribeCubitMixin{
  
  CounterCubit() : super(const CounterState.initial(initialCount: 0)) {
    subscribe(
      listen: (value) {
        
      },
    );

  }

      @override
  Future<void> close() async{
    await super.close();
  
    
  }
 
  Future<void> changeCounter() async {
    emit(const CounterState.loading()) ;
    await Future.delayed(const Duration(seconds: 2));
    emit(const CounterState.succes());
  }
}
