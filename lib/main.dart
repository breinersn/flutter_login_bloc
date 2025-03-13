import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_bloc/blocs/bloc.dart';
import 'package:flutter_login_bloc/pages/home_page.dart';
import 'package:flutter_login_bloc/pages/images_page.dart';
import 'package:flutter_login_bloc/pages/login_page.dart';
import 'package:flutter_login_bloc/pages/post_page.dart';
import 'package:flutter_login_bloc/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (_) => LoginBloc(LoginState()),
        // ),
        BlocProvider(
          create: (_) => MasterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter login bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashPage(),
        routes: {
          ImagesPage.routeName: (BuildContext context) => ImagesPage(),
          HomePage.routeName: (_) => HomePage(),
          PostsPage.routeName: (_) => PostsPage(),
          LoginPage.routeName: (_) => LoginPage(),
        },
      ),
    );
  }
}
