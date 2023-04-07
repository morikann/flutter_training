import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.errorDescription});

  final String errorDescription;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('エラー'),
      content: Text(errorDescription),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
