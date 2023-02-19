// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_button.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';

void CustomAlertDialog(
  BuildContext context, {
  required String title,
  bool istitle = false,
  required Function()? onPressOK,
}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: CustomText(
            text: title,
            color: CO_WHITE,
            istitle: istitle,
          ),
          backgroundColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customButton(
                  onPress: () {
                    Navigator.of(context).pop();
                  },
                  btnName: 'Cancel',
                  bColor: CO_GRAY,
                ),
                const SizedBox(
                  width: 20,
                ),
                customButton(
                  onPress: () => onPressOK,
                  btnName: 'Delete',
                  bColor: CO_RED,
                ),
              ],
            ),
          ),
        );
      });
}
