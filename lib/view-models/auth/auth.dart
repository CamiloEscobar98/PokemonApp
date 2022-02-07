import 'package:pokemon_ipt/config/preferences.dart';
import 'package:pokemon_ipt/services/auth/login_service.dart';
import 'package:pokemon_ipt/services/auth/profile_service.dart';
import 'package:pokemon_ipt/view-models/vm/user_profile.dart';

class LoginInViewModel {
  final _prefs = UserPreferences();
  Future<bool> login(
      {required String nickname, required String password}) async {
    final response =
        await LoginService().login(nickname: nickname, password: password);

    if (response['status'] > 200) {
      return false;
    }
    _prefs.setRememberToken = response['auth_token'];
    return true;
  }

  Future<bool> logout() async {
    final response =
        await LoginService().logout(token: _prefs.getRememberToken);

    return response;
  }

  Future<UserProfileVM?> getProfile() async {
    final userResponse =
        await ProfileService().getProfile(token: _prefs.getRememberToken);

    if (userResponse != null) {
      return UserProfileVM(user: userResponse);
    } else {
      return null;
    }
  }
}
