import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'icon_row_item.dart';

class IconsRow extends StatelessWidget {
  const IconsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      IconRowItem(icon: 'unlimited', name: appLoc.unlimitedSignatures),
      IconRowItem(icon: 'scanner', name: appLoc.documentScanner),
      IconRowItem(icon: 'ads', name: appLoc.adFreeExperience),
    ]);
  }
}
