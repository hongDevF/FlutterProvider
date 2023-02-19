import 'package:flutter/material.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';

// ignore: camel_case_types
class customButton extends StatelessWidget {
  const customButton({
    Key? key,
    required this.onPress,
    required this.btnName,
    this.color,
    this.bColor = Colors.blue,
    this.borderRadius = 10,
  }) : super(key: key);
  final Function() onPress;
  final String btnName;
  final Color? color;
  final Color bColor;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(bColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          )),
      onPressed: onPress,
      child: CustomText(
        text: btnName,
        Popin: true,
        color: color,
      ),
    );
  }
}
