part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool fetching;
  final int intents;

  const LoginState({this.fetching = false, this.intents = 0});

  @override
  List<Object> get props => [fetching, intents];

  LoginState copywith({bool? fetching, int? intents}) {
    return LoginState(
        fetching: fetching ?? this.fetching, intents: intents ?? this.intents);
  }
}

// final class LoginInitial extends LoginState {}


// final class LoginLoading extends LoginState {}

// final class LoginSuccess extends LoginState {}

// final class LoginFailure extends LoginState {
//   final String error;

//   const LoginFailure({required this.error});

//   @override
//   List<Object> get props => [error];
// }

// final class LoginByGoogle extends LoginState {}

// final class LoginByFacebook extends LoginState {}
// // final class LoginByPassword extends LoginState {}
