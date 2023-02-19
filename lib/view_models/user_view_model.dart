// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutterprovider/models/user_model.dart';
import 'package:flutterprovider/repository/api_status.dart';
import 'package:flutterprovider/services/api_service.dart';

import '../models/user_error.dart';

class UserViewModel with ChangeNotifier {
  bool _loading = false;
  UserError _userError = UserError();

  List<Users> _userListModel = [];

  bool get loading => _loading;

  List<Users> get userListModel => _userListModel;
  UserError get userError => _userError;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  UserViewModel() {
    getUsers();
  }
  setUserListModel(List<Users> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserService().getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<Users>);
      print('test');
    }

    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse,
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}
