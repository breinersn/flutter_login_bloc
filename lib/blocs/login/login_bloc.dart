import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_bloc/api/account_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AccountAPI _accountAPI = AccountAPI();

  LoginBloc() : super(const LoginState());

  LoginState get initialState => const LoginState();

  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginByPassword) {
      yield state.copywith(fetching: true);
      final bool result = await _accountAPI.login(event.email, event.password);
      if (result) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool("wasLogin", true);
        // Navigator.pushReplacementNamed(event.context, HomePage.routeName);
      } else {
        yield state.copywith(fetching: false, intents: state.intents + 1);
      }
    } else if (event is LoginByGoogle) {
      yield state.copywith(fetching: true);
      await Future.delayed(const Duration(seconds: 2));
      yield state.copywith(fetching: false);
    } else if (event is LoginByFacebook) {
      yield state.copywith(fetching: true);
      await Future.delayed(const Duration(seconds: 2));
      yield state.copywith(fetching: false);
    }
  }
}
