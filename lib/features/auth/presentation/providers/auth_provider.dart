import 'package:awoke_learning_app/features/auth/data/models/login_state.dart';
import 'package:flutter/material.dart';
import 'package:awoke_learning_app/features/auth/domain/entities/user.dart';
import 'package:awoke_learning_app/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:awoke_learning_app/features/auth/data/datasources/hive_login_state_data_source.dart'; // Import the HiveLoginStateDataSource

class AuthProvider with ChangeNotifier {
  final SignInWithGoogle signInWithGoogle;
  final HiveLoginStateDataSource hiveLoginStateDataSource;

  AuthProvider(this.signInWithGoogle, this.hiveLoginStateDataSource);

  User? _user;
  User? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> signIn() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      print('Starting Google Sign-In...');
      _user = await signInWithGoogle.call();
      if (_user != null) {
        print('Google Sign-In successful. User: ${_user!.id}');
        final loginState = LoginState(
          accessToken: _user!.accessToken,
          refreshToken: _user!.refreshToken,
        );
        await hiveLoginStateDataSource.saveLoginState(loginState);
      } else {
        print('Google Sign-In failed. User is null.');
      }
    } catch (e) {
      print('Sign-in failed: $e');
      _user = null;
      _errorMessage = 'Sign-in failed: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    _user = null;
    await hiveLoginStateDataSource.clearLoginState();
    notifyListeners();
  }

  Future<void> loadUser() async {
    final loginState = await hiveLoginStateDataSource.getLoginState();
    if (loginState != null) {
      _user = User(
        id: '', // Adjust this part as necessary to get the user ID.
        accessToken: loginState.accessToken,
        refreshToken: loginState.refreshToken,
      );
      notifyListeners();
    }
  }
}
