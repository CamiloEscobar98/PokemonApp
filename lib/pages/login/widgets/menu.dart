import 'package:flutter/material.dart';
import 'package:pokemon_ipt/pages/login/widgets/exports.dart';

class MenuPokemon extends StatelessWidget {
  const MenuPokemon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Colors.amber[800],
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(45)),
          border: Border.all(color: Colors.black),
        ),
        child: SingleChildScrollView(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [FormLoginPokemon()],
          ),
        ),
      ),
    );
  }
}
