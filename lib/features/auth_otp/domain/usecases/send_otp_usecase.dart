import 'package:awoke_learning_app/features/auth_otp/domain/entities/user_phone_entity.dart';
import 'package:awoke_learning_app/features/auth_otp/domain/repositories/phone_auth_repo.dart';

class SendOtpUseCase {
  final PhoneAuthRepository repo;

  SendOtpUseCase(this.repo);

  Future<void> call(UserPhoneEntity user) async {
    await repo.sendOTP(user);
  }
}
