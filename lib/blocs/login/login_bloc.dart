import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState());

  @override
  LoginState get initialState => LoginState();

  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginByPassword) {
      yield state.copywith(fetching: true);
      await Future.delayed(Duration(seconds: 2));
      yield state.copywith(fetching: false);
    }
  }
}
