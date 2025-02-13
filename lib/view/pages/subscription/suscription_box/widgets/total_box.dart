import 'package:flutter/material.dart';
import 'package:test_work/services/subscription/domain/model/product_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TotalBox extends StatelessWidget {
  const TotalBox({
    super.key,
    required this.productModel,
  });
  final ProductModel? productModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(AppLocalizations.of(context)!.total,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w500)),
          const Spacer(),
          Text(
            productModel?.prettyPrice ?? '0',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: const Color(0xff364EFF), fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
