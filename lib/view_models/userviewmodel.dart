// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutterprovider/services/user_service.dart';

import '../models/usermodel.dart';

class UserNotify extends ChangeNotifier {
  final _userService = UserService();

  bool _isLoading = false;

  List<Users> _userList = [];

  List<Users> get users => _userList;

  Future<void> getUser() async {
    _isLoading = true;
    notifyListeners();

    final response = await _userService.getAllUser();
    _userList = response!;
    _isLoading = false;
    notifyListeners();
  }
}
