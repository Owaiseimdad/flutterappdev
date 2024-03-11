import 'package:flutter/material.dart';

Future<void> showTextDialog(
    BuildContext context, String text, String headertext) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(headertext),
          content: Text(text),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Okay")),
          ],
        );
      }).then((value) => value ?? false);
}
