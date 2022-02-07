import 'package:flutter/material.dart';
import 'package:pokemon_ipt/services/auth/login_service.dart';

class LoginInViewModel extends ChangeNotifier {
  Future<bool> test() async {
    final response = await LoginService().testService();


    return true;
  }
}
