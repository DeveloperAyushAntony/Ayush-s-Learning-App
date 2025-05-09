import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class GreenBuyButton extends StatelessWidget {
  const GreenBuyButton(
      {super.key, required this.otpbuttonText, required this.onPressed});
  final String otpbuttonText;
  final VoidCallback onPressed;
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
            Color(0xff46BD3C),
            Color(0xff10AD02),
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onPressed,
          child: Center(
            child: Text(
              otpbuttonText,
              style: buttonText2,
            ),
          ),
        ),
      ),
    );
  }
}
