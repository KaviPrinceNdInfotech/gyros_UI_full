// To parse this JSON data, do
//
//     final shippingpolicyModel = shippingpolicyModelFromJson(jsonString);

import 'dart:convert';

ShippingpolicyModel shippingpolicyModelFromJson(String str) =>
    ShippingpolicyModel.fromJson(json.decode(str));

String shippingpolicyModelToJson(ShippingpolicyModel data) =>
    json.encode(data.toJson());

class ShippingpolicyModel {
  ShippingpolicyModel({
    this.result,
    this.status,
    this.message,
  });

  Result? result;
  int? status;
  String? message;

  factory ShippingpolicyModel.fromJson(Map<String, dynamic> json) =>
      ShippingpolicyModel(
        result: Result.fromJson(json["result"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "status": status,
        "message": message,
      };
}

class Result {
  Result({
    this.id,
    this.shipping,
  });

  int? id;
  String? shipping;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["Id"],
        shipping: json["Shipping"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Shipping": shipping,
      };
}
