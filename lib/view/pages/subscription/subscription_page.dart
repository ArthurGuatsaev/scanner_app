import 'package:flutter/material.dart';

import 'info_box/info_box.dart';
import 'privacy_restore_box/privacy_restore_box.dart';
import 'suscription_box/subscription_box.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              InfoBox(),
              SubscriptionBox(),
              PrivacyAndRestoreBox(),
            ],
          )),
    );
  }
}
