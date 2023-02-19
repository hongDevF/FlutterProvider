// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import

import 'package:flutter/material.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:flutterprovider/views/widgets/global/gradients_color.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

void main() {
  runApp(const MaterialApp(
    home: GradientShowdowButtom(),
  ));
}

class GradientShowdowButtom extends StatelessWidget {
  const GradientShowdowButtom({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home,
      Icons.phone_android,
      Icons.favorite_border,
      Icons.telegram_outlined,
      Icons.facebook_outlined,
      Icons.camera_alt_outlined,
      Icons.camera_alt_outlined,
      Icons.camera_alt_outlined,
      Icons.camera_alt_outlined,
      Icons.camera_alt_outlined,
      Icons.camera_alt_outlined,
    ];

    List<Gradient> gradiens = [
      gradient1,
      gradient2,
      gradient3,
      gradient4,
      gradient5,
      gradient5,
      gradient5,
      gradient5,
      gradient5,
      gradient5,
      gradient1,
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: NewGradientAppBar(
        gradient: gradient2,
        title: Text('Button Gradient'),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.builder(
          itemCount: icons.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return buildGradientBtn(
              icons: icons[index],
              gradient: gradiens[index],
            );
          },
        ),
      ),
    );
  }
}

class buildGradientBtn extends StatefulWidget {
  const buildGradientBtn({
    Key? key,
    required this.icons,
    this.gradient,
  }) : super(key: key);
  final IconData icons;
  final Gradient? gradient;

  @override
  State<buildGradientBtn> createState() => _buildGradientBtnState();
}

class _buildGradientBtnState extends State<buildGradientBtn> {
  bool isClicked = false;
  @override
  void initState() {
    onClick();
    super.initState();
  }

  void onClick() {
    setState(
      () {
        isClicked = !isClicked;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              border: Border.all(width: 2, color: Colors.black),
              gradient: widget.gradient,
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: isClicked ? Colors.black : Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: isClicked ? Colors.black : Colors.transparent,
                    offset: Offset(3, 5),
                  ),
                ]),
          ),
          SizedBox(
            child: Icon(
              widget.icons,
              color: Colors.amberAccent,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
