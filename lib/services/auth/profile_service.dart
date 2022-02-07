import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokemon_ipt/models/user.dart';
import 'package:pokemon_ipt/constants/services.dart';

class ProfileService {
  Future<User?> getProfile({required String token}) async {
    final url = Uri.http(BASE_URL, '/profile');

    final response =
        await http.get(url, headers: <String, String>{'Authorization': token});

    final jsonBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return User.fromJSON(jsonBody['user']);
    } else {
      return null;
    }
  }

  Future<bool> updateProfile(
      {required String token, required User user}) async {
    final url = Uri.http(BASE_URL, '/profile');

    final response = await http.put(url, headers: <String, String>{
      'Authorization': token
    }, body: <String, String>{
      'fullname': user.fullname,
      'nickname': user.nickname,
      'email': user.email,
      'phone': user.phone,
      'birth_date': user.birthDate,
      'real_password': user.password
    });

    print(response.body);
    return response.statusCode == 200;
  }
}
