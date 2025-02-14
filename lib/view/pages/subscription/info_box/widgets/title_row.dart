import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(AppLocalizations.of(context)!.premiumDocument,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                letterSpacing: 0)));
  }
}
