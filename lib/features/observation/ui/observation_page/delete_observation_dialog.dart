import 'package:flutter/material.dart';

class DeleteObservationDialog extends StatelessWidget {
  const DeleteObservationDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Please Confirm'),
      content: const Text('Delete this observation?'),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop(true);
          },
          child: const Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('No'),
        )
      ],
    );
  }
}
