import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/core/widgets/top_gradientcard.dart';

import 'package:awoke_learning_app/features/auth/presentation/widgets/back_button.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/elevated_custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

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
                customwidth: 800,
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
                  children: [
                    const CustomBackButton(), //back button
                    SizedBox(height: size.height * 0.15),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: Text(
                          "OTP Verification",
                          style: otpheadtext,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Enter the OTP sent to",
                      style: buttonText,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "+917012647147",
                      style: buttonText,
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: CircularProgressIndicator(
                          strokeWidth: 4, color: kblueColor),
                    ),
                    const SizedBox(height: 20),
                    OtpTextField(
                      disabledBorderColor: kblueColor,
                      enabledBorderColor: kblueColor,
                      numberOfFields: 5,
                      focusedBorderColor: kblueColor,
                      fillColor: kblueColor,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      onSubmit: (String verificationCode) {
                        // handle OTP submission
                      },
                    ),
                    const SizedBox(height: 45),
                    const Text(
                      "Didn't receive OTP?",
                      style: TextStyle(color: kBlackgrey),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Resend Code",
                      style: TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 45),
                    Center(
                      child: ElevatedGetOTPButton(
                        otpbuttonText: "Verify",
                        onPressed: () {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          Navigator.of(context)
                              .pushReplacementNamed("/userdatapage");
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
