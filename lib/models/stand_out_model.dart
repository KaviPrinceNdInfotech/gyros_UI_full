// To parse this JSON data, do
//
//     final standOut = standOutFromJson(jsonString);

import 'dart:convert';

StandOut standOutFromJson(String str) => StandOut.fromJson(json.decode(str));

String standOutToJson(StandOut data) => json.encode(data.toJson());

class StandOut {
  StandOut({
    this.result,
    this.status,
    this.message,
  });

  List<Result> ?result;
  int? status;
  String? message;

  factory StandOut.fromJson(Map<String, dynamic> json) => StandOut(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
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
    this.image,
    this.description,
    this.productId,
  });

  int ?id;
  String? title;
  String? image;
  String ?description;
  int? productId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["Id"],
    title: json["Title"],
    image: json["Image"],
    description: json["Description"],
    productId: json["ProductId"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Title": title,
    "Image": image,
    "Description": description,
    "ProductId": productId,
  };
}
