// ignore_for_file: camel_case_types, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:flutterprovider/views/widgets/global/gradients_color.dart';

class CreateCardScreen extends StatelessWidget {
  const CreateCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Bank Card',
          textSize: 20,
        ),
        backgroundColor: CO_BLUE,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                color: CO_PRIMARY,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue.shade600,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 20,
                              offset: Offset(1, 1),
                            )
                          ]),
                      child: const Icon(
                        Icons.card_giftcard_rounded,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const cardbuilder(),
          const cardbuilder(),
        ],
      ),
    );
  }
}

class cardbuilder extends StatelessWidget {
  const cardbuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      // margin: const EdgeInsets.all(15),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  // color: Colors.yellow.shade800,
                  gradient: const LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.green,
                    ],
                    begin: Alignment.topLeft,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'lib/assets/images/card.svg',
                    color: CO_LIGHTYELLOW,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            text: 'Debit Card',
                            textSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                            'lib/assets/images/visa.svg',
                            // color: CO_BLUE,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 30,
                          child: Image.asset(
                            'lib/assets/images/pngmaster.png',
                            // color: CO_BLUE,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 30,
                          child: SvgPicture.asset(
                            'lib/assets/images/unionpay.svg',
                            // color: CO_BLUE,
                          ),
                        ),
                      ],
                    ),
                    CustomText(
                      text:
                          'Sometime it could be handy to only return part of the products. For exemple some fields can be confidentialHere a exemple returning everything except the price.',
                      textSize: 15,
                      color: CO_GRAY,
                    ),
                    GestureDetector(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Container()),
                          CustomText(
                            text: 'Request new',
                            Roboto_Slap: true,
                            textSize: 15,
                            color: CO_DARKBLUE,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
