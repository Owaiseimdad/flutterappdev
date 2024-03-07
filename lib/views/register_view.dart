import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        appBar: AppBar(title: const Text("Register")),
        body: FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return Center(
                    child: Column(
                      children: [
                        TextField(
                          controller: _useremail,
                          autocorrect: false,
                          enableSuggestions: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration:
                              InputDecoration(hintText: "Enter your email"),
                        ),
                        TextField(
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                          controller: _password,
                          decoration:
                              InputDecoration(hintText: "Enter your password"),
                        ),
                        TextButton(
                          onPressed: () async {
                            final useremail = _useremail.text;
                            final password = _password.text;

                            try {
                              final usercredentials = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                      email: useremail, password: password);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == "weak-password") {
                                print("Weak Password");
                              } else if (e.code == "email-already-in-use") {
                                print("Users exist");
                              } else if (e.code == "invalid-email") {
                                print("Invalid email");
                              }
                            }
                          },
                          child: const Text("Regsiter"),
                        ),
                      ],
                    ),
                  );
                default:
                  return const Text("Loading...");
              }
            }));
  }
}
