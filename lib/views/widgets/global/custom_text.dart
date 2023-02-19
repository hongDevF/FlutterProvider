// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    this.color,
    this.istitle = false,
    this.Roboto = false,
    this.Popin = false,
    this.textSize = 18,
    this.Roboto_Slap = false,
  });
  final String text;
  final Color? color;
  final bool istitle;
  final double? textSize;
  final bool Roboto;
  final bool Popin;
  final bool Roboto_Slap;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: istitle ? FontWeight.bold : null,
        color: color,
        fontFamily: Roboto
            ? 'Roboto-Light'
            : Popin
                ? 'Popin'
                : Roboto_Slap
                    ? 'Roboto-Slap'
                    : null,
      ),
    );
  }
}
