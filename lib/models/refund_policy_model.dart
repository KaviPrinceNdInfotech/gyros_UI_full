// To parse this JSON data, do
//
//     final refundpolicyModel = refundpolicyModelFromJson(jsonString);

import 'dart:convert';

RefundpolicyModel refundpolicyModelFromJson(String str) =>
    RefundpolicyModel.fromJson(json.decode(str));

String refundpolicyModelToJson(RefundpolicyModel data) =>
    json.encode(data.toJson());

class RefundpolicyModel {
  RefundpolicyModel({
    this.result,
    this.status,
    this.message,
  });

  Result? result;
  int? status;
  String? message;

  factory RefundpolicyModel.fromJson(Map<String, dynamic> json) =>
      RefundpolicyModel(
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
    this.refundpolicy1,
  });

  int? id;
  String? refundpolicy1;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["Id"],
        refundpolicy1: json["Refundpolicy1"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Refundpolicy1": refundpolicy1,
      };
}
