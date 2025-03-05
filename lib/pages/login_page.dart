import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_bloc/blocs/login/login_bloc.dart';
import 'package:flutter_login_bloc/widgets/login_text_form_field.dart';
import 'package:flutter_login_bloc/widgets/my_btn.dart';

class LoginPage extends StatefulWidget {
  static final routeName = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc = LoginBloc();

  FocusNode _focusNodePassword = FocusNode();

  GlobalKey<FormState> _formKey = GlobalKey();

  String _email = '', _password = '';

  @override
  void dispose() {
    _focusNodePassword.dispose();
    _loginBloc.close();
    super.dispose();
  }

  _submit() async {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _loginBloc.add(LoginByPassword(
          context: context, email: _email, password: _password));
    }
  }

  _validateEmail(String email) {
    if (email.isNotEmpty && email.contains("@")) {
      _email = email;
      return null;
    }
    return "invalid email";
  }

  String _validatePassword(String password) {
    if (password.isNotEmpty && password.length > 4) {
      _password = password;
      return null;
    }
    return "invalid password";
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);

    final Size size = media.size;
    final EdgeInsets padding = media.padding;

    return BlocProvider.value(
        value: _loginBloc,
        child: Scaffold(
          body: SafeArea(
              child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  child: Container(
                    height: size.height - padding.top - padding.bottom,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 60, bottom: 10),
                              child: Image.network(
                                'https://placeholder.com/wp-content/uploads/2018/10/placeholder.com-logo4.png',
                                width: 280,
                                color: Color(0xff304FFE),
                              ),
                            ),
                            const Text(
                              "Flutter UI & UX",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: 330, minWidth: 200),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                LoginTextFormField(
                                  iconPath: 'assets/icons/email.svg',
                                  hintText: "example.@domain.com",
                                  labelText: "E-mail",
                                  initialValue: 'eve.holt@reqres.in',
                                  onFieldSubmitted: (String text) {
                                    _focusNodePassword.nextFocus();
                                  },
                                  validator: (value) => value.isEmpty
                                      ? 'Email cannot be blank'
                                      : null,
                                  focusNode: null,
                                  obscureText: null,
                                ),
                                SizedBox(height: 20),
                                LoginTextFormField(
                                  iconPath: 'assets/icons/password.svg',
                                  hintText: "***********",
                                  labelText: "Password",
                                  onFieldSubmitted: (String text) {
                                    _submit();
                                  },
                                  initialValue: 'citysalicka',
                                  validator: _validatePassword,
                                  focusNode: _focusNodePassword,
                                  obscureText: true,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 1,
                                                    color: Color(0xff304FFE)))),
                                        child: const Text(
                                          "Olvide mi contraseña",
                                          style: TextStyle(
                                              color: Color(0xff304FFE)),
                                        ),
                                      ),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                                const SizedBox(height: 30),
                                MyBtn(
                                  fullWidth: true,
                                  label: "INGRESAR",
                                  onPressed: _submit,
                                  backgroundColor: Color(0xff304FFE),
                                  textColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                ),
                                const SizedBox(height: 35),
                                const Text("O inicia con"),
                                const SizedBox(height: 20),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: MyBtn(
                                        fullWidth: true,
                                        label: "FACEBOOK",
                                        onPressed: () {},
                                        backgroundColor: Color(0xff0D47A1),
                                        textColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 18),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                        child: MyBtn(
                                      fullWidth: true,
                                      label: "GOOGLE",
                                      onPressed: () {},
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 18),
                                      backgroundColor: Color(0xffF50057),
                                      textColor: Colors.white,
                                    )),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (_, state) {
                  if (state.fetching) {
                    return Positioned.fill(
                        child: Container(
                      color: Colors.white70,
                      child: Center(
                        child: CupertinoActivityIndicator(
                          radius: 15,
                        ),
                      ),
                    ));
                  }
                  return Container();
                },
                condition: (prevState, newState) =>
                    prevState.fetching != newState.fetching,
              )
            ],
          )),
        ));
  }
}
