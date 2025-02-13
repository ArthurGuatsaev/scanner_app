import 'package:flutter/material.dart';
import 'package:test_work/view/pages/subscription/subscription_page.dart';

Future showSubscriptionPop(BuildContext context, Function() func) async {
  return showDialog(
    context: context,
    useSafeArea: false,
    builder: (context) {
      return const SubscriptionPage();
    },
  );
}
