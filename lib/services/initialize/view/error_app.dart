import 'package:flutter/material.dart';

class ErrorApp extends StatelessWidget {
  final Object error;
  const ErrorApp({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Builder(builder: (context) {
          return const Text('Error');
        })),
      ),
    );
  }
}
