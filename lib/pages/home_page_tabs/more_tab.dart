import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_bloc/blocs/bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_login_bloc/pages/login_page.dart';
import 'package:flutter_login_bloc/utils/dialogs.dart';
import 'package:flutter_login_bloc/widgets/avatar.dart';
import 'package:flutter_login_bloc/widgets/left_right_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreTab extends StatelessWidget {
  _logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (_) => false);
  }

  _confirm(BuildContext context, MasterBloc masterBloc) async {
    final isOk = await Dialogs.confirm(context,
        title: "ACCIÓN REQUERIDA",
        body: "Esta seguro de que desea salir de su cuenta?");
    print("isOk $isOk");
    if (isOk) {
      masterBloc.add(MasterLogOut());
      _logOut(context);
    }
  }

  _setEmail(BuildContext context) {
    Dialogs.intputEmail(context, onOk: (String text) {
      print("input dialog $text");
    }, label: "Ingrese un email", placeholder: "example@domain.com");
  }

  @override
  Widget build(BuildContext context) {
    final MasterBloc bloc = BlocProvider.of<MasterBloc>(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xfff8f8f8),
              padding: EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Avatar(
                    size: 150,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Bienvenido"),
                  Text(
                    "Darwin Morocho",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            LeftRightIconButton(
              leftIcon: 'assets/icons/email.svg',
              rightContent: const Text(
                "darwin@test.com",
                style: TextStyle(color: Color(0xffaaaaaa)),
              ),
              label: 'Email',
              onPressed: () => _setEmail(context),
            ),
            LeftRightIconButton(
              leftIcon: 'assets/icons/security.svg',
              rightContent: SvgPicture.asset(
                'assets/icons/right-arrow.svg',
                width: 20,
              ),
              label: 'Configuraciones de privacidad',
              onPressed: () => _setEmail(context),
            ),
            LeftRightIconButton(
              leftIcon: 'assets/icons/bell.svg',
              rightContent: const Text("ACTIVADO",
                  style:
                      TextStyle(color: Color(0xffaaaaaa), letterSpacing: 0.5)),
              label: 'Notificaciones Push',
              onPressed: () => _setEmail(context),
            ),
            LeftRightIconButton(
              leftIcon: 'assets/icons/logout.svg',
              label: 'Cerrar Sesión',
              onPressed: () => _confirm(context, bloc),
              rightContent: const Text("Cerrar sesion",
                  style:
                      TextStyle(color: Color(0xffaaaaaa), letterSpacing: 0.5)),
            )
          ],
        ),
      ),
    );
  }
}
