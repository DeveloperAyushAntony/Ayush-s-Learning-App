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
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02,
                horizontal: size.width * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/images/awoke hd.svg",
                        width: size.width * 0.25,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to",
                        style: subtext,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.appName,
                        style: logotext,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.4,
                    width: size.width,
                    child: SvgPicture.asset(
                      "assets/images/centrallogin.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.61,
              left: size.width * 0.1,
              right: size.width * 0.1,
              child: Column(
                children: [
                  CustomSigninButton(
                    buttontext: AppStrings.googlebutton,
                    asset: "assets/images/google.svg",
                    height: size.height * 0.05,
                    width: size.width * 0.08,
                  ),
                  SizedBox(height: size.height * 0.01),
                  CustomSigninButton(
                    buttontext: AppStrings.whatsappbutton,
                    asset: "assets/images/whatsapp.svg",
                    height: size.height * 0.06,
                    width: size.width * 0.08,
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.79,
              left: size.width * 0.25,
              child: const OrWidget(),
            ),
            Positioned(
              top: size.height * 0.83,
              left: size.width * 0.3,
              child: Text(
                AppStrings.accountQuestion,
                style: bodyText,
              ),
            ),
            Positioned(
              top: size.height * 0.86,
              left: size.width * 0.42,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/loginpage');
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: GoogleFonts.aBeeZee().fontFamily,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
