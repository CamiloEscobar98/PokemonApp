import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_ipt/constants/exports.dart';

class LoginService {
  Future<Map<String, dynamic>> login(
      {required String nickname, required String password}) async {
    final url = Uri.http(BASE_URL, '/login');
    Map<String, String> bodyData = {"nickname": nickname, "password": password};
    final response = await http.post(url, body: bodyData);

    final jsonBody = jsonDecode(response.body);
    if (response.statusCode > 200) {
      return <String, dynamic>{
        'status': response.statusCode,
        'message': jsonBody['message']
      };
    } else {
      return <String, dynamic>{
        'status': response.statusCode,
        'auth_token': jsonBody['auth_token']
      };
    }
  }

  Future<bool> logout({required String token}) async {
    final url = Uri.http(BASE_URL, '/logout');
    final response =
        await http.post(url, headers: <String, String>{'Authorization': token});

    return response.statusCode == 200;
  }
}
