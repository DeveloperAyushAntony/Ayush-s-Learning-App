import 'package:awoke_learning_app/core/utils/fonts.dart';
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
            cursorColor: const Color.fromARGB(255, 25, 2, 155),
            controller: mobileTextcontroller,
            keyboardType: TextInputType.number,
            maxLength: 10,
           

            decoration: InputDecoration(
              prefix: const Text('+91 ', style: TextStyle(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 4, 34, 168),
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.only(left: 25),
              hintText: 'Enter phone number',
              suffixStyle: appText,
              prefixStyle: buttonText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
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

