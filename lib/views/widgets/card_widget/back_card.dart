import 'package:flutter/material.dart';

import '../global/colors.dart';
import '../global/custom_text.dart';
import '../global/gradients_color.dart';

class BackCard extends StatelessWidget {
  const BackCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: gradient4,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(5, 5),
                ),
              ]),
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                  title: CustomText(
                    text: 'ធនាគារ ធនាគារ',
                    Roboto_Slap: true,
                    textSize: 20,
                    color: CO_WHITE,
                  ),
                  subtitle: CustomText(
                    text: 'konkhmer Bank',
                    textSize: 15,
                  ),
                  leading: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Wikimedia-logo.png/480px-Wikimedia-logo.png')),
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: CO_GRAY,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CustomText(
                      text: '356',
                      color: CO_WHITE,
                    ),
                  ),
                ),
              ),
              CustomText(
                text: '0 0 0 3 5 3 4 3 4 2 3 2 3',
                textSize: 30,
                color: CO_GRAY,
                istitle: true,
                Roboto_Slap: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Column(
                  children: [
                    CustomText(
                      text: 'date',
                      textSize: 10,
                      color: CO_BLACK,
                    ),
                    CustomText(
                      text: '12/25',
                      textSize: 18,
                      color: CO_GRAY,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'HANG SENGHONG',
                      textSize: 20,
                      color: Colors.black54,
                      istitle: true,
                      // Roboto: true,
                    ),
                    SizedBox(
                      height: 30,
                      child: Image.network(
                        'https://1000logos.net/wp-content/uploads/2021/11/VISA-logo.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
