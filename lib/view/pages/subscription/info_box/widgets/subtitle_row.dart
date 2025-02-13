import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubtitleRow extends StatelessWidget {
  const SubtitleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Flexible(
          child: Text(AppLocalizations.of(context)!.signDocumentsAnytime,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white)))
    ]);
  }
}
