import 'package:flutter/material.dart';

class BoardIndicators extends StatelessWidget {
  const BoardIndicators({super.key, required this.pageValue});
  final ValueNotifier<int> pageValue;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pageValue,
        builder: (context, value, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IndicatorItem(isActive: value == 0),
              const SizedBox(width: 5),
              IndicatorItem(isActive: value == 1),
            ],
          );
        });
  }
}

class IndicatorItem extends StatelessWidget {
  const IndicatorItem({
    super.key,
    required this.isActive,
  });
  final bool isActive;

  LinearGradient get grad => isActive
      ? const LinearGradient(colors: [Color(0xff364EFF), Color(0xff5436FF)])
      : const LinearGradient(colors: [Color(0xffF5F5F5), Color(0xffF5F5F5)]);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      width: 14,
      decoration: BoxDecoration(shape: BoxShape.circle, gradient: grad),
    );
  }
}
