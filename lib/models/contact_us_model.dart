// To parse this JSON data, do
//
//     final contactUsModel = contactUsModelFromJson(jsonString);

import 'dart:convert';

ContactUsModel contactUsModelFromJson(String str) =>
    ContactUsModel.fromJson(json.decode(str));

String contactUsModelToJson(ContactUsModel data) => json.encode(data.toJson());

class ContactUsModel {
  ContactUsModel({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  Result? result;

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
        status: json["status"],
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": result!.toJson(),
      };
}

class Result {
  Result({
    this.id,
    this.phone,
    this.email,
    this.address,
  });

  int? id;
  String? phone;
  String? email;
  String? address;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["Id"],
        phone: json["Phone"],
        email: json["Email"],
        address: json["Address"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Phone": phone,
        "Email": email,
        "Address": address,
      };
}
