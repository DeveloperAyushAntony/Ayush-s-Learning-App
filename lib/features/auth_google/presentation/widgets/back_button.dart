import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            )),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Back",
            style: buttonText2,
          ),
        )
      ],
    );
  }
}
