import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_work/services/subscription/domain/model/product_model.dart';

class PeriodDetector extends StatelessWidget {
  final ProductModel? productModel;
  final int index;
  const PeriodDetector({
    super.key,
    required this.productModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    String price = productModel?.prettyPrice ?? '';
    if (productModel?.introductoryPrice != null) {
      price = productModel!.introductoryPrice!;
    }
    final text = switch ((
      productModel?.period,
      productModel?.introductoryPrice == null
    )) {
      ('week', false) =>
        '${AppLocalizations.of(context)!.then} $price/${AppLocalizations.of(context)!.week}',
      ('day', _) => '',
      ('month', _) => '',
      ('year', _) => AppLocalizations.of(context)!.enjoyUnlimitedAccess,
      _ => index == 1
          ? '${AppLocalizations.of(context)!.then} $price/${AppLocalizations.of(context)!.week}'
          : AppLocalizations.of(context)!.enjoyUnlimitedAccess,
    };
    return Text(text, style: Theme.of(context).textTheme.bodySmall);
  }
}
