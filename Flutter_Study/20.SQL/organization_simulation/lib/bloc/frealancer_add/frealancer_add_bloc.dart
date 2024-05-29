import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:organization_simulation/database/workers_database.dart';
import 'package:organization_simulation/models/models.dart';

part 'frealancer_add_event.dart';
part 'frealancer_add_state.dart';

class FrealancerAddBloc extends Bloc<FrealancerAddEvent, FrealancerAddState> {
  FrealancerAddBloc() : super(FrealancerAddLoading());

  List<Worker> _workers =[];

  @override
  Stream<FrealancerAddState> mapEventToState(
    FrealancerAddEvent event,
  ) async* {
    if(event is FrealancerAddInit) {
      yield* _mapFrealancerAddInitToState(event);
    } else if(event is FrealancerAddRun) {
      yield* _mapFrealancerAddRunToState(event);
    }
  }

  Stream<FrealancerAddState> _mapFrealancerAddInitToState (
  FrealancerAddInit event
  ) async* {
  try{
     final response  = await WorkersDataBaseHelper.instance.allWorkers();
     _workers = response;  
     
    yield FrealancerAddInitial(
       workers: _workers
     );

   } catch (error, _) {
      yield FrealancerAddInitialError(
        error: error
      );
   }    
}

  Stream<FrealancerAddState> _mapFrealancerAddRunToState(
  FrealancerAddRun event 
  ) async* {
    
    try{
      await WorkersDataBaseHelper.instance.insertWorker(event.worker);
      yield FrealancerAddSucces(

        name: event.worker.name
      );
    } catch (error, _) {
      yield FrealancerAddRunError(
        error: error
      );
    }         
  }

}
