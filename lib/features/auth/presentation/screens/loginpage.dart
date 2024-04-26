import 'package:awoke_learning_app/core/constants/fonts.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/elevated_send_otp_button.dart';
import 'package:awoke_learning_app/features/auth/presentation/widgets/phonenumber_textfiormfield.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, top: 35, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "We glad that you are here!",
                style: appText,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Welcome to  AWOKE  family again",
                style: appText,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 350,
                    width: 350,
                    child: Image.asset(
                      "assets/images/happy.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Login using  Registered  mobile number",
                  style: appText2,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              PhoneNumberFormField(),
              const SizedBox(
                height: 40,
              ),
              const Center(child: ElevatedsendOTPButton())
            ],
          ),
        ),
      ),
    ));
  }
}
