// To parse this JSON data, do
//
//     final catagaryListModel = catagaryListModelFromJson(jsonString);

import 'dart:convert';

List<CatagaryListModel> catagaryListModelFromJson(String str) =>
    List<CatagaryListModel>.from(
        json.decode(str).map((x) => CatagaryListModel.fromJson(x)));

String catagaryListModelToJson(List<CatagaryListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatagaryListModel {
  CatagaryListModel({
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

  factory CatagaryListModel.fromJson(Map<String, dynamic> json) =>
      CatagaryListModel(
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
