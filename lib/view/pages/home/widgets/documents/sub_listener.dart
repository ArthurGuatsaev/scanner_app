import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/routings/router.dart';
import 'package:test_work/services/subscription/data/bloc/sub_bloc.dart';
import 'package:test_work/view/widgets/snackbar/show_snackbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubHomeListener extends StatelessWidget {
  const SubHomeListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubBloc, SubState>(
      listenWhen: (previous, current) => previous.haveSub != current.haveSub,
      listener: (context, state) {
        if (state.haveSub) {
          ScaffoldMessenger.of(context).showSnackBar(showSnackBar(
              context, AppLocalizations.of(context)!.youAreSubscribed));
          if (MyRouterDelegate.instance.isSubOpen) Navigator.of(context).pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(showSnackBar(
              context, AppLocalizations.of(context)!.youHaveNoSubscription));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
