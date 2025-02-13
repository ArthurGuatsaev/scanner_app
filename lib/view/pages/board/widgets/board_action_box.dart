import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:test_work/routings/router.dart';
import 'package:test_work/view/widgets/buttons/base_button.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'board_indicators.dart';

class BoardActionBox extends StatefulWidget {
  const BoardActionBox({
    super.key,
    required this.controller,
  });
  final PageController controller;

  @override
  State<BoardActionBox> createState() => _BoardActionBoxState();
}

class _BoardActionBoxState extends State<BoardActionBox> {
  late ValueNotifier<int> pageValue;
  @override
  void initState() {
    pageValue = ValueNotifier<int>(0);
    pageValue.addListener(nextBoard);
    super.initState();
  }

  // show next board
  Future<void> nextBoard() async {
    if (pageValue.value > 1) MyNavigatorManager.instance.pushSub();
    widget.controller.nextPage(
        duration: const Duration(milliseconds: 250), curve: Curves.linear);
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  // press continues
  void pressContinues() => pageValue.value += 1;
  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28), color: Colors.white),
      child: Column(
        children: [
          BaseButton(func: pressContinues, name: appLoc.continues),
          const SizedBox(height: 15),
          BoardIndicators(pageValue: pageValue),
        ],
      ),
    );
  }
}
