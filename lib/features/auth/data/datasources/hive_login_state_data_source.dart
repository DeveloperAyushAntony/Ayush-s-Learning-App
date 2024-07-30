import 'package:awoke_learning_app/features/auth/data/models/login_state.dart';
import 'package:hive/hive.dart';

class HiveLoginStateDataSource {
  final Box<LoginState> _loginBox;

  HiveLoginStateDataSource(this._loginBox);

  Future<void> saveLoginState(LoginState loginState) async {
    await _loginBox.put('loginState', loginState);
  }

  Future<LoginState?> getLoginState() async {
    return _loginBox.get('loginState');
  }

  Future<void> clearLoginState() async {
    await _loginBox.delete('loginState');
  }
}
