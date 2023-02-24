import 'dart:convert';
import 'dart:io';

import 'package:flutterprovider/models/user_model.dart';
import 'package:flutterprovider/repository/api_status.dart';
import 'package:flutterprovider/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<UserModel?> getUsers() async {
    try {
      var url = Uri.parse(USER_URL);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final responsBody = jsonDecode(response.body);
        final data = UserModel.fromJson(responsBody);
        return data;
      }
    } catch (e) {
      print("Faield");
    }
  }
}
