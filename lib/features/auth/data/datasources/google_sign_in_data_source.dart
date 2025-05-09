import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleSignInDataSource {
  final SupabaseClient _supabaseClient;
  final String webClientId;

  GoogleSignInDataSource(this._supabaseClient)
      : webClientId = dotenv.env['WEB_CLIENT_ID'] ?? '';

  Future<AuthResponse> signInWithGoogle() async {
    if (webClientId.isEmpty) {
      throw Exception('Web Client ID is not set in the environment variables.');
    }

    final googleSignIn = GoogleSignIn(
      serverClientId: webClientId,
    );

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw Exception('Google sign-in failed: No user selected.');
    }

    final googleAuth = await googleUser.authentication;
    final idToken = googleAuth.idToken;
    final accessToken = googleAuth.accessToken;

    if (idToken == null || accessToken == null) {
      throw Exception('Google sign-in failed: Missing tokens.');
    }

    final response = await _supabaseClient.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    return response;
  }
}
