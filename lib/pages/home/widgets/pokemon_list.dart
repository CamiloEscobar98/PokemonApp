import 'package:flutter/material.dart';
import 'package:pokemon_ipt/pages/home/widgets/pokemon_item.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        PokemonItem(),
        PokemonItem(),
        PokemonItem(),
        PokemonItem(),
      ],
    );
  }
}
