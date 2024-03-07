// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:learning_free_code_camp/views/home_view.dart';
import 'package:learning_free_code_camp/views/register_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Firebase Works',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const HomePage(),
  ));
}
