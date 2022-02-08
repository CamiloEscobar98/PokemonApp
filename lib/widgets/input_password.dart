import 'package:flutter/material.dart';

@immutable
class InputPasswordFormCustom extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final Function callBackValue;
  final String title;
  final bool isHidden;
  Function callBackIsHidden;
  InputPasswordFormCustom(
      {Key? key,
      required this.controller,
      required this.textInputType,
      required this.callBackValue,
      required this.title,
      required this.isHidden,
      required this.callBackIsHidden})
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
        obscureText: isHidden,
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
            prefixIcon: const Icon(Icons.lock),
            prefixIconColor: Colors.red,
            suffixIcon: IconButton(
                onPressed: () => callBackIsHidden(!isHidden),
                icon: isHidden
                    ? const Icon(Icons.lock)
                    : const Icon(Icons.lock_open)),
            hintText: title),
      ),
    );
  }
}
