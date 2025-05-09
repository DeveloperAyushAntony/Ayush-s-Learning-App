
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class GreenGradientWidget extends StatelessWidget {
  final String headtext;

  const GreenGradientWidget({super.key, required this.headtext});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            width: 160,
            height: 32,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.yellow,
                  Color(0xff87C603),
                ],
              ),
            ),
            child: Center(
              child: Text(
                headtext,
                style: homeGreadientext,
              ),
            )),
      ],
    );
  }
}