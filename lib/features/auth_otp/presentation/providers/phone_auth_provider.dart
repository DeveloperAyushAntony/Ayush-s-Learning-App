import 'package:flutter/material.dart';
import '../../domain/entities/user_phone_entity.dart';
import '../../domain/usecases/send_otp_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';

class PhoneAuthProvider extends ChangeNotifier {
  final SendOtpUseCase sendOtp;
  final VerifyOtpUseCase verifyOtp;

  PhoneAuthProvider({required this.sendOtp, required this.verifyOtp});

  String _phone = "";
  String _otp = "";
  bool _loading = false;
  String? _error;

  String get phone => _phone;
  String get otp => _otp;
  bool get isLoading => _loading;
  String? get error => _error;

  void setPhone(String tenDigitPhone) {
    _phone = '+91$tenDigitPhone';
    notifyListeners();
  }

  void setOtp(String val) {
    _otp = val;
    notifyListeners();
  }

  bool isValidPhone() {
    return _phone.startsWith('+91') && _phone.length == 13;
  }

  Future<void> requestOtp() async {
    _loading = true;
    notifyListeners();

    if (!isValidPhone()) {
      _error = "Please enter a valid Indian phone number starting with +91.";
      _loading = false;
      notifyListeners();
      return;
    }

    try {
      await sendOtp(UserPhoneEntity(phone: _phone));
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<bool> verifyCode() async {
    _loading = true;
    notifyListeners();

    if (_otp.isEmpty) {
      _error = "Please enter the OTP.";
      _loading = false;
      notifyListeners();
      return false;
    }

    try {
      bool result = await verifyOtp(_phone, _otp);
      _error = null;
      return result;
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
