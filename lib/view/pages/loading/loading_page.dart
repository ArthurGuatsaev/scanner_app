// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final int progress;
  const LoadingPage({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: LoadingIndicator(value: progress / 100),
          ),
          const Text('Loading. Please wait...'),
          const SizedBox(height: 20),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  final double value;
  const LoadingIndicator({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(width: 2, color: Colors.white)),
        child: LinearProgressIndicator(
          borderRadius: BorderRadius.circular(5),
          value: value,
          minHeight: 15,
          backgroundColor: Colors.white,
          color: const Color(0xffB99BE6),
        ),
      ),
    );
  }
}
