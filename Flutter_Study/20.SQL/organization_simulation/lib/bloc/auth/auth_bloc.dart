import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:organization_simulation/database/workers_database.dart';
import 'package:organization_simulation/models/models.dart';
import 'package:organization_simulation/workers_indificators.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthLoading());


   List<Worker> _workers =[];
   Map<String, String> _managerAuth ={};
   Map<String, String> _employeeAuth ={};
   Map<String, String> _freaLancerAuth ={};

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthInit) {
      yield* _mapAuthInitToState(event);
    } else if (event is AuthRun) {
      yield* _mapAuthRunToState(event);
    } else if (event is AuthLogOut) {
      yield* _mapAuthLogOutToState(event);
    }
  }

  Stream<AuthState> _mapAuthInitToState(AuthInit event) async* {

     final response  = await WorkersDataBaseHelper.instance.allWorkers();
     _workers = response; 
      if(_workers.isNotEmpty){
       var workerNames =  _workers.map((e) => e.name);
       for (var item in workerNames) {
          if(item.contains(WorkersIndificators.managerIndificator))
         _managerAuth.addAll({item:'admin'});
         else if(item.contains(WorkersIndificators.employeeIndificator))
         _employeeAuth.addAll({item:'empl'});
         else if(item.contains(WorkersIndificators.freaLancerIndificator))
         _freaLancerAuth.addAll({item:'frea'});
       }

      }
  }

  Stream<AuthState> _mapAuthRunToState(AuthRun event) async* {
    //yield AuthLoading();
    

    if (_managerAuth.keys.contains(event.login)  && 
    _managerAuth.values.contains(event.password)) {
      yield AuthSuccessAdmin();
    } else if (_employeeAuth.keys.contains(event.login)  && 
    _employeeAuth.values.contains(event.password)) {
      yield AuthSuccessEmployee();
    } else if (_freaLancerAuth.keys.contains(event.login)  && 
    _freaLancerAuth.values.contains(event.password)) {
      yield AuthSuccessFreaLanser();
    } else {
      yield AuthError(message: 'Неверный логин или пароль');
    }


    // if (_admCredentials!.credentials.keys.contains(event.login)  && 
    // _admCredentials!.credentials.values.contains(event.password)) {
    //   yield AuthSuccessAdmin();
    // } else if (_empCredentials!.credentials.keys.contains(event.login)  && 
    // _empCredentials!.credentials.values.contains(event.password)) {
    //   yield AuthSuccessEmployee();
    // } else if (_frlCredentials!.credentials.keys.contains(event.login)  && 
    // _frlCredentials!.credentials.values.contains(event.password)) {
    //   yield AuthSuccessFreaLanser();
    // } else {
    //   yield AuthError(message: 'Неверный логин или пароль');
    // }
  }

  Stream<AuthState> _mapAuthLogOutToState(AuthLogOut event) async* {
    yield AuthLoading();
    yield AuthLogOutSuccess();
    yield AuthUnauthorized();
  }
}
