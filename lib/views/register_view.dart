import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_free_code_camp/constants/routes.dart';
import 'package:learning_free_code_camp/views/error_dialog.dart';
import 'package:learning_free_code_camp/views/login_view.dart';
import '../firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _useremail;
  late final TextEditingController _password;

  @override
  void initState() {
    _useremail = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _useremail.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _useremail,
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: "Enter your email"),
            ),
            TextField(
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              controller: _password,
              decoration: InputDecoration(hintText: "Enter your password"),
            ),
            TextButton(
              onPressed: () async {
                final useremail = _useremail.text;
                final password = _password.text;

                try {
                  final usercredentials = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: useremail, password: password);
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(verifyRoute, (route) => false);
                } on FirebaseAuthException catch (e) {
                  if (e.code == "weak-password") {
                    showErrorDialog(context, e.code);
                  } else if (e.code == "email-already-in-use") {
                    showErrorDialog(context, e.code);
                  } else if (e.code == "invalid-email") {
                    showErrorDialog(context, e.code);
                  }
                } catch (e) {
                  showErrorDialog(context, e.toString());
                }
              },
              child: const Text("Regsiter"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoutes, (route) => false);
                },
                child: Text("Already have an account? Login."))
          ],
        ),
      ),
    );
  }
}
