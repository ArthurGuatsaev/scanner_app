import 'package:flutter/material.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset('assets/images/sub_sign.png'),
      const SizedBox(width: 10),
      Image.asset('assets/images/pro.png'),
      const Spacer(),
      GestureDetector(
          onTap: Navigator.of(context).pop,
          child: Image.asset('assets/images/close.png'))
    ]);
  }
}
