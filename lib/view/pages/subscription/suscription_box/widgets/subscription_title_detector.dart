import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_work/services/subscription/domain/model/product_model.dart';

class SubscriptionTitleDetector extends StatelessWidget {
  final ProductModel? productModel;
  final bool isActive;
  final int index;
  const SubscriptionTitleDetector({
    super.key,
    required this.productModel,
    required this.isActive,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final text = switch ((
      productModel?.period,
      productModel?.introductoryPrice == null,
    )) {
      ('week', false) => AppLocalizations.of(context)!.freeTrial,
      ('week', true) => AppLocalizations.of(context)!.weeklyPlan,
      ('day', _) => '',
      ('month', _) => '',
      ('year', _) => AppLocalizations.of(context)!.annualPlan,
      _ => index == 1
          ? AppLocalizations.of(context)!.freeTrial
          : AppLocalizations.of(context)!.annualPlan,
    };
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: isActive ? const Color(0xff364EFF) : null,
          height: 1,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w700),
    );
  }
}
