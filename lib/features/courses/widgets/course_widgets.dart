import 'package:awoke_learning_app/core/utils/app_strings.dart';
import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/features/courses/widgets/buy_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class CourseWidget extends StatelessWidget {
  final String image;
  final String description;
  final String heading;
  final String route;
  const CourseWidget(
      {super.key,
      required this.image,
      required this.description,
      required this.heading, required this.route});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight20,
          const Row(
            children: [kWidth20, BackButton(), Text("Back")],
          ),
          Center(
            child: SvgPicture.asset(
              image,
              height: 340,
              width: 380,
            ),
          ),
          kHeight10,
          Container(
            height: 60,
            width: screenWidth,
            color: kgrey,
            child: Center(
              child: Text(
                heading,
                style: appText,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 380,
              child: Text(
                description,
                style: definitiontext,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Center(
              child: ElevatedBuyButton(
                  otpbuttonText: "Buy Course", onPressed: () {

                    Navigator.of(context).pushNamed(route);
                  }))
       
        ],
      )),
    );
  }
}
