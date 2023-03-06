// To parse this JSON data, do
//
//     final addaddressModel = addaddressModelFromJson(jsonString);

import 'dart:convert';

AddaddressModel addaddressModelFromJson(String str) =>
    AddaddressModel.fromJson(json.decode(str));

String addaddressModelToJson(AddaddressModel data) =>
    json.encode(data.toJson());

class AddaddressModel {
  AddaddressModel({
    this.addaddressModelStatus,
    this.result,
    this.status,
  });

  String? addaddressModelStatus;
  List<Result>? result;
  int? status;

  factory AddaddressModel.fromJson(Map<String, dynamic> json) =>
      AddaddressModel(
        addaddressModelStatus: json["status"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "status": addaddressModelStatus,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "Status": status,
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
