// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class DefultButton extends StatelessWidget {
  DefultButton(
      {super.key,
      required this.color,
      required this.overlaycolor,
      required this.onpressed,
      required this.text});
  Color color;
  String text;
  Color overlaycolor;
  Function onpressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onpressed();
      },
      style: ButtonStyle(
          elevation: MaterialStatePropertyAll(2),
          overlayColor: MaterialStatePropertyAll(overlaycolor),
          shadowColor: MaterialStatePropertyAll(Colors.white30),
          backgroundColor: MaterialStatePropertyAll(color)),
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
