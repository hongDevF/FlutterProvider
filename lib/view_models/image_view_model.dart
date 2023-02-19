// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutterprovider/models/image_model.dart';
import 'package:flutterprovider/services/img_service.dart';

class ImageViewModel extends ChangeNotifier {
  final _imgService = ImgService();
  bool _isLoading = false;

  List<ImageModel> _imgList = [];

  List<ImageModel> get image => _imgList;

  Future<void> getAllImages() async {
    _isLoading = true;
    notifyListeners();
    final response = await _imgService.getAllImage();
    _imgList = response!;
    _isLoading = false;
    notifyListeners();
  }
}
