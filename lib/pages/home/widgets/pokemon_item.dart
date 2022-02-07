import 'package:flutter/material.dart';
import 'package:pokemon_ipt/view-models/vm/pokemon_list.dart';

class PokemonItem extends StatelessWidget {
  final PokemonListVM pokemon;
  const PokemonItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
          shape: const RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
          color: Colors.amber[600],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: FadeInImage(
                    fit: BoxFit.cover,
                    width: 80,
                    placeholder: const AssetImage('assets/pokemon_example.png'),
                    image: NetworkImage(
                      pokemon.image,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  pokemon.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
    );
  }
}
