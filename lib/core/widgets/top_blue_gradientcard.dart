import 'package:flutter/material.dart';

class Gradientbluecard extends StatelessWidget {
  const Gradientbluecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 280,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Color(0xff153B9C),
            Color(0xff1C4FD1),
          ],
        ),
      ),
    );
  }
}
