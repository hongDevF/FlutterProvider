// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/usermodel.dart';

class UserService {
  // final USER_URL = ' http://localhost:3000/api/users';
  Future<List<Users>?> getAllUser() async {
    const String USER_URL = 'http://localhost:3000/api/users';
    final url = Uri.parse(USER_URL);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final user = json.map((e) {
        return Users(
          id: e['id'],
          userName: e['userName'],
        );
      }).toList();
      return user;
    }
    return [];
  }
}
