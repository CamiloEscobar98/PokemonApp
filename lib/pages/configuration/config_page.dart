import 'package:flutter/material.dart';
import 'package:pokemon_ipt/constants/routes.dart';
import 'package:pokemon_ipt/widgets/appbar_custom.dart';
import 'package:pokemon_ipt/widgets/bottom_button/bottom_scaffold.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBarPokemon(appBar: AppBar()),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: const Center(
          child: Text('Configuration Page'),
        ),
      ),
      bottomNavigationBar: const BottomScaffoldPokemon(routeIs: CONFIG_ROUTE),
    );
  }
}
