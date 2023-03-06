// // To parse this JSON data, do
// //
// //     final getProductModel = getProductModelFromJson(jsonString);
//
// import 'dart:convert';
//
// import 'package:get/get.dart';
//
// GetProductModel getProductModelFromJson(String str) =>
//     GetProductModel.fromJson(json.decode(str));
//
// String getProductModelToJson(GetProductModel data) =>
//     json.encode(data.toJson());
//
// class GetProductModel {
//   GetProductModel({
//     required this.result,
//     required this.status,
//     required this.message,
//   });
//
//   List<Result>? result;
//   int status;
//   String message;
//
//   factory GetProductModel.fromJson(Map<String, dynamic> json) =>
//       GetProductModel(
//         result:
//         List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
//         status: json["status"],
//         message: json["message"],
//       );
//
//   Map<String, dynamic> toJson() => {
//     "result": List<dynamic>.from(result!.map((x) => x.toJson())),
//     "status": status,
//     "message": message,
//   };
// }
//
// class Result {
//   Result({
//     required this.id,
//     required this.productName,
//     required this.productImage,
//     required this.price,
//     required this.discountPercentage,
//     required this.finalPrice,
//     required this.quentity,
//     required this.productDescription,
//   });
//
//   int id;
//   String productName;
//   String productImage;
//   int price;
//   int discountPercentage;
//   int finalPrice;
//   dynamic quentity;
//   String productDescription;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     id: json["id"],
//     productName: json["ProductName"],
//     productImage: json["Product_Image"],
//     price: json["Price"],
//     discountPercentage: json["DiscountPercentage"],
//     finalPrice: json["FinalPrice"],
//     quentity: json["Quentity"],
//     productDescription: json["ProductDescription"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "ProductName": productName,
//     "Product_Image": productImage,
//     "Price": price,
//     "DiscountPercentage": discountPercentage,
//     "FinalPrice": finalPrice,
//     "Quentity": quentity,
//     "ProductDescription": productDescription,
//   };
// }




///new model
// To parse this JSON data, do
//
//     final getProductModel = getProductModelFromJson(jsonString);

import 'dart:convert';

GetProductModel getProductModelFromJson(String str) => GetProductModel.fromJson(json.decode(str));

String getProductModelToJson(GetProductModel data) => json.encode(data.toJson());

class GetProductModel {
  GetProductModel({
    required this.result,
    required this.status,
    required this.message,
  });

  List<Result> result;
  int status;
  String message;

  factory GetProductModel.fromJson(Map<String, dynamic> json) => GetProductModel(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Result {
  Result({
    required this.id,
    required this.productName,
    required this.price,
    required this.productImage,
    this.discount,
    this.weight1,
    required this.pkt1,
    required this.discountPercentage,
    required this.finalPrice,
    this.sellerOption,
    required this.qty1,
    this.productDescription,
    required this.rating,
  });

  int id;
  String productName;
  int price;
  String productImage;
  String? discount;
  String? weight1;
  String pkt1;
  int discountPercentage;
  int finalPrice;
  dynamic sellerOption;
  int qty1;
  dynamic productDescription;
  double rating;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["Id"],
    productName: json["ProductName"],
    price: json["Price"],
    productImage: json["Product_Image"],
    discount: json["Discount"],
    weight1: json["Weight1"],
    pkt1: json["Pkt1"],
    discountPercentage: json["DiscountPercentage"],
    finalPrice: json["FinalPrice"],
    sellerOption: json["SellerOption"],
    qty1: json["Qty1"],
    productDescription: json["ProductDescription"],
    rating: json["Rating"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "ProductName": productName,
    "Price": price,
    "Product_Image": productImage,
    "Discount": discount,
    "Weight1": weight1,
    "Pkt1": pkt1,
    "DiscountPercentage": discountPercentage,
    "FinalPrice": finalPrice,
    "SellerOption": sellerOption,
    "Qty1": qty1,
    "ProductDescription": productDescription,
    "Rating": rating,
  };
}
