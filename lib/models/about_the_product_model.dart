// To parse this JSON data, do
//
//     final allDetail = allDetailFromJson(jsonString);

import 'dart:convert';

AllDetail allDetailFromJson(String str) => AllDetail.fromJson(json.decode(str));

String allDetailToJson(AllDetail data) => json.encode(data.toJson());

class AllDetail {
  AllDetail({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String ?message;
  List<Result>? result;

  factory AllDetail.fromJson(Map<String, dynamic> json) => AllDetail(
    status: json["status"],
    message: json["message"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.image,
    this.title,
    this.description,
  });

  int ?id;
  String? image;
  String ?title;
  String ?description;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["Id"],
    image: json["Image"],
    title: json["Title"],
    description: json["Description"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Image": image,
    "Title": title,
    "Description": description,
  };
}
