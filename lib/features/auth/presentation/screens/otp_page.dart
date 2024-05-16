import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/core/widgets/top_blue_gradientcard.dart';
import 'package:awoke_learning_app/features/auth/presentation/screens/user_data_page.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/back_button.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/elevated_custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const Gradientbluecard(),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CustomBackButton(), //back button
                        kHeight120,

                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Center(
                              child: Text(
                            "OTP Verification",
                            style: otpheadtext,
                          ) // Heading text 'OTP Verification !white'
                              ),
                        ),
                        kHeight45,
                        Text(
                          "Enter the OTP sent to",
                          style: buttonText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "+917012647147",
                              style: buttonText,
                            )
                          ],
                        ),
                        kHeight20,
                        const Center(
                          child: CircularProgressIndicator(
                              strokeWidth: 4, color: kblueColor),
                        ),
                        kHeight20,
                        OtpTextField(
                          disabledBorderColor: kblueColor,
                          enabledBorderColor: kblueColor,
                          numberOfFields: 5,
                          focusedBorderColor: kblueColor,
                          fillColor: kblueColor,

                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return AlertDialog(
                            //         title: Text("Verification Code"),
                            //         content:
                            //             Text('Code entered is $verificationCode'),
                            //       );
                            //     });
                          }, // end onSubmit
                        ),
                        kHeight45,
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Did'nt recieved OTP?",
                              style: TextStyle(color: kBlackgrey),
                            )
                          ],
                        ),
                        kHeight10,
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Resend Code",
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                        kHeight45,
                        Center(
                            child: ElevatedGetOTPButton(
                          otpbuttonText: "Verify",
                          onPressed: () {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                            Navigator.of(context)
                                .pushReplacementNamed("/userdatapage");
                          },
                        )),
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}
