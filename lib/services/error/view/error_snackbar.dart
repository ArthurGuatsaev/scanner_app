import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

SnackBar errorSnackBar(BuildContext context, int code) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  switch (code) {
    case 111:
      return SnackBar(
          content: Text(AppLocalizations.of(context)!.thereIsBeenMistake));
    case 222:
      return SnackBar(
          content: Text(AppLocalizations.of(context)!.youHaveNoSubscription));
    default:
      return SnackBar(
          content: Text(AppLocalizations.of(context)!.thereIsBeenMistake));
  }
}
