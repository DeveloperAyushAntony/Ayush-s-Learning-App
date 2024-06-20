import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awoke_learning_app/core/utils/app_strings.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/custom_signinbutton.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/or_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //Stack widget
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/images/awoke hd.svg",
                        width: 92,
                      )
                      // Image.asset(
                      //   "assets/images/awoke hd.png", //first logo image
                      //   width: 95,
                      // ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to", //welcome text widget
                        style: subtext,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings
                            .appName, //app name from app_strings.dart ....**Name of the app can be changed in the future
                        style: logotext,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 320,
                    width: 400,
                    // child: Image.asset(
                    //   "assets/images/centrallogin.svg", //Central image widget
                    //   fit: BoxFit.contain,
                    // ),
                    child: SvgPicture.asset(
                      "assets/images/centrallogin.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 490,
              bottom: 120,
              left: 54,
              right: 55,
              child: Column(
                children: [
                  CustomSigninButton(
                    buttontext: AppStrings.googlebutton,
                    asset: "assets/images/google.svg",
                    height: 34,
                    width: 30,
                  ),
                  kHeight5,
                  CustomSigninButton(
                    buttontext: AppStrings.whatsappbutton,
                    asset: "assets/images/whatsapp.svg",
                    height: 41,
                    width: 30,
                  ),
                ],
              ),
            ), //Custom sign in widget ****from****custom_signinbutton.dart
            const Positioned(
              top: 520,
              left: 90,
              bottom: -12,
              child: OrWidget(),

              ///custom or widget ****from***or_widget.dart
            ),
            Positioned(
              top: 667,
              left: 95,
              child: Text(
                AppStrings.accountQuestion, //account widget
                style: bodyText,
              ),
            ),
            Positioned(
              top: 690,
              left: 155,
              child: TextButton(
                //text button Login
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/loginpage',
                  );
                },

                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontFamily: GoogleFonts.aBeeZee.toString(),
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
