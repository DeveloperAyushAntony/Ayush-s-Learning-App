import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSigninButton extends StatelessWidget {
  const CustomSigninButton(
      {super.key,
      required this.buttontext,
      required this.asset,
      required this.height,
      required this.width});
  final String buttontext;
  final String asset;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          elevation: 8, //elevation for the card
          shadowColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          child: InkWell(
            borderRadius: BorderRadius.circular(60),
            onTap: () {},
            child: ListTile(
              leading: SvgPicture.asset(
                asset,
                height: height,
                width: width,
              ),
              title: Text(
                buttontext,
                style: buttonText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
