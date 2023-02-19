// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutterprovider/view_models/product_viewmodel.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:provider/provider.dart';

class ProductScreenList extends StatefulWidget {
  const ProductScreenList({super.key});

  @override
  State<ProductScreenList> createState() => _ProductScreenListState();
}

class _ProductScreenListState extends State<ProductScreenList> {
  @override
  void initState() {
    ProviderWorker();
    super.initState();
  }

  ProviderWorker() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        final provider = Provider.of<ProductViewModel>(context, listen: false);
        provider.getAllProducts();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CO_DARKBLUE,
        title: CustomText(text: 'PRODUCTS LIST'),
      ),
      body: Consumer<ProductViewModel>(
        builder: (context, value, child) {
          final products = value.productList;
          if (products.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.images![index]![0]),
                  ),
                  title: Text(item.title!),
                );
              });
        },
      ),
    );
  }
}
