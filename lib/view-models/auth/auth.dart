import 'package:flutter/material.dart';
import 'package:pokemon_ipt/config/preferences.dart';
import 'package:pokemon_ipt/services/auth/login_service.dart';

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
}
