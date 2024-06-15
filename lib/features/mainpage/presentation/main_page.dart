import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/features/mainpage/widgets/awoke_logo.dart';
import 'package:awoke_learning_app/features/mainpage/widgets/drawer_menu_button.dart';
import 'package:awoke_learning_app/features/mainpage/widgets/green_gradient_widget.dart';
import 'package:awoke_learning_app/features/mainpage/widgets/home_welcome_text.dart';
import 'package:awoke_learning_app/features/mainpage/widgets/mentor_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                kWidth10,
                DrawerMenuButton(scaffoldKey: scaffoldKey),
                kWidth40,
                const Column(
                  children: [
                    HomeWelcomeText(),
                    kHeight30,
                  ],
                ),
                kWidth40,
                const Awokelogo(
                  logoheight: 75,
                  logowidth: 69,
                ),
                kWidth10
              ],
            ),
          ),
          kHeight30,
          const GreenGradientWidget(
            headtext: "Your Mentors",
          ),
          kHeight35,
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MentorImageWidget(
                imagePath: "assets/images/mentor.svg",
              ),
              kWidth55,
              kWidth20,
              MentorImageWidget(
                imagePath: "assets/images/mentor.svg",
              )
            ],
          ),
          kHeight15,
          CarouselSlider(
            options: CarouselOptions(
                height: 120,
                autoPlay: true,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                viewportFraction: 0.7,
                aspectRatio: 2.0,
                initialPage: 0,
                autoPlayCurve: Curves.easeIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 300)),
            items: [
              Container(
                height: 120,
                width: 220,
                color: kPurpleColor,
              ),
              Container(
                height: 120,
                width: 220,
                color: kblueColor,
              ),
              Container(
                height: 120,
                width: 220,
                color: kRedColor,
              ),
              Container(
                height: 120,
                width: 220,
                color: kblueColor,
              ),
              Container(
                height: 120,
                width: 220,
                color: kblueColor,
              ),
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                    ),
                    child: i,
                  );
                },
              );
            }).toList(),
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
                coursetitle: "For KG's",
                subtitle: "",
                imageUrl: "assets/images/kg.svg",
                gradientcolors: [
                  Color(0xff2CB20A),
                  Color(0xff134C04),
                ],
              ),
              HomeCoursegradientCard(
                coursetitle: "For Kids",
                subtitle: "(class 1  to  6 )",
                imageUrl: "assets/images/kids.svg",
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
                coursetitle: "          For \nSchool Teens",
                subtitle: " (class 7 to 12 )",
                imageUrl: "assets/images/schoolteens.svg",
                gradientcolors: [
                  Color(0xffFD0514),
                  Color(0xff97030C),
                ],
              ),
              HomeCoursegradientCard(
                coursetitle: "          For\n Grown-ups",
                subtitle: "(Age 18 to 40 )",
                imageUrl: "assets/images/grownups.svg",
                gradientcolors: [
                  Color(0xff8E17D7),
                  Color(0xff4A0C71),
                ],
              ),
            ],
          ),
          kHeight30,
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeCoursegradientCard(
                coursetitle: "      For \nVeterans",
                subtitle: " (Age 40+ )",
                imageUrl: "assets/images/veterans.svg",
                gradientcolors: [
                  Color(0xffFD8B05),
                  Color(0xff844306),
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
  final String imageUrl;
  final String coursetitle;
  final String subtitle;

  const HomeCoursegradientCard(
      {super.key,
      required this.gradientcolors,
      required this.imageUrl,
      required this.coursetitle,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            colors: gradientcolors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Column(
        children: [
          kHeight15,
          Card(
            color: Colors.white.withOpacity(0.7),
            child: SizedBox(
                width: 140,
                height: 130,
                child: SvgPicture.asset(
                  imageUrl,
                  fit: BoxFit.contain,
                )),
          ),
          kHeight10,
          Text(
            coursetitle,
            style: appTexttitle,
          ),
          Text(
            subtitle,
            style: subText,
          )
        ],
      ),
    );
  }
}
