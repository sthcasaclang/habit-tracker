import 'package:flutter/material.dart';

class AddHabitDialog extends StatelessWidget {
  const AddHabitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
