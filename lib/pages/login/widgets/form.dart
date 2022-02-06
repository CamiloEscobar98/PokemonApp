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

  callBackNickName(value) => setState(() => _currentNickName = value);

  @override
  void initState() {
    super.initState();
    _currentNickName = '';
    _nickNameController = TextEditingController(text: _currentNickName);
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
            controller: _nickNameController,
            textInput: TextInputType.name,
            callBackValue: callBackNickName,
            isHidden: true,
            label: 'Password:'),
        const SizedBox(height: 40),
        const MenuOptionPokemon(title: 'Sign In'),
      ],
    );
  }
}
