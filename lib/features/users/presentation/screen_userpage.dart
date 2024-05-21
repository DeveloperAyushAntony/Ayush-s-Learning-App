import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class ScreenUserPage extends StatelessWidget {
  const ScreenUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            "Beena Antony",
            style: appText,
          ),
        ),
      ),
    );
  }
}
