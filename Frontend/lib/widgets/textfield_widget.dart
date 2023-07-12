import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const TextFieldWidget({
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: TextField(
          obscureText: obscureText,
          cursorColor: Colors.green,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            // labelStyle: const TextStyle(color: Colors.green),
            // enabledBorder:
            //     OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(
            //     style: BorderStyle.solid,
            //     color: Colors.green,
            //   ),
            // ),
          ),
        ));
  }
}
