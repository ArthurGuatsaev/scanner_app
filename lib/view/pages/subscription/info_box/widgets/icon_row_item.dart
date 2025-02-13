import 'package:flutter/material.dart';

class IconRowItem extends StatelessWidget {
  const IconRowItem({
    super.key,
    required this.icon,
    required this.name,
  });
  final String icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(children: [
      Image.asset('assets/images/$icon.png'),
      const SizedBox(height: 5),
      Text(name,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white))
    ]));
  }
}
