import 'package:awoke_learning_app/features/auth_google/domain/entities/user.dart';
import 'package:awoke_learning_app/features/auth_google/domain/repositories/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository repository;

  SignInWithGoogle(this.repository);

  Future<User?> call() async {
    return await repository.signInWithGoogle();
  }

  Future<void> signOut() async {
    await repository.signOut();
  }
}
