import 'package:flutter/material.dart';
import 'package:pokemon_ipt/constants/exports.dart';
import 'package:pokemon_ipt/widgets/appbar_custom.dart';
import 'package:pokemon_ipt/widgets/bottom_button/bottom_scaffold.dart';

import 'package:pokemon_ipt/pages/home/widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBarPokemon(appBar: AppBar()),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: const PokemonList(),
      ),
      bottomNavigationBar: const BottomScaffoldPokemon(routeIs: HOME_ROUTE),
    );
  }
}
