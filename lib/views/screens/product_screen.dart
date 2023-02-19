// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutterprovider/view_models/product_view_model.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_button.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_text_field.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    ProductNotifier productNotifier = Provider.of<ProductNotifier>(context);
    TextEditingController _proNameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Product',
          textSize: 20,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: customTextField(
              controller: _proNameController,
              hintText: 'Product',
              msgToast: 'please input product name!!',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: customTextField(
              controller: productNotifier.txtTextController,
              hintText: 'Price',
              msgToast: 'please input product name!!',
            ),
          ),
          Consumer(builder: (_, notifier, __) => Container()),
          customButton(
            onPress: () => productNotifier.addProduct(context),
            btnName: 'Save',
            bColor: CO_BLUE,
          ),
        ],
      ),
    );
  }
}
