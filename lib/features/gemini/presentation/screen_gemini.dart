import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class ScreenGemini extends StatelessWidget {
  const ScreenGemini({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            "Ask Gemini",
            style: appText,
          ),
        ),
      ),
    );
  }
}
