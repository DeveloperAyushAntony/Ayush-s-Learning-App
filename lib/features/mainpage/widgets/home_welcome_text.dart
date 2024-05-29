import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class HomeWelcomeText extends StatelessWidget {
  const HomeWelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight30,
        Text(
          "Hello",
          style: mainpageheadtext,
        ),
        Text(
          "Ayush",
          style: mainpagepersontext,
        )
      ],
    );
  }
}
