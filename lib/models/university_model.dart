// To parse this JSON data, do
//
//     final universityModel = universityModelFromJson(jsonString);

import 'dart:convert';

List<UniversityModel> universityModelFromJson(String str) =>
    List<UniversityModel>.from(
        json.decode(str).map((x) => UniversityModel.fromJson(x)));

String universityModelToJson(List<UniversityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UniversityModel {
  UniversityModel({
    this.domains,
    this.stateProvince,
    this.name,
    this.webPages,
    this.country,
    this.alphaTwoCode,
  });

  List<String>? domains;
  String? stateProvince;
  String? name;
  List<String>? webPages;
  Country? country;
  AlphaTwoCode? alphaTwoCode;

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        domains: List<String>.from(json["domains"].map((x) => x)),
        stateProvince: json["state-province"],
        name: json["name"],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        country: countryValues.map[json["country"]]!,
        alphaTwoCode: alphaTwoCodeValues.map[json["alpha_two_code"]]!,
      );

  Map<String, dynamic> toJson() => {
        "domains": List<dynamic>.from(domains!.map((x) => x)),
        "state-province": stateProvince,
        "name": name,
        "web_pages": List<dynamic>.from(webPages!.map((x) => x)),
        "country": countryValues.reverse[country],
        "alpha_two_code": alphaTwoCodeValues.reverse[alphaTwoCode],
      };
}

enum AlphaTwoCode { US }

final alphaTwoCodeValues = EnumValues({"US": AlphaTwoCode.US});

enum Country { UNITED_STATES }

final countryValues = EnumValues({"United States": Country.UNITED_STATES});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
