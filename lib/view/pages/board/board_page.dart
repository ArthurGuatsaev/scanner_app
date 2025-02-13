import 'package:flutter/material.dart';
import 'package:test_work/view/pages/board/widgets/board_action_box.dart';
import 'widgets/board_box.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({super.key});

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  late final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              BoardBox(controller: controller),
              const Spacer(),
              const SizedBox(height: 20),
              BoardActionBox(controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}
