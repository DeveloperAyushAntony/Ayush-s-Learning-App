import 'package:flutter/material.dart';

class ElevatedsendOTPButton extends StatelessWidget {
  const ElevatedsendOTPButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Send OTP"),
        ));
  }
}
