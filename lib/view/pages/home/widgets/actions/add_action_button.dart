import 'package:flutter/material.dart';

import '../documents/pop_up/menu.dart';

class AddActionButton extends StatefulWidget {
  const AddActionButton({
    super.key,
  });

  @override
  State<AddActionButton> createState() => _AddActionButtonState();
}

class _AddActionButtonState extends State<AddActionButton>
    with TickerProviderStateMixin {
  late final controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 250));
  late final animation = Tween<double>(begin: 0, end: 0.8).animate(controller);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return GestureDetector(
            onTap: () {
              controller.isCompleted
                  ? controller.reverse()
                  : controller.forward();
              showScannerMenu(context, controller);
            },
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              padding: const EdgeInsets.all(5),
              transform: Matrix4.rotationZ(animation.value),
              transformAlignment: Alignment.center,
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff364EFF)),
                child: Image.asset('assets/images/plus.png', width: 52),
              ),
            ),
          );
        });
  }
}
