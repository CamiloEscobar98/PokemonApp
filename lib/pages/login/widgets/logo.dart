import 'package:flutter/material.dart';

class LogoPokemon extends StatelessWidget {
  const LogoPokemon({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.amber[600],
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(45),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage('assets/background/pokemon_welcome.png'),
          ),
          Image(
            image: AssetImage('assets/background/pokemons.png'),
          )
        ],
      ),
    );
  }
}
