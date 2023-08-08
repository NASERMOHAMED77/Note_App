// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  TextButtonWidget(
      {super.key,
      required this.nav,
      required this.text,
      required this.subtext});
  Function nav;
  String text;
  String subtext;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        nav();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                subtext,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
