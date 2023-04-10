import 'package:flutter/material.dart';
import 'package:flutterprovider/models/university_model.dart';
import 'package:flutterprovider/services/university-service.dart';

class UniversityProvider extends ChangeNotifier {
  UniversityService universityService = UniversityService();

  List<UniversityModel> _university = [];
  List<UniversityModel> get university => _university;
  bool _Loading = false;
  bool get Loading => _Loading;

  Future<List<UniversityModel>?> getUniversityData() async {
    _Loading = true;
    final udata = await universityService.getAllUniversitiy();
    _university = udata;

    _Loading = false;
    notifyListeners();
    return null;
  }
}
