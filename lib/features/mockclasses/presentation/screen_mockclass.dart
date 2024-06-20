import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/core/widgets/top_gradientcard.dart';

import 'package:flutter/material.dart';

class ScreenMockClass extends StatelessWidget {
  const ScreenMockClass({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                const GradientCard(
                  bottomleftval: Radius.circular(40),
                  bottomrightval: Radius.circular(40),
                  customalighnmentbegin: Alignment.bottomCenter,
                  customalighnmentend: Alignment.topCenter,
                  customheight: 80,
                  customwidth: 800,
                  gradientcolors: [
                    Color(0xff30448C),
                    Color(0xff0D1326),
                  ],
                ),
                Align(
                  heightFactor: 2,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Sample Classes",
                    style: appTexttitle,
                  ),
                )
              ],
            ),
            kHeight10,
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                    width: 190,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "How to learn English",
                          style: bodyText,
                        ),
                        Text(
                          "10 min",
                          style: bodyText,
                        )
                      ],
                    ),
                  );
                },
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const VideoWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 20,
      color: kRedColor,
      child: const Center(
        child: Icon(
          Icons.play_circle_outline_rounded,
          size: 50,
        ),
      ),
    );
  }
}
