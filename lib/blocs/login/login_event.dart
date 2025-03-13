part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginByPassword extends LoginEvent {
  final BuildContext context;
  final String email, password;

  LoginByPassword(
      {required this.context, required this.email, required this.password});
}

class LoginByGoogle extends LoginEvent {}

class LoginByFacebook extends LoginEvent {}
