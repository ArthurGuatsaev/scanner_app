import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton(
      {super.key,
      required this.func,
      required this.name,
      this.heitht,
      this.active,
      this.textStyle,
      this.width});
  final Function() func;
  final String name;
  final double? heitht;
  final double? width;
  final bool? active;
  final TextStyle? textStyle;
  LinearGradient get getGradient => switch (active) {
        false =>
          const LinearGradient(colors: [Color(0xffF5F5F5), Color(0xffF5F5F5)]),
        _ =>
          const LinearGradient(colors: [Color(0xff364EFF), Color(0xff5436FF)]),
      };

  @override
  Widget build(BuildContext context) {
    double borderRadius = 34;
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: func,
        child: Ink(
            height: heitht ?? 56,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: const LinearGradient(
                    colors: [Color(0xff364EFF), Color(0xff5436FF)])),
            child: Center(
              child: Text(name,
                  style: textStyle ??
                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w700)),
            )),
      ),
    );
  }
}
