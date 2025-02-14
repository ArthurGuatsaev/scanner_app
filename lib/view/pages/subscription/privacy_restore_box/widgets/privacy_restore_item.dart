import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyAndRestoreItem extends StatelessWidget {
  const PrivacyAndRestoreItem({
    super.key,
    required this.func,
    required this.name,
  });
  final String name;
  final Function() func;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CupertinoButton(
      onPressed: func,
      child: Text(
        name,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Colors.black.withOpacity(0.25), fontWeight: FontWeight.w400),
      ),
    ));
  }
}
