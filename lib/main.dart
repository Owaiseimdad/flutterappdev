// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:learning_free_code_camp/views/middleware.dart';
import 'package:learning_free_code_camp/views/login_view.dart';
import 'package:learning_free_code_camp/views/register_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Firebase Works',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const Middlesware(),
    routes: {
      '/login/': (context) => const LoginView(),
      '/register/': (context) => const RegisterView(),
      '/main/': (context) => const Middlesware(),
    },
  ));
}
