import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';

import 'package:awoke_learning_app/features/mainpage/widgets/awoke_logo.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class ScreenPrimeUserPage extends StatelessWidget {
  const ScreenPrimeUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 110, top: 30, bottom: 10),
                child: Row(
                  children: [
                    Center(
                      child: Text(
                        "Account Details",
                        style: heading2,
                      ),
                    )
                  ],
                ),
              ),
              kHeight10,
              Center(
                child: SizedBox(
                    width: 270,
                    child: Lottie.asset("assets/json/accounts.json")),
              ),
              kHeight10,
              const AccountDetailWidget(),
              const PremiumUserWidget(),
              kHeight25,
              const PrioritySupportDetailWidget(),
              const AwokeMailWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class AwokeMailWidget extends StatelessWidget {
  const AwokeMailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xff134C04),
            Color(0xff2CB20A),
          ],
        ),
      ),
      height: 32,
      width: 230,
      child: Center(
        child: Text(
          "support@awokelearning.com",
          style: appText3,
        ),
      ),
    );
  }
}

class PrioritySupportDetailWidget extends StatelessWidget {
  const PrioritySupportDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "You are eligible for priority support",
          style: appText2,
        ),
        kHeight10,
        Text(
          "For assistance contact:",
          style: subtext,
        ),
        kHeight10,
      ],
    );
  }
}

class PremiumUserWidget extends StatelessWidget {
  const PremiumUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 300,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xffB1AC20),
              Color(0xffFFF500),
            ],
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.elliptical(150, 80),
            bottomRight: Radius.elliptical(150, 80),
            topLeft: Radius.elliptical(150, 80),
            bottomLeft: Radius.elliptical(150, 80),
          )),
      child: Center(
        child: Text(
          "you are now a premium user",
          style: appText,
        ),
      ),
    );
  }
}

class AccountDetailWidget extends StatelessWidget {
  const AccountDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(text: "Let's Celebrate Your ", style: appText),
            ),
            kHeight10,
            Text.rich(
              TextSpan(text: "Learning Journey", style: appText),
            ),
            kHeight10,
            Text.rich(
              TextSpan(text: "With Us", style: withustext),
            ),
            const Awokelogo(
              logoheight: 110,
              logowidth: 110,
            )
          ],
        ),
      ),
    );
  }
}
