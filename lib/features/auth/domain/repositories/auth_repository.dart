import 'package:awoke_learning_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User?> signInWithGoogle();
    Future<void> signOut();
}
