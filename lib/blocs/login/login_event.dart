part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginByPassword extends LoginEvent {
  final BuildContext context;
  final String email, password;

  const LoginByPassword(
      {required this.context, required this.email, required this.password});

  @override
  List<Object> get props => [context, email, password];
}
