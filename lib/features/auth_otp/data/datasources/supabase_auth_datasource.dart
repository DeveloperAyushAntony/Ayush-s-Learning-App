import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthDatasource {
  final SupabaseClient client;

  SupabaseAuthDatasource(this.client);

  Future<void> sendOtp(String phone) async {
    await client.auth.signInWithOtp(phone: phone);
  }

  Future<bool> verifyOtp(String phone, String otp) async {
    final response = await client.auth.verifyOTP(
      phone: phone,
      token: otp,
      type: OtpType.sms,
    );
    return response.session != null;
  }
}
