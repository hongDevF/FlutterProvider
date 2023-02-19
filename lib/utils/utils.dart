// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage({required String msg, Color bg = Colors.black}) {
    Fluttertoast.showToast(msg: msg, backgroundColor: bg);
  }

  static flutterFlushBar() {
    // return FlutterF();
  }
  static myDialog(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog();
      },
    );
  }
}
