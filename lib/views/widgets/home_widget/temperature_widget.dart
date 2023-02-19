import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../global/colors.dart';
import '../global/custom_text.dart';

class TemperatureButton extends StatelessWidget {
  const TemperatureButton({
    Key? key,
    this.color,
    required this.svg,
  }) : super(key: key);
  final Color? color;
  final String svg;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CO_WHITE,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(5, 5),
            color: Colors.grey.shade400,
          )
        ],
      ),
      child: Stack(children: [
        Positioned(
          top: 10,
          right: 10,
          child: SvgPicture.asset(
            'lib/assets/icons/off.svg',
            color: CO_DARKBLUE,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                child: SvgPicture.asset(
                  svg,
                  color: color,
                  width: 60,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomText(text: 'Temperature'),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
