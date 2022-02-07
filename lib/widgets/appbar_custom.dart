import 'package:flutter/material.dart';
import 'package:pokemon_ipt/constants/exports.dart';

class AppBarPokemon extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const AppBarPokemon({
    Key? key,
    required this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      shape: const RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      centerTitle: true,
      title: const Padding(
        padding: EdgeInsets.only(top: 0),
        child: Image(
          fit: BoxFit.fitHeight,
          width: 200,
          image: AssetImage('assets/background/pokemon_welcome.png'),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            iconSize: 30,
            onPressed: () =>
                Navigator.pushReplacementNamed(context, LOGIN_ROUTE),
            icon: const Icon(Icons.logout),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height * 1.35);
}
