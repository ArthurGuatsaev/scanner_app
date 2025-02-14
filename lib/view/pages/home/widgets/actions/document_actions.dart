import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/view/pages/home/cubit/home_cubit.dart';
import 'package:test_work/view/widgets/actions_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'add_action_button.dart';

class DocumentActions extends StatelessWidget {
  final int index;
  const DocumentActions({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 68,
            width: 256,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34), color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionsButton(
                    func: () {
                      context.read<HomeCubit>().setIndex(1);
                    },
                    name: AppLocalizations.of(context)!.documents,
                    active: index == 1,
                    width: 140),
                const Spacer(),
                ActionsButton(
                    func: () {
                      context.read<HomeCubit>().setIndex(2);
                    },
                    name: AppLocalizations.of(context)!.tools,
                    active: index == 2,
                    width: 86),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const AddActionButton()
        ],
      ),
    );
  }
}
