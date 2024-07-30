class User {
  final String id;
  final String? accessToken;
  final String? refreshToken;

  User({
    required this.id,
    this.accessToken,
    this.refreshToken,
  });
}
