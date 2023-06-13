import 'package:gedka_rs/template/home_screen.dart';
import 'package:gedka_rs/template/login_screen.dart';
import 'package:gedka_rs/template/reg_screen.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: _router,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Inter'),
    );
  }

  final _router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
    GoRoute(path: '/registration', builder: (context, state) => const RegistrationScreen())
  ], initialLocation: '/home');
}
