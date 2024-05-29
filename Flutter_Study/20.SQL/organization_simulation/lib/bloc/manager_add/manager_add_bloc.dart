import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:organization_simulation/database/workers_database.dart';
import 'package:organization_simulation/models/models.dart';

part 'manager_add_event.dart';
part 'manager_add_state.dart';

class ManagerAddBloc extends Bloc<ManagerAddEvent, ManagerAddState> {

  ManagerAddBloc() : super(ManagerAddLoading());

  List<Worker> _workers =[];

  @override
  Stream<ManagerAddState> mapEventToState(
    ManagerAddEvent event,
  ) async* {
      if(event is ManagerAddInit) {
      yield* _mapManagerAddInitialToState(event);
    } else if(event is ManagerAddRun) {
      yield* _mapManagerAddRunToState(event);
    }
  }

Stream<ManagerAddState> _mapManagerAddInitialToState (
  ManagerAddInit event
) async* {
  try{
     final response  = await WorkersDataBaseHelper.instance.allWorkers();
     _workers = response;  
     
    yield ManagerAddInitial(
       workers: _workers
     );

   } catch (error, _) {
      yield ManagerAddInitialError(
        error: error
      );
   }    
}

Stream<ManagerAddState> _mapManagerAddRunToState(
  ManagerAddRun event 
) async* {
   
   try{
     await WorkersDataBaseHelper.instance.insertWorker(event.worker);
     yield ManagerAddSucces(

       name: event.worker.name
     );
   } catch (error, _) {
      yield ManagerAddRunError(
        error: error
      );
   }         
}



}
