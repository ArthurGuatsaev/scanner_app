import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/services/subscription/data/bloc/sub_bloc.dart';
import 'package:test_work/services/subscription/domain/model/product_model.dart';
import 'package:test_work/view/pages/subscription/suscription_box/widgets/subscription_title_detector.dart';
import 'package:test_work/view/widgets/loading_indicator.dart';

import 'period_detector.dart';
import 'subscription_row_border.dart';

class SubscriptionRow extends StatelessWidget {
  const SubscriptionRow({
    super.key,
    this.product,
    required this.isLoading,
    required this.isActive,
    required this.index,
  });

  final ProductModel? product;
  final bool isLoading;
  final bool isActive;
  final int index;

  @override
  Widget build(BuildContext context) {
    final price = index == 1 ? 0 : 39.99;
    return GestureDetector(
      onTap: () {
        context.read<SubBloc>().add(PressProductActive(product: product));
      },
      child: SubRowBorder(
        isActive: isActive,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xffF2F4FF),
          ),
          padding: const EdgeInsets.all(10),
          child: Builder(builder: (context) {
            if (isLoading && isActive) return const LoadingIndicator();
            return Row(
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubscriptionTitleDetector(
                            productModel: product,
                            isActive: isActive,
                            index: index),
                        const SizedBox(height: 10),
                        PeriodDetector(productModel: product, index: index),
                      ]),
                ),
                Text(
                  product?.prettyPrice ?? '\$$price',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
