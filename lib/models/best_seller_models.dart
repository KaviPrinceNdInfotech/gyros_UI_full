// // To parse this JSON data, do
// //
// //     final bestSellerModel = bestSellerModelFromJson(jsonString);
//
// // To parse this JSON data, do
// //
// //     final bestSellerModel = bestSellerModelFromJson(jsonString);
//
// import 'dart:convert';
//
// BestSellerModel bestSellerModelFromJson(String str) =>
//     BestSellerModel.fromJson(json.decode(str));
//
// String bestSellerModelToJson(BestSellerModel data) =>
//     json.encode(data.toJson());
//
// class BestSellerModel {
//   BestSellerModel({
//     this.result,
//     this.status,
//     this.message,
//   });
//
//   List<Result>? result;
//   int? status;
//   String? message;
//
//   factory BestSellerModel.fromJson(Map<String, dynamic> json) =>
//       BestSellerModel(
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
//         id: json["id"],
//         productName: json["ProductName"],
//         productImage: json["Product_Image"],
//         price: json["Price"],
//         discountPercentage: json["DiscountPercentage"],
//         finalPrice: json["FinalPrice"],
//         quentity: json["Quentity"],
//         productDescription: json["ProductDescription"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "ProductName": productName,
//         "Product_Image": productImage,
//         "Price": price,
//         "DiscountPercentage": discountPercentage,
//         "FinalPrice": finalPrice,
//         "Quentity": quentity,
//         "ProductDescription": productDescription,
//       };
// }
//
//



///new
// To parse this JSON data, do
//
//     final bestSellerModel = bestSellerModelFromJson(jsonString);

import 'dart:convert';

BestSellerModel bestSellerModelFromJson(String str) => BestSellerModel.fromJson(json.decode(str));

String bestSellerModelToJson(BestSellerModel data) => json.encode(data.toJson());

class BestSellerModel {
  BestSellerModel({
    required this.result,
    required this.status,
    required this.message,
  });

  List<Result> result;
  int status;
  String message;

  factory BestSellerModel.fromJson(Map<String, dynamic> json) => BestSellerModel(
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
    required this.categoryId,
    this.quentity,
    required this.price,
    this.discount,
    required this.productImage,
    required this.productDescription,
    required this.isActiveFlashSale,
    required this.isActiveBestSale,
    required this.discountPercentage,
    required this.finalPrice,
    required this.review,
  });

  int id;
  String productName;
  int categoryId;
  dynamic quentity;
  int price;
  String? discount;
  String productImage;
  String productDescription;
  bool isActiveFlashSale;
  bool isActiveBestSale;
  int discountPercentage;
  int finalPrice;
  // int review;
  double review;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["Id"],
    productName: json["ProductName"],
    categoryId: json["Category_Id"],
    quentity: json["Quentity"],
    price: json["Price"],
    discount: json["Discount"],
    productImage: json["Product_Image"],
    productDescription: json["ProductDescription"],
    isActiveFlashSale: json["IsActiveFlashSale"],
    isActiveBestSale: json["IsActiveBestSale"],
    discountPercentage: json["DiscountPercentage"],
    finalPrice: json["FinalPrice"],
    review: json["Review"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "ProductName": productName,
    "Category_Id": categoryId,
    "Quentity": quentity,
    "Price": price,
    "Discount": discount,
    "Product_Image": productImage,
    "ProductDescription": productDescription,
    "IsActiveFlashSale": isActiveFlashSale,
    "IsActiveBestSale": isActiveBestSale,
    "DiscountPercentage": discountPercentage,
    "FinalPrice": finalPrice,
    "Review": review,
  };
}
