import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/features/drawer/widgets/drawer_item.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class DrawerPageUi extends StatelessWidget {
  const DrawerPageUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(120.0),
      ),
      child: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff03050F),
                Color(0xff0500FF),
              ],
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                      top: -35,
                      left: -5,
                      child: SizedBox(
                        height: 250,
                        width: 250,
                        child: SvgPicture.asset("assets/images/drawer.svg"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, bottom: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Awoke",
                            style: drawerHeadText,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Text(
                              "Version 1.1.1",
                              style: subText,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              kHeight45,
              DrawerItem(
                click: () {},
                svgpath: "assets/images/user.svg",
                itemname: "Account",
              ), //
              //     ,
              kHeight45,
              DrawerItem(
                click: () {},
                svgpath: "assets/images/school-material.svg",
                itemname: "Purchased Courses",
              ),
              kHeight45,
              DrawerItem(
                click: () {},
                svgpath: "assets/images/classroom.svg",
                itemname: "Talk With Teacher",
              ),
              kHeight80,
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: ElevatedButton(
                      onPressed: () {
                        // Your button action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black, // Text color
                        textStyle: const TextStyle(
                            fontSize: 16), // Adjust font size as needed
                      ),
                      child: Text(
                        'Logout',
                        style: redbuttonText,
                      ),
                    ),
                  )),
              kHeight15,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Made with", style: buttonText2),
                  kWidth10,
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: SvgPicture.asset("assets/images/love.svg"),
                  ),
                  kWidth10,
                  Text(
                    "Team Awoke",
                    style: buttonText2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
