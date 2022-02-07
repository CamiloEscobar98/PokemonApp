import 'package:pokemon_ipt/models/pokemon.dart';
import 'package:pokemon_ipt/view-models/vm/pokemon_list.dart';

class PokemonViewModel {
  final List<PokemonList> pokemons = [
    PokemonList(
        name: 'bulbasaur',
        url: 'https://pokeapi.co/api/v2/pokemon/1/',
        image:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png'),
    PokemonList(
        name: 'butterfree',
        url: 'https://pokeapi.co/api/v2/pokemon/12/',
        image:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/12.png')
  ];

  Future<List<PokemonListVM>?> getPokemons() async {
    await Future.delayed(const Duration(seconds: 3));

    return pokemons.map((e) => PokemonListVM(pokemon: e)).toList();
  }
}
