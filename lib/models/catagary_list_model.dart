// To parse this JSON data, do
//
//     final catagaryListModels = catagaryListModelsFromJson(jsonString);

import 'dart:convert';

CatagaryListModels catagaryListModelsFromJson(String str) =>
    CatagaryListModels.fromJson(json.decode(str));

String catagaryListModelsToJson(CatagaryListModels data) =>
    json.encode(data.toJson());

class CatagaryListModels {
  CatagaryListModels({
    this.result,
    this.status,
    this.message,
  });

  List<Result>? result;
  int? status;
  String? message;

  factory CatagaryListModels.fromJson(Map<String, dynamic> json) =>
      CatagaryListModels(
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
