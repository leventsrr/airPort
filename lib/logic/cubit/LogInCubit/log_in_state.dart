part of 'log_in_cubit.dart';

@immutable
abstract class LogInState {
  // bool isLoggedIn;
  String? email;
  String? password;
  // LogInState({this.isLoggedIn = false});
  LogInState({this.email, this.password});
}

class SuccessfulLogin extends LogInState {}

class UnsuccessfulLogin extends LogInState {}
