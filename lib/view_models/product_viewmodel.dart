// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/widgets.dart';
import 'package:flutterprovider/models/product_model.dart';
import 'package:flutterprovider/services/product_service.dart';

class ProductViewModel extends ChangeNotifier {
  final _prductSerive = ProductService();
  bool _isLoading = false;
  List<Product> _productList = [];
  List<Product> get productList => _productList;

  Future<void> getAllProducts() async {
    _isLoading = true;
    notifyListeners();

    final response = await _prductSerive.getAllProduct();
    _productList = response!;
    _isLoading = false;
    notifyListeners();
  }
}
