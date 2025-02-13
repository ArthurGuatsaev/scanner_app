import 'package:flutter/material.dart';
import 'package:test_work/view/pages/board/widgets/board_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BoardBox extends StatelessWidget {
  const BoardBox({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.7;
    final appLocal = AppLocalizations.of(context)!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: SizedBox(
        height: height,
        child: PageView(
          controller: controller,
          children: [
            BoardItem(
                image: 'board_one',
                subtitle: appLocal.signAnyDocument,
                title: appLocal.effortlesslySign),
            BoardItem(
                image: 'board_two',
                subtitle: appLocal.designAndStoreYour,
                title: appLocal.createSaveSignatures),
          ],
        ),
      ),
    );
  }
}
