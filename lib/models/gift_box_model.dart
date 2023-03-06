// To parse this JSON data, do
//
//     final giftcardModel = giftcardModelFromJson(jsonString);

import 'dart:convert';

GiftcardModel giftcardModelFromJson(String str) =>
    GiftcardModel.fromJson(json.decode(str));

String giftcardModelToJson(GiftcardModel data) => json.encode(data.toJson());

class GiftcardModel {
  GiftcardModel({
    this.result,
    this.status,
    this.message,
  });

  List<Result>? result;
  int? status;
  String? message;

  factory GiftcardModel.fromJson(Map<String, dynamic> json) => GiftcardModel(
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
    this.name,
    this.title,
    this.imageName,
    this.price,
    this.discount,
  });

  int? id;
  String? name;
  String? title;
  String? imageName;
  String? price;
  String? discount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["Id"],
        name: json["Name"],
        title: json["Title"],
        imageName: json["ImageName"],
        price: json["Price"],
        discount: json["Discount"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Title": title,
        "ImageName": imageName,
        "Price": price,
        "Discount": discount,
      };
}
