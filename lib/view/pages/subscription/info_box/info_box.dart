import 'package:flutter/material.dart';

import 'widgets/header_row.dart';
import 'widgets/icons_row.dart';
import 'widgets/subtitle_row.dart';
import 'widgets/title_row.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 396,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: const Color(0xff364EFF)),
        child: const Column(
          children: [
            SizedBox(height: 10),
            HeaderRow(),
            SizedBox(height: 15),
            TitleRow(),
            SizedBox(height: 15),
            SubtitleRow(),
            SizedBox(height: 25),
            IconsRow(),
          ],
        ),
      ),
    );
  }
}
