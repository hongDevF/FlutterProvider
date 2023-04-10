import 'dart:convert';

import 'package:flutterprovider/models/university_model.dart';

import 'package:http/http.dart' as http;

class UniversityService {
  Future<List<UniversityModel>> getAllUniversitiy() async {
    final response = await http.get(Uri.parse(
        "http://universities.hipolabs.com/search?country=United+States"));
    if (response.statusCode == 200) {
      final responsBody = jsonDecode(response.body) as List;
      final data =
          responsBody.map((json) => UniversityModel.fromJson(json)).toList();
      return data;
    }
    throw "Something when wrong";
  }
}
