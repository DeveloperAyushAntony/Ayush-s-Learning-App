import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class Awokelogo extends StatelessWidget {
  const Awokelogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await precacheImage(
          const AssetImage("assets/images/awoke hd.png"), context);
    });

    return Column(
      children: [
        kHeight30,
        SizedBox(
          height: 73,
          width: 59,
          child: Image.asset(
            "assets/images/awoke hd.png",
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
