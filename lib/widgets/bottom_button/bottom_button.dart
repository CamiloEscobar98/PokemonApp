import 'package:flutter/material.dart';

class BottomButtom extends StatelessWidget {
  final Icon icon;
  final bool isActived;
  final String url;
  const BottomButtom({
    Key? key,
    required this.icon,
    required this.isActived,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: isActived ? Colors.white : Colors.amber[600],
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: IconButton(
          color: isActived ? Colors.amber : Colors.black,
          onPressed: () => Navigator.pushReplacementNamed(context, url),
          icon: icon,
        ),
      ),
    );
  }
}
