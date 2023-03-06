// To parse this JSON data, do
//
//     final noOfCartModel = noOfCartModelFromJson(jsonString);

import 'dart:convert';

NoOfCartModel noOfCartModelFromJson(String str) =>
    NoOfCartModel.fromJson(json.decode(str));

String noOfCartModelToJson(NoOfCartModel data) => json.encode(data.toJson());

class NoOfCartModel {
  NoOfCartModel({
    this.status,
    this.result,
    this.message,
  });

  int? status;
  int? result;
  String? message;

  factory NoOfCartModel.fromJson(Map<String, dynamic> json) => NoOfCartModel(
        status: json["status"],
        result: json["result"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "message": message,
      };
}
