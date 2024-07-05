import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/features/mainpage/widgets/awoke_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: screenwidth,
        height: screenheight,
        color: kgrey1,
        child: Column(
          children: [
            kHeight10,
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Awokelogo(
                  logoheight: 80,
                  logowidth: 80,
                ),
                kWidth40,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "AWOKE",
                  style: awoketext,
                ),
                kWidth40
              ],
            ),
            kHeight120,
            Container(
              height: screenheight / 1.51,
              width: screenwidth,
              decoration: const BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                children: [
                  kHeight30,
                  Text(
                    "Course Details",
                    style: mainpageheadtext,
                  ),
                  kHeight30,
                  Row(
                    children: [
                      kWidth40,
                      Text(
                        "1. Course Name",
                        style: homeGreadientext,
                      )
                    ],
                  ),
                  kHeight45,
                  Center(
                    child: Text(
                      "Creative Writing",
                      style: coursetext,
                    ),
                  ),
                  kHeight35,
                  Text(
                    "Purchase  Amount",
                    style: homeGreadientext,
                  ),
                  kHeight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      kWidth20,
                      Text(
                        "₹ 830",
                        style: amounttext,
                      ),
                      kWidth15,
                      Stack(
                        children: [
                          Positioned(
                            top: 19,
                            child: Container(
                              color: Colors.black,
                              height: 5,
                              width: 85,
                            ),
                          ),
                          Text(
                            "2560",
                            style: amounttext,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
