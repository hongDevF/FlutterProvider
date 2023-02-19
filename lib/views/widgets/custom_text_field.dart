// ignore_for_file: prefer_const_constructors_in_immutables, camel_case_types, prefer_const_constructors, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';

class customTextField extends StatelessWidget {
  customTextField({
    Key? key,
    required this.controller,
    this.msgToast,
    this.hintText,
    this.prefixIcon,
    this.textError,
    this.isEmpty = false,
    this.valid = false,
  }) : super(key: key);

  final String? msgToast;
  final String? hintText;
  final TextEditingController controller;
  bool valid;
  final String? textError;
  bool isEmpty;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: CO_BLACK,
      decoration: InputDecoration(
        border: out_lineBorder(),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
      ),
      controller: controller,
    );
  }

  OutlineInputBorder out_lineBorder({Color color = CO_BLACK}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: Colors.blue),
    );
  }
}
