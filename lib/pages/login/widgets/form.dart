import 'package:flutter/material.dart';
import 'package:pokemon_ipt/constants/exports.dart';
import 'package:pokemon_ipt/pages/login/widgets/exports.dart';

class FormLoginPokemon extends StatefulWidget {
  const FormLoginPokemon({Key? key}) : super(key: key);

  @override
  _FormLoginPokemonState createState() => _FormLoginPokemonState();
}

class _FormLoginPokemonState extends State<FormLoginPokemon> {
  late TextEditingController _nickNameController;
  late String _currentNickName;

  late TextEditingController _passwordController;
  late String _currentPassword;

  callBackNickName(value) => setState(() => _currentNickName = value);
  callBackPassword(value) => setState(() => _currentPassword = value);

  @override
  void initState() {
    super.initState();
    _currentNickName = '';
    _currentPassword = '';
    _nickNameController = TextEditingController(text: _currentNickName);
    _passwordController = TextEditingController(text: _currentPassword);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 15),
        InputFormPokemon(
            icon: const Icon(Icons.person),
            controller: _nickNameController,
            textInput: TextInputType.name,
            callBackValue: callBackNickName,
            label: 'Nickname:'),
        InputFormPokemon(
            icon: const Icon(Icons.lock),
            controller: _passwordController,
            textInput: TextInputType.name,
            callBackValue: callBackPassword,
            isHidden: true,
            label: 'Password:'),
        SignInButton(
            title: 'Sign In',
            nickname: _currentNickName,
            password: _currentPassword),
        TextButton(
            onPressed: () => Navigator.pushNamed(context, SIGNUP_ROUTE),
            child: Container(
              alignment: Alignment.center,
              width: size.width * .7,
              height: size.height * .06,
              decoration: BoxDecoration(
                color: Colors.amber[500],
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: const Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )),
      ],
    );
  }
}
