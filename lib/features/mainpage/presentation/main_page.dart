import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/features/mainpage/widgets/awoke_logo.dart';
import 'package:awoke_learning_app/features/mainpage/widgets/drawer_menu_button.dart';
import 'package:awoke_learning_app/features/mainpage/widgets/green_gradient_widget.dart';
import 'package:awoke_learning_app/features/mainpage/widgets/home_welcome_text.dart';
import 'package:awoke_learning_app/features/mainpage/widgets/mentor_image.dart';
import 'package:flutter/material.dart';

class HomeUiScreen extends StatelessWidget {
  const HomeUiScreen({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  kHeight30,
                  DrawerMenuButton(scaffoldKey: scaffoldKey),
                ],
              ),
              kWidth30,
              const HomeWelcomeText(),
              kWidth30,
              const Awokelogo(),
            ],
          ),
          kHeight80,
          const GreenGradientWidget(
            headtext: "your mentors",
          ),
          kHeight35,
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MentorImageWidget(
                imagePath: "assets/images/artistpng.png",
              ),
              kWidth55,
              kWidth20,
              MentorImageWidget(
                imagePath: "assets/images/artistpng.png",
              )
            ],
          ),
          kHeight15,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 220,
                  color: kPurpleColor,
                ),
                kWidth10,
                Container(
                  height: 120,
                  width: 220,
                  color: kblueColor,
                ),
                kWidth10,
                Container(
                  height: 120,
                  width: 220,
                  color: kRedColor,
                ),
                kWidth10,
                Container(
                  height: 120,
                  width: 220,
                  color: kblueColor,
                ),
                kWidth10,
                Container(
                  height: 120,
                  width: 220,
                  color: kblueColor,
                ),
              ],
            ),
          ),
          kHeight35,
          const GreenGradientWidget(
            headtext: "Courses",
          ),
          kHeight30,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeCoursegradientCard(
                gradientcolors: [
                  Color(0xff2CB20A),
                  Color(0xff134C04),
                ],
              ),
              HomeCoursegradientCard(
                gradientcolors: [
                  Color(0xff0AA8B2),
                  Color(0xff04484C),
                ],
              ),
            ],
          ),
          kHeight30,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeCoursegradientCard(
                gradientcolors: [
                  Color(0xffFD0514),
                  Color(0xff97030C),
                ],
              ),
              HomeCoursegradientCard(
                gradientcolors: [
                  Color(0xff8E17D7),
                  Color(0xff4A0C71),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HomeCoursegradientCard extends StatelessWidget {
  final List<Color> gradientcolors;

  const HomeCoursegradientCard({super.key, required this.gradientcolors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 165,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: gradientcolors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      // child: Column(
      //   children: [],
      // ),
    );
  }
}
