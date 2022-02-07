import 'package:pokemon_ipt/config/preferences.dart';
import 'package:pokemon_ipt/services/pokemon_service.dart';
import 'package:pokemon_ipt/view-models/vm/pokemon_list.dart';

class PokemonViewModel {
  final _prefs = UserPreferences();
  // final List<PokemonList> pokemons = [
  //   PokemonList(
  //       name: 'bulbasaur',
  //       url: 'https://pokeapi.co/api/v2/pokemon/1/',
  //       image:
  //           'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png'),
  //   PokemonList(
  //       name: 'butterfree',
  //       url: 'https://pokeapi.co/api/v2/pokemon/12/',
  //       image:
  //           'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/12.png')
  // ];

  Future<List<PokemonListVM>?> getPokemons() async {
    final pokemons =
        await PokemonService().getPokemonList(token: _prefs.getRememberToken);
    return pokemons.map((e) => PokemonListVM(pokemon: e)).toList();
  }
}
