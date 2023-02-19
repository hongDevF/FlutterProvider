import 'dart:convert';

import 'package:flutterprovider/models/image_model.dart';
import 'package:flutterprovider/utils/constants.dart';

import 'package:http/http.dart' as http;

class ImgService {
  Future<List<ImageModel>?> getAllImage() async {
    final url = Uri.parse(IMG_URL);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final img = json.map((e) {
        return ImageModel(url: e['url']);
      }).toList();
      return img;
    }
    return [];
  }
}
