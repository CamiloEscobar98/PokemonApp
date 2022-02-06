import 'package:flutter/material.dart';

class InputFormPokemon extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInput;
  final Function callBackValue;
  final String label;
  final Icon icon;
  final bool? isHidden;
  const InputFormPokemon({
    Key? key,
    required this.controller,
    required this.textInput,
    required this.callBackValue,
    required this.label,
    required this.icon,
    this.isHidden,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 15),
      width: size.width * 0.85,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(35),
          ),
          border: Border.all(color: Colors.black)),
      child: TextFormField(
        obscureText: isHidden ?? false,
        controller: controller,
        autocorrect: false,
        keyboardType: textInput,
        onChanged: (value) => callBackValue(value),
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(35))),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(35),
              ),
            ),
            prefixIcon: icon,
            prefixIconColor: Colors.red,
            hintText: label),
      ),
    );
  }
}
