import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class OnBoardingContent extends StatelessWidget {
  final String? image;
  final String? title;
  final String? description;
  const OnBoardingContent(
      {super.key,
      required this.image,
      required this.title,
      required this.description});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
            width: 20,
          ),
          SizedBox(
              height: 250,
              width: 700,
              child: Lottie.asset(
                image!,
                width: 700,
                height: 500,
              )),
          const SizedBox(
            height: 20,
            width: 20,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 26, 89, 204),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            description!,
            style: TextStyle(
              fontFamily: heading1.toString(),
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
