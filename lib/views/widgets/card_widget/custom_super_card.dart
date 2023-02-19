// ignore_for_file: prefer_const_constructors, unused_local_variable, camel_case_types

import 'package:flutter/material.dart';

import '../../screens/card/super_card.dart';
import '../global/colors.dart';
import '../global/custom_text.dart';

class customSuperCard extends StatelessWidget {
  const customSuperCard({
    Key? key,
    required this.color,
    required this.image,
  }) : super(key: key);
  final Color color;
  final String image;
  @override
  Widget build(BuildContext context) {
    final SuperCard superCard = SuperCard();
    List<String> typeCard = [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/2560px-Visa_Inc._logo.svg.png',
      'https://download.logo.wine/logo/Mastercard/Mastercard-Logo.wine.png',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/PayPal.svg/2560px-PayPal.svg.png',
    ];
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
              offset: Offset(5, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(height: 20, child: Image.network(image)),
                  // Icon(Icons.favorite),
                  Expanded(child: Container()),
                  CustomText(text: '06/28'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                text: '\$13423.80',
                istitle: false,
                textSize: 25,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: '1111 **** **** 2221',
                  color: CO_BLACK,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
