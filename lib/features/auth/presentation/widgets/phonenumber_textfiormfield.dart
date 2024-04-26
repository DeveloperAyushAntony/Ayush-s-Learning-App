import 'package:awoke_learning_app/core/constants/fonts.dart';
import 'package:flutter/material.dart';

class PhoneNumberFormField extends StatelessWidget {
  PhoneNumberFormField({super.key});
  final mobileTextcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: TextFormField(
            controller: mobileTextcontroller,
            keyboardType: TextInputType.phone, // Set keyboard type to phone

            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 25),
              hintText: 'Enter phone number',
              prefixText: "+91",
              prefixStyle: buttonText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter your phone number.';
            //   }
            //   return null; // Return null for valid input
            // },
          ),
        ),
      ],
    );
  }
}
