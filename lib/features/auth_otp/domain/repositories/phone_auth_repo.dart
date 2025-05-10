import 'package:awoke_learning_app/features/auth_otp/domain/entities/user_phone_entity.dart';

abstract class PhoneAuthRepository {
  Future<void> sendOTP(UserPhoneEntity user);
  Future<bool> verifyOTP(String phone, String otp);
}
