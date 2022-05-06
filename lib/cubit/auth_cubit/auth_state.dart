part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {}

class LoadingAuthScreenState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginAuthScreenState extends AuthState {
  final String message;

  LoginAuthScreenState({this.message = ""});

  @override
  List<Object?> get props => [message];
}

class AuthenticatedState extends AuthState {
  final supa.User user;

  AuthenticatedState(this.user);

  @override
  List<Object?> get props => [user];
}

class ErrorAuthScreenState extends AuthState {
  final String errorLog;

  ErrorAuthScreenState(this.errorLog);

  @override
  List<Object?> get props => [errorLog];
}
