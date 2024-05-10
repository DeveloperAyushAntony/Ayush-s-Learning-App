import 'package:awoke_learning_app/core/utils/app_strings.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/custom_signinbutton.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/or_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                      Image.asset(
                        "assets/images/awoke hd.png", //first logo image
                        width: 95,
                      ),
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
                    child: Image.asset(
                      "assets/images/central.png", //Central image widget
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
                top: 485,
                bottom: 143,
                left: 54,
                right: 55,
                child:
                    CustomSigninButton()), //Custom sign in widget ****from****custom_signinbutton.dart
            const Positioned(
              top: 515,
              left: 90,
              bottom: 40,
              child: OrWidget(),

              ///custom or widget ****from***or_widget.dart
            ),
            Positioned(
              top: 655,
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
                  Navigator.of(context).pushNamed("/loginpage");
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
