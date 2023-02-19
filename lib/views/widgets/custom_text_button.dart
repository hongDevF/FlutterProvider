// ignore_for_file: unused_import, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'global/colors.dart';
import 'global/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    Key? key,
    required this.name,
    this.onPress,
    this.color,
  }) : super(key: key);
  final String name;
  final VoidCallback? onPress;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: CustomText(
        text: name,
        color: color,
      ),
    );
  }
}
