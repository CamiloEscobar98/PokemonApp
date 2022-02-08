import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instant = UserPreferences._internal();
  late SharedPreferences _prefs;

  factory UserPreferences() {
    return _instant;
  }

  UserPreferences._internal();

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set setRememberToken(String token) {
    _prefs.setString('rememberToken', token);
  }

  String get getRememberToken {
    return _prefs.getString('rememberToken') ?? "";
  }
}
