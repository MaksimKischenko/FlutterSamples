part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthInitial extends AuthState {}

class AuthSuccessAdmin extends AuthState {}

class AuthSuccessEmployee extends AuthState {}

class AuthSuccessFreaLanser extends AuthState {}

class AuthUnauthorized extends AuthState {}

class AuthLogOutSuccess extends AuthState {}
