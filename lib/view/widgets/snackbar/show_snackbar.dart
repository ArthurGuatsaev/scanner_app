import 'package:flutter/material.dart';

SnackBar showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  return SnackBar(
      backgroundColor: const Color.fromARGB(255, 60, 60, 60),
      content: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.white),
      ));
}
