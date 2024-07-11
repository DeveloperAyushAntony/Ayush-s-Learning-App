import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class OnBoardingContent extends StatelessWidget {
  final String? image;
  final String? title;
  final String? description;

  const OnBoardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          SizedBox(
            height: size.height * 0.44,
            width: size.width * 0.8,
            child: Lottie.asset(
              image!,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 26, 89, 204),
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Text(
            description!,
            style: TextStyle(
              fontFamily: heading1.toString(),
              fontSize: size.width * 0.045,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
