import 'package:flutter/material.dart';
import 'package:pokemon_ipt/pages/home/widgets/pokemon_item.dart';

import 'package:pokemon_ipt/view-models/vm/pokemon_list.dart';

class PokemonList extends StatelessWidget {
  final List<PokemonListVM> pokemons;
  const PokemonList({Key? key, required this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: pokemons.map((e) => PokemonItem(pokemon: e)).toList(),
      ),
    );
  }
}
