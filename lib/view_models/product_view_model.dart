// ignore_for_file: prefer_final_fields, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutterprovider/utils/utils.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:flutterprovider/views/widgets/global/show_dialog.dart';

import '../models/product.dart';

class ProductNotifier extends ChangeNotifier {
  List<ProductModel> _listProducts = [];
  TextEditingController txtTextController = TextEditingController();
  addProduct(
    BuildContext context,
  ) {
    if (txtTextController.text.isNotEmpty) {
      return MyDialog(context,
          title: const Text('test'),
          content: CustomText(text: "Data input successflull"));
    } else {
      Utils.toastMessage(msg: "Please enter product name!");
    }
    txtTextController.clear();
    notifyListeners();
  }

  deleteProduct(index) {
    _listProducts.removeWhere(
      (_product) => _product.pro_id == _listProducts[index].pro_id,
    );

    notifyListeners();
  }
}
