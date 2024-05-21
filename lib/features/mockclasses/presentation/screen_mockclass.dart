import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class ScreenMockClass extends StatelessWidget {
  const ScreenMockClass({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            "MockClasses",
            style: appText,
          ),
        ),
      ),
    );
  }
}
