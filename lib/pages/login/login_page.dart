import 'package:flutter/material.dart';
import 'package:pokemon_ipt/pages/login/widgets/exports.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.white30),
          child: Column(
            children: [
              LogoPokemon(height: height),
              const MenuPokemon(),
            ],
          ),
        ),
      ],
    ));
  }
}
