import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_work/services/subscription/data/bloc/sub_bloc.dart';
import 'widgets/privacy_restore_item.dart';

class PrivacyAndRestoreBox extends StatelessWidget {
  const PrivacyAndRestoreBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      fillOverscroll: false,
      hasScrollBody: false,
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28)),
            color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            PrivacyAndRestoreItem(
                name: AppLocalizations.of(context)!.terms, func: () {}),
            PrivacyAndRestoreItem(
                name: AppLocalizations.of(context)!.restore,
                func: () {
                  context.read<SubBloc>().add(PressRestorePurchase());
                }),
            PrivacyAndRestoreItem(
                name: AppLocalizations.of(context)!.privacy, func: () {}),
          ],
        ),
      ),
    );
  }
}
