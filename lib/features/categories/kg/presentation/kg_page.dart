import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/core/widgets/top_gradientcard.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/back_button.dart';
import 'package:awoke_learning_app/features/mainpage/widgets/green_gradient_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                      left: 10, top: 20, child: CustomBackButton()),
                  Positioned(
                    left: 90,
                    top: 130,
                    child: Text(
                      "Courses for KG",
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
      height: 220,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            CardItem(
              asset: 'assets/images/creativewriting.svg',
              description: 'Creative Writing',
              colors: [
                Color(0xff2CB20A),
                Color(0xff134C04),
              ],
              imageheight: 145,
              imagewidth: 200,
              route: '/creativewriting',
            ),
            CardItem(
              asset: 'assets/images/publicspeaking.svg',
              description: 'Public Speaking',
              colors: [
                Color(0xffFD0514),
                Color(0xff97030C),
              ],
              imageheight: 145,
              imagewidth: 200,
              route: '/publicspeaking',
            ),
            CardItem(
              asset: 'assets/images/comingsoon.svg',
              description: '',
              colors: [
                Color(0xff8E17D7),
                Color(0xff4A0C71),
              ],
              imageheight: 170,
              imagewidth: 210,
              route: '',
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String asset;
  final String description;
  final List<Color> colors;
  final double imageheight;
  final double imagewidth;
  final String route;
  const CardItem({
    super.key,
    required this.asset,
    required this.description,
    required this.colors,
    required this.imageheight,
    required this.imagewidth,
    required this.route,
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
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: kWhiteColor.withOpacity(0.5),
          onTap: () {
            if (route.isNotEmpty) {
              Navigator.of(context).pushNamed(route);
            }
          },
          child: SizedBox(
            height: 130,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: imageheight,
                    width: imagewidth,
                    child: SvgPicture.asset(asset),
                  ),
                  if (description.isNotEmpty)
                    Text(
                      description,
                      style: cardtext,
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
