import 'package:flutter/material.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({Key? key}) : super(key: key);

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
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: FadeInImage(
                    width: 80,
                    placeholder: AssetImage('assets/pokemon_example.png'),
                    image: NetworkImage(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Bulbasur',
                  style: TextStyle(
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
