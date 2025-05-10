import 'package:awoke_learning_app/features/auth_otp/domain/repositories/phone_auth_repo.dart';

class VerifyOtpUseCase {
  final PhoneAuthRepository repo;

  VerifyOtpUseCase(this.repo);

  Future<bool> call(String phone, String otp) async {
    return await repo.verifyOTP(phone, otp);
  }
}
