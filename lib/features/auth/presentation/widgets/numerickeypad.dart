import 'package:awoke_learning_app/core/utils/constants.dart';
import 'package:awoke_learning_app/features/auth/presentation/providers/phone_number_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NumericKeypad extends StatelessWidget {
  final Color kblueColor; // Define your custom kblueColor

  const NumericKeypad({
    super.key,
    required this.kblueColor,
  });

  @override
  Widget build(BuildContext context) {
    final phoneNumberProvider = Provider.of<PhoneNumberProvider>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                text: '1',
                onPressed: () => phoneNumberProvider.addDigit(1),
                color: kblueColor,
              ),
              NumberButton(
                text: '2',
                onPressed: () => phoneNumberProvider.addDigit(2),
                color: kblueColor,
              ),
              NumberButton(
                text: '3',
                onPressed: () => phoneNumberProvider.addDigit(3),
                color: kblueColor,
              ),
            ],
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                text: '4',
                onPressed: () => phoneNumberProvider.addDigit(4),
                color: kblueColor,
              ),
              NumberButton(
                text: '5',
                onPressed: () => phoneNumberProvider.addDigit(5),
                color: kblueColor,
              ),
              NumberButton(
                text: '6',
                onPressed: () => phoneNumberProvider.addDigit(6),
                color: kblueColor,
              ),
            ],
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                text: '7',
                onPressed: () => phoneNumberProvider.addDigit(7),
                color: kblueColor,
              ),
              NumberButton(
                text: '8',
                onPressed: () => phoneNumberProvider.addDigit(8),
                color: kblueColor,
              ),
              NumberButton(
                text: '9',
                onPressed: () => phoneNumberProvider.addDigit(9),
                color: kblueColor,
              ),
            ],
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClearButton(onPressed: phoneNumberProvider.clearLastDigit, color: kblueColor),
              NumberButton(
                text: '0',
                onPressed: () => phoneNumberProvider.addDigit(0),
                color: kblueColor,
              ),
              SubmitButton(onPressed: (){
                
              }, color: kblueColor),
            ],
          ),
        ],
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color; // Pass the color from NumericKeypad

  const NumberButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 3.0,
        ),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(2.0),
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            const CircleBorder(),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 15.0, color: color),
        ),
      ),
    );
  }
}

class ClearButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;

  const ClearButton({super.key, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 3.0,
        ),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6.0),
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            const CircleBorder(),
          ),
        ),
        onPressed: onPressed,
        child: Icon(Icons.backspace, color: color),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;

  const SubmitButton({super.key, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 3.0,
        ),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6.0),
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            const CircleBorder(),
          ),
        ),
        onPressed: onPressed,
        child: Icon(Icons.check, color: color),
      ),
    );
  }
}
