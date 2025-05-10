import 'dart:developer';
import 'package:awoke_learning_app/features/auth_google/domain/entities/user.dart'
    as domain;
import 'package:awoke_learning_app/features/auth_google/domain/repositories/auth_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient supabase;
  final GoogleSignIn googleSignIn;
  final webClientId = dotenv.env['WEB_CLIENT_ID'];

  AuthRepositoryImpl(this.supabase, this.googleSignIn);

  @override
  Future<domain.User?> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn(
        scopes: ['email', 'profile', 'openid'],
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        log('Google sign-in failed: No user selected.');
        return null;
      }

      final googleAuth = await googleUser.authentication;
      final idToken = googleAuth.idToken;
      final accessToken = googleAuth.accessToken;

      if (idToken == null || accessToken == null) {
        log('Google sign-in failed: Missing tokens.');
        return null;
      }

      final response = await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      if (response.session == null) {
        throw Exception('Sign-in failed');
      }

      return domain.User(
        id: response.session!.user.id,
        accessToken: accessToken,
        refreshToken: response.session!.refreshToken,
        displayName: googleUser.displayName,
      );
    } catch (e) {
      log('Error during Google sign-in: $e');
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await googleSignIn.signOut();
    await supabase.auth.signOut();
  }
}
