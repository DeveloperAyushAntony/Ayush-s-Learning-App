// lib/features/auth/domain/entities/user.dart
class User {
  final String id;
  final String? accessToken;
  final String? refreshToken;
  final String? displayName;

  User({
    required this.id,
    this.accessToken,
    this.refreshToken,
    this.displayName,
  });
}
