// To parse this JSON data, do
//
//     final subcatbyId = subcatbyIdFromJson(jsonString);

import 'dart:convert';

SubcatbyId subcatbyIdFromJson(String str) =>
    SubcatbyId.fromJson(json.decode(str));

String subcatbyIdToJson(SubcatbyId data) => json.encode(data.toJson());

class SubcatbyId {
  SubcatbyId({
    this.result,
    this.status,
    this.message,
  });

  List<Result>? result;
  int? status;
  String? message;

  factory SubcatbyId.fromJson(Map<String, dynamic> json) => SubcatbyId(
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
    this.productName,
    this.productImage,
    this.price,
    this.quentity,
  });

  int? id;
  String? productName;
  String? productImage;
  int? price;
  dynamic? quentity;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        productName: json["ProductName"],
        productImage: json["Product_Image"],
        price: json["Price"],
        quentity: json["Quentity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ProductName": productName,
        "Product_Image": productImage,
        "Price": price,
        "Quentity": quentity,
      };
}
