import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/core/widgets/top_gradientcard.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/back_button.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/elevated_custombutton.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/numerickeypad.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/phonenumber_textfiormfield.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const GradientCard(
                bottomleftval: Radius.circular(40),
                bottomrightval: Radius.circular(40),
                customalighnmentbegin: Alignment.bottomRight,
                customalighnmentend: Alignment.topLeft,
                customheight: 280,
                customwidth: 900,
                gradientcolors: [
                  Color(0xff153B9C),
                  Color(0xff1C4FD1),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.03,
                  horizontal: size.width * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomBackButton(), //back button
                    kHeight30,
                    const LoginTextOne(), //heading text1
                    const SizedBox(
                      height: 10,
                    ),
                    const LoginTextTWo(), //heading text2
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginHappyImage() //middle happy people image
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Center(
                        child:
                            TextOtpVerification(), // Heading text 'OTP Verification'
                      ),
                    ),
                    kHeight10,
                    const Center(
                      child: OtpSubText(), //OtpSubText
                    ),
                    kHeight25,
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: PhoneNumberFormField(
                        focusNode: _focusNode,
                      ),
                    ),
                    // phone NUmber TextFormField
                    const NumericKeypad(
                      kblueColor: kblueColor,
                    ),
                    Center(
                      child: ElevatedGetOTPButton(
                        otpbuttonText: "Get OTP",
                        onPressed: () {
                          Navigator.of(context).pushNamed("/otppage");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpSubText extends StatelessWidget {
  const OtpSubText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "We will send you a one-time password to your registered mobile number",
      style: appotptext,
      textAlign: TextAlign.center,
    );
  }
}

class TextOtpVerification extends StatelessWidget {
  const TextOtpVerification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "OTP verification",
      style: appText,
    );
  }
}

class LoginHappyImage extends StatelessWidget {
  const LoginHappyImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.25,
      width: size.width * 0.8,
      child: Image.asset(
        "assets/images/happy.png",
        fit: BoxFit.cover,
      ),
    );
  }
}

class LoginTextOne extends StatelessWidget {
  const LoginTextOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "We are glad that you are here!",
      style: appTexttitle,
    );
  }
}

class LoginTextTWo extends StatelessWidget {
  const LoginTextTWo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome to AWOKE family again",
      style: appTexttitle,
    );
  }
}
