// To parse this JSON data, do
//
//     final ourStoryModel = ourStoryModelFromJson(jsonString);

import 'dart:convert';

OurStoryModel ourStoryModelFromJson(String str) =>
    OurStoryModel.fromJson(json.decode(str));

String ourStoryModelToJson(OurStoryModel data) => json.encode(data.toJson());

class OurStoryModel {
  OurStoryModel({
    this.result,
    this.status,
    this.message,
  });

  List<Result>? result;
  int? status;
  String? message;

  factory OurStoryModel.fromJson(Map<String, dynamic> json) => OurStoryModel(
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
    this.description,
    this.imageName,
  });

  int? id;
  String? title;
  String? description;
  String? imageName;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["Id"],
        title: json["Title"],
        description: json["Description"],
        imageName: json["ImageName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Title": title,
        "Description": description,
        "ImageName": imageName,
      };
}
