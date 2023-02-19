// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Future<void> MyDialog(
  BuildContext context, {
  Widget? title,
  Widget? content,
}) {
  return showDialog(
    context: (context),
    builder: (context) {
      return AlertDialog(
        title: title,
        content: content,
      );
    },
  );
}
