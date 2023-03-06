// To parse this JSON data, do
//
//     final triedProduct = triedProductFromJson(jsonString);

import 'dart:convert';

TriedProduct triedProductFromJson(String str) => TriedProduct.fromJson(json.decode(str));

String triedProductToJson(TriedProduct data) => json.encode(data.toJson());

class TriedProduct {
  TriedProduct({
    this.result,
    this.status,
    this.message,
  });

  List<Result>? result;
  int? status;
  String? message;

  factory TriedProduct.fromJson(Map<String, dynamic> json) => TriedProduct(
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
    this.productName,
    this.productImage,
    this.price,
    this.discountPercentage,
    this.finalPrice,
    this.quentity,
    this.productDescription,
  });

  int? id;
  String? productName;
  String? productImage;
  int? price;
  int? discountPercentage;
  int? finalPrice;
  dynamic quentity;
  String? productDescription;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    productName: json["ProductName"],
    productImage: json["Product_Image"],
    price: json["Price"],
    discountPercentage: json["DiscountPercentage"],
    finalPrice: json["FinalPrice"],
    quentity: json["Quentity"],
    productDescription: json["ProductDescription"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ProductName": productName,
    "Product_Image": productImage,
    "Price": price,
    "DiscountPercentage": discountPercentage,
    "FinalPrice": finalPrice,
    "Quentity": quentity,
    "ProductDescription": productDescription,
  };
}
