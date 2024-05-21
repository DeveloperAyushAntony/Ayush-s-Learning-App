import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            "home",
            style: appText,
          ),
        ),
      ),
    );
  }
}
