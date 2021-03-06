import 'package:flutter/material.dart';

class InputFormCustom extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final Function callBackValue;
  final String title;
  final Icon icon;
  const InputFormCustom(
      {Key? key,
      required this.controller,
      required this.textInputType,
      required this.callBackValue,
      required this.title,
      required this.icon,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(35),
          ),
          border: Border.all(color: Colors.black)),
      child: TextFormField(
        controller: controller,
        autocorrect: false,
        keyboardType: textInputType,
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
            hintText: title),
      ),
    );
  }
}
