
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class CustomSigninButton extends StatelessWidget {
  const CustomSigninButton({super.key, required this.buttontext});
final String buttontext;
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
              leading: Image.asset(
                "assets/images/google.png",
                height: 34,
                width: 30,
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
