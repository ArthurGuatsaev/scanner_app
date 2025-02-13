import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_work/services/subscription/data/bloc/sub_bloc.dart';
import 'package:test_work/view/widgets/buttons/base_button.dart';
import 'widgets/subscription_row.dart';
import 'widgets/total_box.dart';

class SubscriptionBox extends StatelessWidget {
  const SubscriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<SubBloc, SubState>(
        builder: (context, state) {
          final pr = state.products.firstOrNull;
          final anual = state.products.last;
          final active = state.activeProduct;
          final haveTrial = active?.trialPeriod != null;
          return Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28)),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubscriptionRow(
                    index: 1,
                    isLoading: state.isLoading,
                    product: pr,
                    isActive: pr?.id == active?.id),
                const SizedBox(height: 10),
                SubscriptionRow(
                    index: 2,
                    isLoading: state.isLoading,
                    product: anual,
                    isActive: anual.id == active?.id),
                const SizedBox(height: 20),
                TotalBox(productModel: active),
                const SizedBox(height: 20),
                // активный продукт проверить наличие триала
                BaseButton(
                  func: () {
                    context
                        .read<SubBloc>()
                        .add(PressBuyProduct(product: active));
                  },
                  name: haveTrial
                      ? AppLocalizations.of(context)!.tryForFree
                      : AppLocalizations.of(context)!.continues,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
