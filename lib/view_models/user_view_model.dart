// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutterprovider/services/api_service.dart';
import '../models/user_model.dart';

class UserModelProvider with ChangeNotifier {
  UserService userService = UserService();

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  Future<void> fetchUserModel() async {
    if (_userModel == null) {
      final user = await userService.getUsers();
      _userModel = user;
    } else {
      _userModel;
    }
  }
}
