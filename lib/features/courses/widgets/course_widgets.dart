import 'package:awoke_learning_app/core/utils/app_styles.dart';

import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/features/courses/widgets/buy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CourseWidget extends StatelessWidget {
  final String image;
  final String description;
  final String heading;
  final String route;
  final double courseId;
  const CourseWidget({
    super.key,
    required this.image,
    required this.description,
    required this.heading,
    required this.route,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02),
                const Row(
                  children: [BackButton(), Text("Back")],
                ),
                Center(
                  child: SvgPicture.asset(
                    image,
                    height: screenHeight * 0.4,
                    width: screenWidth * 0.9,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  height: screenHeight * 0.08,
                  width: screenWidth,
                  color: kgrey,
                  child: Center(
                    child: Text(
                      heading,
                      style: appText,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  description,
                  style: definitiontext,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: screenHeight * 0.04),
                Center(
                  child: ElevatedBuyButton(
                    otpbuttonText: "Buy Course",
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(route, arguments: courseId);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
