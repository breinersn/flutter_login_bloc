import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_bloc/api/account_api.dart';
import 'package:flutter_login_bloc/pages/home_page.dart';
import 'package:flutter_login_bloc/utils/dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AccountAPI _accountAPI = AccountAPI();

  LoginBloc() : super(const LoginState()) {
    on<LoginByPassword>(_onLoginByPassword);
    on<LoginByGoogle>(_onLoginByGoogle);
    on<LoginByFacebook>(_onLoginByFacebook);
  }

  Future<void> _onLoginByPassword(
      LoginByPassword event, Emitter<LoginState> emit) async {
    emit(state.copyWith(fetching: true));

    bool isOk = await _accountAPI.login(event.email, event.password);
    if (isOk) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("wasLogin", true);
      // Mover la navegación fuera del Bloc
      Navigator.pushReplacementNamed(event.context, HomePage.routeName);
    } else {
      final intents = state.intents + 1;
      emit(
          state.copyWith(fetching: false, intents: intents == 3 ? 0 : intents));

      await Dialogs.alert(event.context,
          title: "ERROR",
          body: intents == 3
              ? "Se ha enviado una alerta al email ${event.email}"
              : "Email o contraseña incorrectos");
    }
  }

  void _onLoginByGoogle(LoginByGoogle event, Emitter<LoginState> emit) {
    // Implementar lógica para LoginByGoogle
  }

  void _onLoginByFacebook(LoginByFacebook event, Emitter<LoginState> emit) {
    // Implementar lógica para LoginByFacebook
  }
}
