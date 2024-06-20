import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/core/widgets/top_gradientcard.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/back_button.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class KgPage extends StatelessWidget {
  const KgPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  const GradientCard(
                      bottomleftval: Radius.zero,
                      bottomrightval: Radius.circular(40),
                      gradientcolors: [
                        Color(0xff2CB20A),
                        Color(0xff134C04),
                      ],
                      customwidth: 300,
                      customheight: 200,
                      customalighnmentbegin: Alignment.topLeft,
                      customalighnmentend: Alignment.bottomRight),
                  const Positioned(
                      left: 30, top: 20, child: CustomBackButton()),
                  Positioned(
                    left: 90,
                    top: 130,
                    child: Text(
                      "Courses for Kg",
                      style: headcardtext,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: Lottie.asset("assets/json/kg1.json"),
          )
        ],
      )),
    );
  }
}
