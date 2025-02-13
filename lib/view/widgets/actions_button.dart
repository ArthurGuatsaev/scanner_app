import 'package:flutter/material.dart';

class ActionsButton extends StatelessWidget {
  const ActionsButton(
      {super.key,
      required this.func,
      required this.name,
      this.heitht,
      this.active,
      this.width});
  final Function() func;
  final String name;
  final double? heitht;
  final double? width;
  final bool? active;

  LinearGradient get getGradient => switch (active) {
        false =>
          const LinearGradient(colors: [Color(0xffF5F5F5), Color(0xffF5F5F5)]),
        _ =>
          const LinearGradient(colors: [Color(0xff364EFF), Color(0xff5436FF)]),
      };

  Color get textColor {
    if (active == true) return Colors.white;
    return Colors.black.withOpacity(0.25);
  }

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
                gradient: getGradient),
            child: Center(
              child: Text(name,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                      color: textColor,
                      fontWeight:
                          active == true ? FontWeight.w700 : FontWeight.w400)),
            )),
      ),
    );
  }
}
