import 'package:flutter/material.dart';

class SubRowBorder extends StatelessWidget {
  const SubRowBorder({super.key, required this.child, required this.isActive});
  final Widget child;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: isActive
            ? const LinearGradient(colors: [
                Color(0xff364EFF),
                Color(0xff5436FF),
              ])
            : const LinearGradient(colors: [
                Color(0xffF2F4FF),
                Color(0xffF2F4FF),
              ]),
      ),
      child: child,
    );
  }
}
