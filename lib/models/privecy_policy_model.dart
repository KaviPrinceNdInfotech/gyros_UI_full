// To parse this JSON data, do
//
//     final privecypolicyModel = privecypolicyModelFromJson(jsonString);

import 'dart:convert';

PrivecypolicyModel privecypolicyModelFromJson(String str) =>
    PrivecypolicyModel.fromJson(json.decode(str));

String privecypolicyModelToJson(PrivecypolicyModel data) =>
    json.encode(data.toJson());

class PrivecypolicyModel {
  PrivecypolicyModel({
    this.result,
    this.status,
    this.message,
  });

  Result? result;
  int? status;
  String? message;

  factory PrivecypolicyModel.fromJson(Map<String, dynamic> json) =>
      PrivecypolicyModel(
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
    this.privacy,
  });

  int? id;
  String? privacy;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        privacy: json["privacy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "privacy": privacy,
      };
}
