import 'dart:convert';

import 'package:flutterprovider/models/product_model.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class ProductService {
  Future<List<Product>?> getAllProduct() async {
    final Uri uri = Uri.parse(PRODUCT_URL);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final product = json.map((e) {
        return Product(
          title: e['title'],
          price: e['price'],
          stock: e['stock'],
          category: e['category'],
          images: [],
          description: e['description'],
        );
      }).toList();
      return product;
    }
    return [];
  }
}
