import 'package:hive/hive.dart';

part 'login_state.g.dart';

@HiveType(typeId: 1)
class LoginState extends HiveObject {
  @HiveField(0)
  final String? accessToken;

  @HiveField(1)
  final String? refreshToken;

  @HiveField(2)
  final String? displayName; // Add displayName field

  LoginState({
    this.accessToken,
    this.refreshToken,
    this.displayName,
  });
}
