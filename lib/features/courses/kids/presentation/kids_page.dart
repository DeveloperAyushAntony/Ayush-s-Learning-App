import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/core/widgets/top_gradientcard.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/back_button.dart';
import 'package:awoke_learning_app/features/mainpage/widgets/green_gradient_widget.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class KidsPage extends StatelessWidget {
  const KidsPage({super.key});

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
                        Color(0xff0AA8B2),
                        Color(0xff04484C),
                      ],
                      customwidth: 300,
                      customheight: 200,
                      customalighnmentbegin: Alignment.topLeft,
                      customalighnmentend: Alignment.bottomRight),
                  const Positioned(
                      left: 10, top: 20, child: CustomBackButton()),
                  Positioned(
                    left: 80,
                    top: 130,
                    child: Text(
                      "Courses for KIDS",
                      style: headcardtext,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 250,
            width: 250,
            child: Lottie.asset("assets/json/kg1.json"),
          ),
          const GreenGradientWidget(headtext: "courses"),
          kHeight35,
          const HorizontallyScrollableCards(),
        ],
      )),
    );
  }
}

class HorizontallyScrollableCards extends StatelessWidget {
  const HorizontallyScrollableCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Adjust the height of the cards container
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            CardItem(
              title: 'Card 1',
              description: 'This is the first card.',
              colors: [
                Color(0xff0AA8B2),
                Color(0xff04484C),
              ],
              icon: Icons.star,
            ),
            CardItem(
              title: 'Card 2',
              description: 'This is the second card.',
              colors: [
                Color(0xffFD0514),
                Color(0xff97030C),
              ],
              icon: Icons.favorite,
            ),
            CardItem(
              title: 'Card 3',
              description: 'This is the third card.',
              colors: [
                Color(0xff8E17D7),
                Color(0xff4A0C71),
              ],
              icon: Icons.access_alarm,
            ),
            CardItem(
              title: 'Card 3',
              description: 'This is the third card.',
              colors: [
                Color(0xff2CB20A),
                Color(0xff134C04),
              ],
              icon: Icons.access_alarm,
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String description;
  final List<Color> colors;
  final IconData icon;

  const CardItem({
    super.key,
    required this.title,
    required this.description,
    required this.colors,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: kBlackgrey,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 150,
        width: 300,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
