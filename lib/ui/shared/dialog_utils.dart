import 'package:flutter/material.dart';

Future<bool?> showComfirmDialog(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Ban co muon lam vay that khong??'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () => {
            Navigator.of(ctx).pop(
              false,
            )
          },
          child: const Text('Khong nha'),
        ),
        TextButton(
          onPressed: () => {
            Navigator.of(ctx).pop(true),
          },
          child: const Text('Chac chan nha'),
        ),
      ],
    ),
  );
}

Future<void> showErrorDialog(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('An Error Occurred!'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text('Okay'),
          onPressed: () {
            Navigator.of(ctx).pop();
          },
        )
      ],
    ),
  );
}
