import 'package:flutter/material.dart';
import 'package:pokemon_ipt/constants/exports.dart';
import 'package:pokemon_ipt/widgets/bottom_button/bottom_button.dart';

class BottomScaffoldPokemon extends StatelessWidget {
  final String routeIs;
  const BottomScaffoldPokemon({
    Key? key,
    required this.routeIs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.amber[600],
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          BottomButtom(
              icon: const Icon(Icons.home), isActived: routeIs == HOME_ROUTE),
          BottomButtom(
              icon: const Icon(Icons.settings),
              isActived: routeIs == PREFERENCES_ROUTE),
        ],
      ),
    );
  }
}
