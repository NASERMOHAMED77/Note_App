// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../constant.dart';

class DefultField extends StatelessWidget {
  DefultField(
      {super.key,
      required this.hint,
      required this.controller,
      required this.validate});
  String hint;
  final String? Function(String?)? validate;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        validator: validate,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kscolor))),
      ),
    );
  }
}
