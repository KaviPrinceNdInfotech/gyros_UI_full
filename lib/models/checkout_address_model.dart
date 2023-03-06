// To parse this JSON data, do
//
//     final adressbyidModel = adressbyidModelFromJson(jsonString);

import 'dart:convert';

AdressbyidModel adressbyidModelFromJson(String str) =>
    AdressbyidModel.fromJson(json.decode(str));

String adressbyidModelToJson(AdressbyidModel data) =>
    json.encode(data.toJson());

class AdressbyidModel {
  AdressbyidModel({
    this.status,
    this.result,
    this.message,
  });

  int? status;
  List<Result>? result;
  String? message;

  factory AdressbyidModel.fromJson(Map<String, dynamic> json) =>
      AdressbyidModel(
        status: json["status"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "message": message,
      };
}

class Result {
  Result({
    this.id,
    this.name,
    this.mobile,
    this.state,
    this.city,
    this.area,
    this.pinCode,
    this.userId,
  });

  int? id;
  String? name;
  String? mobile;
  String? state;
  String? city;
  String? area;
  String? pinCode;
  int? userId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["Id"],
        name: json["Name"],
        mobile: json["Mobile"],
        state: json["State"],
        city: json["City"],
        area: json["Area"],
        pinCode: json["PinCode"],
        userId: json["UserId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Mobile": mobile,
        "State": state,
        "City": city,
        "Area": area,
        "PinCode": pinCode,
        "UserId": userId,
      };
}
