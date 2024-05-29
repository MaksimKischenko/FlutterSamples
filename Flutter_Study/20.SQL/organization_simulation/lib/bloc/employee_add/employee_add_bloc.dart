import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:organization_simulation/database/workers_database.dart';
import 'package:organization_simulation/models/models.dart';

part 'employee_add_event.dart';
part 'employee_add_state.dart';

class EmployeeAddBloc extends Bloc<EmployeeAddEvent, EmployeeAddState> {
  EmployeeAddBloc() : super(EmployeeAddLoading());

  List<Worker> _workers =[];

  @override
  Stream<EmployeeAddState> mapEventToState(
    EmployeeAddEvent event,
  ) async* {
    if(event is EmployeeAddInit) {
      yield* _mapEmployeeAddInitialToState(event); 
    } else if(event is EmployeeAddRun) {
      yield* _mapEmployeeAddRunToState(event); 
  }
}


Stream<EmployeeAddState> _mapEmployeeAddInitialToState (
  EmployeeAddInit event
) async* {
  try{
     final response  = await WorkersDataBaseHelper.instance.allWorkers();
     _workers = response;  
     
    yield EmployeeAddInitial(
       workers: _workers
     );

   } catch (error, _) {
      yield EmployeeAddInitialError(
        error: error
      );
   }    
}

Stream<EmployeeAddState> _mapEmployeeAddRunToState(
  EmployeeAddRun event 
) async* {
   
   try{
     await WorkersDataBaseHelper.instance.insertWorker(event.worker);
     yield EmployeeAddSucces(

       name: event.worker.name
     );
   } catch (error, _) {
      yield EmployeeAddRunError(
        error: error
      );
   }         
 }
}

