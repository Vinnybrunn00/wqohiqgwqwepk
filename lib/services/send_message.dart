import 'package:flutter/material.dart';

Future<dynamic> dialogBarError({
  required BuildContext context,
  required String message,
}) async {
  AlertDialog dialogMessage = AlertDialog(
    backgroundColor: Colors.grey[900],
    title: const Text(
      'ERROR',
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    ),
    content: Text(
      message,
      style: TextStyle(
        color: Colors.grey[400],
        fontSize: 16,
      ),
      textAlign: TextAlign.center,
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Ok',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ],
  );
  await showDialog(context: context, builder: (_) => dialogMessage);
}
