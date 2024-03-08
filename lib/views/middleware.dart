import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learning_free_code_camp/firebase_options.dart';
import 'package:learning_free_code_camp/views/home_view.dart';
import 'package:learning_free_code_camp/views/login_view.dart';
import 'package:learning_free_code_camp/views/verify_view.dart';

class Middlesware extends StatelessWidget {
  const Middlesware({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                if (user.emailVerified) {
                  return const HomePage();
                } else {
                  return const VerifyEmail();
                }
              } else {
                return const LoginView();
              }

            default:
              return const CircularProgressIndicator();
          }
        });
  }
}
