// To parse this JSON data, do
//
//     final images = imagesFromJson(jsonString);

import 'dart:convert';

List<ImageModel?>? imagesFromJson(String str) => json.decode(str) == null
    ? []
    : List<ImageModel?>.from(
        json.decode(str)!.map((x) => ImageModel.fromJson(x)));

String imagesToJson(List<ImageModel?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class ImageModel {
  ImageModel({
    this.url,
  });

  String? url;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
