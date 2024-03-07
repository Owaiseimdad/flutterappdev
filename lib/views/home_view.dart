import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learning_free_code_camp/firebase_options.dart';
import 'package:learning_free_code_camp/views/login_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              // final user = FirebaseAuth.instance.currentUser;
              // print(user?.emailVerified);
              // if (user?.emailVerified ?? false) {
              //   return const Text("You are a verified user.");
              // } else {
              //   return const VerifyEmail();
              // }
              return const LoginView();
            default:
              return const CircularProgressIndicator();
          }
        });
  }
}
