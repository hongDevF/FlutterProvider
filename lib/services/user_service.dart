// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class UserService {
  // final USER_URL = ' http://localhost:3000/api/users';
  Future<UserModel> getAllUser() async {
    try {
      final response = await http.get(Uri.parse('https://randomuser.me/api'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final data = UserModel.fromJson(jsonData);
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      rethrow;
    }
  }
}
