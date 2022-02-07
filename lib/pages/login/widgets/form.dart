import 'package:flutter/material.dart';
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
        const SizedBox(height: 40),
        SignInButton(
            title: 'Sign In',
            nickname: _currentNickName,
            password: _currentPassword),
      ],
    );
  }
}
