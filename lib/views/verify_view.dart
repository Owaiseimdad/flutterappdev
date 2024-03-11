import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_free_code_camp/constants/routes.dart';
import 'package:learning_free_code_camp/views/error_dialog.dart';
import 'package:learning_free_code_camp/views/show_dialog.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify email!'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Please Verify your email."),
            TextButton(
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  try {
                    await user?.sendEmailVerification();

                    return showTextDialog(
                        context,
                        "Verification email sent, please check your inbox and verify.\n After verification please okay and click on verified button.",
                        'Email Verification');
                  } catch (e) {
                    return showErrorDialog(context, e.toString());
                  }
                },
                child: const Text("Click here to verify")),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoutes, (route) => false);
                },
                child: const Text('Verified?')),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoutes, (route) => false);
                },
                child: const Text('Login with another email'))
          ],
        ),
      ),
    );
  }
}
