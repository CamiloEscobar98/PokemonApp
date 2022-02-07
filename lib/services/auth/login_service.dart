import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_ipt/constants/exports.dart';

class LoginService  {
  Future<bool> testService() async {
    final url = Uri.http(BASE_URL, '/');
    final response = await http.get(url);

  print('hola');
    print(response.body);

    return true;
  }
}
