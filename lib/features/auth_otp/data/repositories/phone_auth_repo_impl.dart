import 'package:awoke_learning_app/features/auth_otp/data/datasources/supabase_auth_datasource.dart';
import 'package:awoke_learning_app/features/auth_otp/domain/entities/user_phone_entity.dart';
import 'package:awoke_learning_app/features/auth_otp/domain/repositories/phone_auth_repo.dart';

class PhoneAuthRepoImpl implements PhoneAuthRepository {
  final SupabaseAuthDatasource datasource;

  PhoneAuthRepoImpl(this.datasource);

  @override
  Future<void> sendOTP(UserPhoneEntity user) async {
    await datasource.sendOtp(user.phone);
  }

  @override
  Future<bool> verifyOTP(String phone, String otp) async {
    return await datasource.verifyOtp(phone, otp);
  }
}
