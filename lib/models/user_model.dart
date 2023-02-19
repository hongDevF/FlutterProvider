// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.id,
    this.uid,
    this.password,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.avatar,
    this.gender,
    this.phoneNumber,
    this.socialInsuranceNumber,
    this.dateOfBirth,
    this.employment,
    this.address,
    this.creditCard,
    this.subscription,
  });

  int? id;
  String? uid;
  String? password;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? avatar;
  String? gender;
  String? phoneNumber;
  String? socialInsuranceNumber;
  DateTime? dateOfBirth;
  Employment? employment;
  Address? address;
  CreditCard? creditCard;
  Subscription? subscription;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        uid: json["uid"],
        password: json["password"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"],
        avatar: json["avatar"],
        gender: json["gender"],
        phoneNumber: json["phone_number"],
        socialInsuranceNumber: json["social_insurance_number"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        employment: Employment.fromJson(json["employment"]),
        address: Address.fromJson(json["address"]),
        creditCard: CreditCard.fromJson(json["credit_card"]),
        subscription: Subscription.fromJson(json["subscription"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "avatar": avatar,
        "gender": gender,
        "phone_number": phoneNumber,
        "social_insurance_number": socialInsuranceNumber,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "employment": employment!.toJson(),
        "address": address!.toJson(),
        "credit_card": creditCard!.toJson(),
        "subscription": subscription!.toJson(),
      };
}

class Address {
  Address({
    this.city,
    this.streetName,
    this.streetAddress,
    this.zipCode,
    this.state,
    this.country,
    this.coordinates,
  });

  String? city;
  String? streetName;
  String? streetAddress;
  String? zipCode;
  String? state;
  String? country;
  Coordinates? coordinates;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        streetName: json["street_name"],
        streetAddress: json["street_address"],
        zipCode: json["zip_code"],
        state: json["state"],
        country: json["country"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "street_name": streetName,
        "street_address": streetAddress,
        "zip_code": zipCode,
        "state": state,
        "country": country,
        "coordinates": coordinates!.toJson(),
      };
}

class Coordinates {
  Coordinates({
    this.lat,
    this.lng,
  });

  double? lat;
  double? lng;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class CreditCard {
  CreditCard({
    this.ccNumber,
  });

  String? ccNumber;

  factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
        ccNumber: json["cc_number"],
      );

  Map<String, dynamic> toJson() => {
        "cc_number": ccNumber,
      };
}

class Employment {
  Employment({
    this.title,
    this.keySkill,
  });

  String? title;
  String? keySkill;

  factory Employment.fromJson(Map<String, dynamic> json) => Employment(
        title: json["title"],
        keySkill: json["key_skill"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "key_skill": keySkill,
      };
}

class Subscription {
  Subscription({
    this.plan,
    this.status,
    this.paymentMethod,
    this.term,
  });

  String? plan;
  String? status;
  String? paymentMethod;
  String? term;

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        plan: json["plan"],
        status: json["status"],
        paymentMethod: json["payment_method"],
        term: json["term"],
      );

  Map<String, dynamic> toJson() => {
        "plan": plan,
        "status": status,
        "payment_method": paymentMethod,
        "term": term,
      };
}
