import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  const TextFieldWidget({
    required this.hintText,
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
      cursorColor: Colors.green,
      // controller: ,
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
    )
    );
  }
}


