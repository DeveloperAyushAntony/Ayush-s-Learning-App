import 'package:flutter/material.dart';

class PhoneNumberProvider with ChangeNotifier {
  int _phoneNumber = 0;

  int get phoneNumber => _phoneNumber;

  // Only returns the 10-digit number
  String get phoneNumberString => _phoneNumber.toString().padLeft(10, '0');

  void addDigit(int digit) {
    if (_phoneNumber.toString().length < 10) {
      _phoneNumber = _phoneNumber * 10 + digit;
      notifyListeners();
    }
  }

  void clearLastDigit() {
    if (_phoneNumber != 0) {
      _phoneNumber = _phoneNumber ~/ 10;
      notifyListeners();
    }
  }

  void clearAll() {
    _phoneNumber = 0;
    notifyListeners();
  }
}
