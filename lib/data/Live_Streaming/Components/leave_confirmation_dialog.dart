//
import 'package:flutter/material.dart';

Future<dynamic> setUpLeaveConfirmationDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.blue[900]!.withOpacity(0.9),
        title: const Text("Leave To Room",
            style: TextStyle(color: Colors.white70)),
        content: const Text(
            "You can surely  continue watching this Live Streaming or exit from it.",
            style: TextStyle(color: Colors.white70)),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black)),
            child:
                const Text("Cancel", style: TextStyle(color: Colors.white70)),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black)),
            child: const Text("Exit"),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      );
    },
  );
}
