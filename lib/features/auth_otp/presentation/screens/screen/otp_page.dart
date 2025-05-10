import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/core/widgets/top_gradientcard.dart';
import 'package:awoke_learning_app/features/auth_google/presentation/widgets/back_button.dart';
import 'package:awoke_learning_app/features/auth_google/presentation/widgets/elevated_custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import '../../providers/phone_auth_provider.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String enteredOtp = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.read<PhoneAuthProvider>();

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
                    const CustomBackButton(),
                    SizedBox(height: size.height * 0.15),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: Text("OTP Verification", style: otpheadtext),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("Enter the OTP sent to", style: buttonText),
                    const SizedBox(height: 10),
                    Text(provider.phone, style: buttonText),
                    const SizedBox(height: 20),
                    provider.isLoading
                        ? const CircularProgressIndicator(
                            strokeWidth: 4, color: kblueColor)
                        : const SizedBox.shrink(),
                    const SizedBox(height: 20),
                    OtpTextField(
                      disabledBorderColor: kblueColor,
                      enabledBorderColor: kblueColor,
                      numberOfFields: 5,
                      focusedBorderColor: kblueColor,
                      fillColor: kblueColor,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {
                        setState(() {
                          enteredOtp = code;
                        });
                      },
                      onSubmit: (String verificationCode) {
                        setState(() {
                          enteredOtp = verificationCode;
                        });
                      },
                    ),
                    const SizedBox(height: 45),
                    const Text("Didn't receive OTP?",
                        style: TextStyle(color: kBlackgrey)),
                    const SizedBox(height: 10),
                    const Text("Resend Code",
                        style: TextStyle(color: Colors.red)),
                    const SizedBox(height: 45),
                    Center(
                      child: ElevatedGetOTPButton(
                        otpbuttonText: "Verify",
                        onPressed: () async {
                          if (enteredOtp.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter the OTP"),
                              ),
                            );
                            return;
                          }

                          provider.setOtp(enteredOtp);
                          final success = await provider.verifyCode();
                          if (success) {
                            Navigator.of(context)
                                .pushReplacementNamed("/userdatapage");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text(provider.error ?? "Invalid OTP")),
                            );
                          }
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
