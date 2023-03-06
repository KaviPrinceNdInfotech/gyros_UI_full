// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.des,
    this.price,
    this.color,
    this.size,
    this.image,
  });

  int? id;
  String? name;
  String? des;
  String? price;
  String? color;
  String? size;
  String? image;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        des: json["des"],
        price: json["price"],
        color: json["color"],
        size: json["size"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "des": des,
        "price": price,
        "color": color,
        "size": size,
        "image": image,
      };
}
