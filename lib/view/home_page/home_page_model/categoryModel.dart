// To parse this JSON data, do
//
//     final catagaryListModel = catagaryListModelFromJson(jsonString);

import 'dart:convert';

CatagaryListModel catagaryListModelFromJson(String str) =>
    CatagaryListModel.fromJson(json.decode(str));

String catagaryListModelToJson(CatagaryListModel data) =>
    json.encode(data.toJson());

class CatagaryListModel {
  CatagaryListModel({
    this.result,
    this.status,
    this.message,
  });

  List<Result>? result;
  int? status;
  String? message;

  factory CatagaryListModel.fromJson(Map<String, dynamic> json) =>
      CatagaryListModel(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Result {
  Result({
    this.id,
    this.categoryName,
    this.imageName,
  });

  int? id;
  String? categoryName;
  String? imageName;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        categoryName: json["CategoryName"],
        imageName: json["ImageName"] == null ? null : json["ImageName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "CategoryName": categoryName,
        "ImageName": imageName == null ? null : imageName,
      };
}
