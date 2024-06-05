import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/core/widgets/top_gradientcard.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/elevated_custombutton.dart';
import 'package:awoke_learning_app/features/home/presentation/screen_homepage.dart';

import 'package:flutter/material.dart';

class UserDataPage extends StatelessWidget {
  const UserDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.8,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  const GradientCard(
                       customalighnmentbegin: Alignment.bottomRight,
                customalighnmentend: Alignment.topLeft,
                    customheight: 280,
                    customwidth: 800,
                    gradientcolors: [
                      Color(0xff153B9C),
                      Color(0xff1C4FD1),
                    ],
                  ),
                  kHeight120,
                  Padding(
                    padding: const EdgeInsets.only(top: 220),
                    child: Center(
                      child: Text(
                        "Create Your Account",
                        style: otpheadtext,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            kHeight20,
            SizedBox(
              width: 300,
              height: 60,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "full name",
                    labelText: "Enter your name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),
            ),
            const Text(
              "enter your name !!",
              style: TextStyle(color: kRedColor),
            ),
            kHeight10,
            SizedBox(
              width: 300,
              height: 60,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "username",
                    labelText: "Enter your username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),
            ),
            const Text(
              "enter valid username !!",
              style: TextStyle(color: kRedColor),
            ),
            kHeight10,
            SizedBox(
              width: 300,
              height: 60,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "mobile number",
                    labelText: "Enter your mobile number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),
            ),
            const Text(
              "enter valid mobile number !!",
              style: TextStyle(color: kRedColor),
            ),
            kHeight10,
            SizedBox(
              width: 300,
              height: 60,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Email ",
                    labelText: " Enter Your Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),
            ),
            const Text(
              "enter valid email !!",
              style: TextStyle(color: kRedColor),
            ),
            kHeight10,
            ElevatedGetOTPButton(
                otpbuttonText: "Create Account",
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ScreenHome()));
                }),
          ],
        ),
      ),
    ));
  }
}
