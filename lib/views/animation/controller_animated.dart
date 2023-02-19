// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: ControllerAnimated(),
  ));
}

class ControllerAnimated extends StatefulWidget {
  const ControllerAnimated({super.key});

  @override
  State<ControllerAnimated> createState() => _ControllerAnimatedState();
}

class _ControllerAnimatedState extends State<ControllerAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 2),
      // upperBound: 20,
    );
    controller.reverse(from: 30);

    // Curve animated
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation.addStatusListener((status) {
      print(status);
    });
    controller.addListener(() {
      // print(controller.value);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          text: 'Controller Animation ${animation.value}',
          color: CO_BLACK,
          textSize: 10,
        ),
      ),
    );
  }
}
