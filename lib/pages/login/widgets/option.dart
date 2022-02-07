import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokemon_ipt/view-models/auth/auth.dart';
import 'package:pokemon_ipt/constants/routes.dart';

class SignInButton extends StatelessWidget {
  final String title;
  final String nickname;
  final String password;
  const SignInButton(
      {Key? key,
      required this.title,
      required this.nickname,
      required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var loginViewModel = Provider.of<LoginInViewModel>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, HOME_ROUTE);
      },
      child: Container(
        width: size.width * .7,
        height: size.height * .06,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.amber[500],
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }
}
