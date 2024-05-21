import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class GradientBlueCard extends StatelessWidget {
  const GradientBlueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 280,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Color(0xff153B9C),
            Color(0xff1C4FD1),
          ],
        ),
        boxShadow: [
          // Use a list of BoxShadow objects
          BoxShadow(
            color:
                kBlackgrey, // Assuming kBlackgrey is defined in app_styles.dart
            offset: Offset(4.0, 4.0),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
    );
  }
}
