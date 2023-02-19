import 'dart:io';

import 'package:flutterprovider/models/user_model.dart';
import 'package:flutterprovider/repository/api_status.dart';
import 'package:flutterprovider/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<Object?> getUsers() async {
    try {
      var url = Uri.parse(USER_URL);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return Success(response: usersFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_CONSTANT, errorResponse: 'Invalid response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWM_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
