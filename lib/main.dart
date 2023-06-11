import 'package:gedka_rs/template/login_screen.dart';
import 'package:gedka_rs/template/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: _router,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Inter'),
    );
  }

  final _router = GoRouter(routes: [
    GoRoute(path: '/', builder:(context, state) => const LoginScreen()),
    GoRoute(path: '/signup', builder:(context, state) => const SignupScreen())
  ]);
}

