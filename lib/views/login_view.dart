// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import '../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
        title: Text('Login'),
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
                      .signInWithEmailAndPassword(
                          email: useremail, password: password);

                  print(usercredentials);
                } on FirebaseAuthException catch (e) {
                  print(e.code);
                } catch (e) {
                  print(e.runtimeType);
                }
              },
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/register/', (route) => false);
              },
              child: const Text("Not registered yet? Click here."),
            ),
          ],
        ),
      ),
    );
  }
}
