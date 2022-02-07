import 'package:pokemon_ipt/models/pokemon.dart';

class PokemonListVM {
  final PokemonList pokemon;

  PokemonListVM({required this.pokemon});

  get name {
    return pokemon.name;
  }

  get url {
    return pokemon.url;
  }

  get image {
    return pokemon.image;
  }
}
