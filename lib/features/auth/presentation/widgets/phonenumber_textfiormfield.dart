import 'package:awoke_learning_app/core/utils/app_styles.dart';
import 'package:awoke_learning_app/core/utils/fonts.dart';
import 'package:awoke_learning_app/features/auth/presentation/providers/phone_number_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneNumberFormField extends StatelessWidget {
  const PhoneNumberFormField({super.key, required this.focusNode});
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return PhoneNumberInputField(focusNode: focusNode);
  }
}

class PhoneNumberInputField extends StatelessWidget {
  const PhoneNumberInputField({super.key, required this.focusNode});
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final phoneNumberProvider = Provider.of<PhoneNumberProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: TextFormField(
            readOnly: true,
            focusNode: focusNode,
            cursorColor: const Color.fromARGB(255, 25, 2, 155),
            controller: TextEditingController(
                text: phoneNumberProvider.phoneNumberString),
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: InputDecoration(
              prefix: const Text('        +91 ',
                  style: TextStyle(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  color: kblueColor,
                  width: 2.4,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  color: kblueColor,
                  width: 2.4,
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
          ),
        ),
      ],
    );
  }
}
