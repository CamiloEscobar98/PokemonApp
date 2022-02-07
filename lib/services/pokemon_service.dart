import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_ipt/constants/services.dart';

import 'package:pokemon_ipt/models/pokemon.dart';

class PokemonService {
  Future<List<PokemonList>> getPokemonList({required String token}) async {
    final url =
        Uri.http(BASE_URL, '/pokemons', <String, String>{'offset': "0"});
    final response =
        await http.get(url, headers: <String, String>{'Authorization': token});

    final jsonBody = jsonDecode(response.body);
    if (response.statusCode > 200) {
      return [];
    } else {
      final Iterable json = jsonBody['data']['results'];
      return json.map((e) => PokemonList.fromJSON(e)).toList();
    }
  }
}
