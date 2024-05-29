import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled1/data/data.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthLoading());

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
    yield AuthLoading();

    final token = await SecureStorageManager.token;
    if (token == null) {
      yield AuthUnauthorized();
    } else {
      yield AuthSuccess();
    }
  }

  Stream<AuthState> _mapAuthRunToState(AuthRun event) async* {
    yield AuthLoading();

    await Future.delayed(Duration(seconds: 5));

    if (event.login == 'a1' && event.password == '123456') {
      yield AuthSuccess();
    } else {
      yield AuthError(message: 'Неверный логин или пароль');
    }
  }

  Stream<AuthState> _mapAuthLogOutToState(AuthLogOut event) async* {
    yield AuthLoading();
    yield AuthLogOutSuccess();
    yield AuthUnauthorized();
  }
}
