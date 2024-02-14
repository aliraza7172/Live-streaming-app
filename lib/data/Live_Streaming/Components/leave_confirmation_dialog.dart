//
import 'package:flutter/material.dart';

Future<dynamic> setUpLeaveConfirmationDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.blue[900]!.withOpacity(0.9),
        title: const Text("Live Streaming Call Exit",
            style: TextStyle(color: Colors.white70)),
        content: const Text(
            "You can surely  continue watching this Live Streaming or exit from it.",
            style: TextStyle(color: Colors.white70)),
        actions: [
          ElevatedButton(
            child:
                const Text("Cancel", style: TextStyle(color: Colors.white70)),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          ElevatedButton(
            child: const Text("Exit"),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      );
    },
  );
}
