// To parse this JSON data, do
//
//     final allProductModel = allProductModelFromJson(jsonString);

// import 'dart:convert';
//
// AllProductModel allProductModelFromJson(String str) =>
//     AllProductModel.fromJson(json.decode(str));
//
// String allProductModelToJson(AllProductModel data) =>
//     json.encode(data.toJson());
//
// class AllProductModel {
//   AllProductModel({
//     this.result,
//     this.status,
//     this.message,
//   });
//
//   List<Result>? result;
//   int? status;
//   String? message;
//
//   factory AllProductModel.fromJson(Map<String, dynamic> json) =>
//       AllProductModel(
//         result:
//             List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
//         status: json["status"],
//         message: json["message"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "result": List<dynamic>.from(result!.map((x) => x.toJson())),
//         "status": status,
//         "message": message,
//       };
// }
//
// class Result {
//   Result({
//     this.id,
//     this.productName,
//     this.productImage,
//     this.price,
//     this.quentity,
//     this.productDescription,
//   });
//
//   int? id;
//   String? productName;
//   String? productImage;
//   int? price;
//   dynamic? quentity;
//   String? productDescription;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         id: json["id"],
//         productName: json["ProductName"],
//         productImage: json["Product_Image"],
//         price: json["Price"],
//         quentity: json["Quentity"],
//         productDescription: json["ProductDescription"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "ProductName": productName,
//         "Product_Image": productImage,
//         "Price": price,
//         "Quentity": quentity,
//         "ProductDescription": productDescription,
//       };
// }

// To parse this JSON data, do
//
//     final allProductModel = allProductModelFromJson(jsonString);
///

// import 'dart:convert';
//
// AllProductModel allProductModelFromJson(String str) =>
//     AllProductModel.fromJson(json.decode(str));
//
// String allProductModelToJson(AllProductModel data) =>
//     json.encode(data.toJson());
//
// class AllProductModel {
//   AllProductModel({
//     this.result,
//     this.status,
//     this.message,
//   });
//
//   List<Result>? result;
//   int? status;
//   String? message;
//
//   factory AllProductModel.fromJson(Map<String, dynamic> json) =>
//       AllProductModel(
//         result: json["result"] == null
//             ? null
//             : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
//         status: json["status"] == null ? null : json["status"],
//         message: json["message"] == null ? null : json["message"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "result": result == null
//             ? null
//             : List<dynamic>.from(result!.map((x) => x.toJson())),
//         "status": status == null ? null : status,
//         "message": message == null ? null : message,
//       };
// }
//
// class Result {
//   Result({
//     this.id,
//     this.productName,
//     this.productImage,
//     this.price,
//     this.discountPercentage,
//     this.finalPrice,
//     this.quentity,
//     this.productDescription,
//   });
//
//   int? id;
//   String? productName;
//   String? productImage;
//   int? price;
//   int? discountPercentage;
//   int? finalPrice;
//   dynamic? quentity;
//   String? productDescription;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         id: json["id"] == null ? null : json["id"],
//         productName: json["ProductName"] == null ? null : json["ProductName"],
//         productImage:
//             json["Product_Image"] == null ? null : json["Product_Image"],
//         price: json["Price"] == null ? null : json["Price"],
//         discountPercentage: json["DiscountPercentage"] == null
//             ? null
//             : json["DiscountPercentage"],
//         finalPrice: json["FinalPrice"] == null ? null : json["FinalPrice"],
//         quentity: json["Quentity"],
//         productDescription: json["ProductDescription"] == null
//             ? null
//             : json["ProductDescription"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "ProductName": productName == null ? null : productName,
//         "Product_Image": productImage == null ? null : productImage,
//         "Price": price == null ? null : price,
//         "DiscountPercentage":
//             discountPercentage == null ? null : discountPercentage,
//         "FinalPrice": finalPrice == null ? null : finalPrice,
//         "Quentity": quentity,
//         "ProductDescription":
//             productDescription == null ? null : productDescription,
//       };
// }

///new
// To parse this JSON data, do
//
//     final allProductModel = allProductModelFromJson(jsonString);

import 'dart:convert';

AllProductModel allProductModelFromJson(String str) => AllProductModel.fromJson(json.decode(str));

String allProductModelToJson(AllProductModel data) => json.encode(data.toJson());

class AllProductModel {
  AllProductModel({
    required this.result,
    required this.status,
    required this.message,
  });

  List<Result> result;
  int status;
  String message;

  factory AllProductModel.fromJson(Map<String, dynamic> json) => AllProductModel(
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

