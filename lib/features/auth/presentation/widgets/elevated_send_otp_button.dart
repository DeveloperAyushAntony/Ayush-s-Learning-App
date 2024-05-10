import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class ElevatedGetOTPButton extends StatelessWidget {
  const ElevatedGetOTPButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff4960f9),
            Color(0xff1433ff),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            right: 190,
            top: 10,
            left: 0,
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(7.8)),
              child: Container(
                width: 130.0, // Half of the container width
                height: 130.0, // Circle height

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff5264F9),
                      Color(0xff3AF9EF),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              "Get OTP",
              style: buttonText2,
            ),
          ),
          Positioned.fill(
            right: 0,
            bottom: 15,
            left: 190,
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(2),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(50)),
              child: Container(
                width: 180.0, // Half of the container width
                height: 180.0, // Circle height

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xffC72FF8),
                      Color(0xff591E6C),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
