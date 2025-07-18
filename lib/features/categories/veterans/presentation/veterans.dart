import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/core/widgets/top_gradientcard.dart';
import 'package:awoke_learning_app/features/auth_google/presentation/widgets/back_button.dart';
import 'package:awoke_learning_app/features/mainpage/widgets/green_gradient_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class VeteransPage extends StatelessWidget {
  const VeteransPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                        Color(0xffFD8B05),
                        Color(0xff844306),
                      ],
                      customwidth: 330,
                      customheight: 200,
                      customalighnmentbegin: Alignment.topLeft,
                      customalighnmentend: Alignment.bottomRight),
                  const Positioned(
                      left: 10, top: 20, child: CustomBackButton()),
                  Positioned(
                    left: 20,
                    top: 130,
                    child: Text(
                      "Courses for Veterans",
                      style: headcardtext,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.35,
            width: size.width * 0.65,
            child: Lottie.asset("assets/json/veterans1.json"),
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
              courseId: 51,
              colors: [
                Color(0xffFD8B05),
                Color(0xff844306),
              ],
              imageheight: 145,
              imagewidth: 200,
              route: '/creativewriting',
            ),
            CardItem(
              asset: 'assets/images/publicspeaking.svg',
              description: 'Public Speaking',
              courseId: 52,
              colors: [
                Color(0xff8E17D7),
                Color(0xff4A0C71),
              ],
              imageheight: 145,
              imagewidth: 200,
              route: '/publicspeaking',
            ),
            CardItem(
              asset: 'assets/images/personality.svg',
              description: 'Personality Development',
              courseId: 53,
              colors: [
                Color(0xff2CB20A),
                Color(0xff134C04),
              ],
              imageheight: 145,
              imagewidth: 200,
              route: '/personalitydevelopment',
            ),
            CardItem(
              asset: 'assets/images/interview.svg',
              description: 'Interview Preparation',
              courseId: 54,
              colors: [
                Color(0xffFD0514),
                Color(0xff97030C),
              ],
              imageheight: 145,
              imagewidth: 200,
              route: '/interviewpreparation',
            ),
            CardItem(
              asset: 'assets/images/comingsoon.svg',
              courseId: 0,
              description: '',
              colors: [
                Color(0xff0AA8B2),
                Color(0xff04484C),
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
  final double courseId;
  const CardItem({
    super.key,
    required this.asset,
    required this.description,
    required this.colors,
    required this.imageheight,
    required this.imagewidth,
    required this.route,
    required this.courseId,
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
              Navigator.of(context).pushNamed(route, arguments: courseId);
            }
          },
          child: SizedBox(
            height: 200,
            width: 320,
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
