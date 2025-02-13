import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.func,
    required this.image,
    required this.name,
  });
  final Function() func;
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        height: 46,
        width: 177,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(34)),
        child: Row(
          children: [
            Text(name,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 15)),
            const Spacer(),
            Image.asset('assets/images/$image.png')
          ],
        ),
      ),
    );
  }
}
