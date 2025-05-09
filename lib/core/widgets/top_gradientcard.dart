import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  final List<Color> gradientcolors;
  final double customwidth;
  final double customheight;
  final Alignment customalighnmentbegin;
  final Alignment customalighnmentend;
  final Radius bottomleftval;
  final Radius bottomrightval;
  const GradientCard({
    super.key,
    required this.gradientcolors,
    required this.customwidth,
    required this.customheight,
    required this.customalighnmentbegin,
    required this.customalighnmentend,
    required this.bottomleftval,
    required this.bottomrightval,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: customwidth,
      height: customheight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: bottomleftval,
          bottomRight: bottomrightval,
          // bottomLeft: Radius.circular(40),
          // bottomRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
            begin: customalighnmentbegin,
            end: customalighnmentend,
            colors: gradientcolors),
        boxShadow: const [
          BoxShadow(
            color: kBlackgrey,
            offset: Offset(4.0, 4.0),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
    );
  }
}
