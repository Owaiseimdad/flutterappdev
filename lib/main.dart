// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_free_code_camp/constants/routes.dart';
import 'package:learning_free_code_camp/views/middleware.dart';
import 'package:learning_free_code_camp/views/login_view.dart';
import 'package:learning_free_code_camp/views/register_view.dart';
import 'package:learning_free_code_camp/views/verify_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      // const SystemUiOverlayStyle(statusBarColor: Colors.black));
      // const SystemUiOverlayStyle(statusBarColor: Colors.transparent))/;
      SystemUiOverlayStyle
          .dark); // A simple answer is that if Flutter needs to call native code before calling runApp
  runApp(MaterialApp(
    title: 'Flutter Firebase Works',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const Middlesware(),
    routes: {
      loginRoutes: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      mainRoute: (context) => const Middlesware(),
      verifyRoute: (context) => const VerifyEmail(),
    },
  ));
}
