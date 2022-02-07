import 'package:flutter/material.dart';

class BottomButtom extends StatelessWidget {
  final Icon icon;
  final bool isActived;
  const BottomButtom({
    Key? key,
    required this.icon,
    required this.isActived,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: isActived ? Colors.white : Colors.amber[600],
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: IconButton(
          color: isActived ? Colors.amber : Colors.black,
          onPressed: () {},
          icon: icon,
        ),
      ),
    );
  }
}
