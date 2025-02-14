import 'package:flutter/material.dart';

class BoardItem extends StatelessWidget {
  const BoardItem(
      {super.key,
      required this.image,
      required this.subtitle,
      required this.title});
  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xff364EFF),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Stack(
          children: [
            Column(
              children: [
                Text(title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700)),
                const SizedBox(height: 15),
                Text(subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white, fontSize: 21)),
              ],
            ),
            Positioned(
                bottom: 0,
                child: Image.asset('assets/images/$image.png',
                    alignment: Alignment.bottomCenter))
          ],
        ),
      ),
    );
  }
}
