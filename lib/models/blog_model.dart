// To parse this JSON data, do
//
//     final blogModel = blogModelFromJson(jsonString);

import 'dart:convert';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
  BlogModel({
    this.result,
    this.status,
    this.message,
  });

  List<Result>? result;
  int? status;
  String? message;

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
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
    this.title,
    this.createContent,
    this.imagePath,
  });

  int? id;
  String? title;
  String? createContent;
  String? imagePath;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["Id"],
        title: json["Title"],
        createContent: json["CreateContent"],
        imagePath: json["ImagePath"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Title": title,
        "CreateContent": createContent,
        "ImagePath": imagePath,
      };
}
