// // To parse this JSON data, do
// //
// //     final flashSellListProduct = flashSellListProductFromJson(jsonString);
//
// import 'dart:convert';
//
// FlashSellListProduct flashSellListProductFromJson(String str) =>
//     FlashSellListProduct.fromJson(json.decode(str));
//
// String flashSellListProductToJson(FlashSellListProduct data) =>
//     json.encode(data.toJson());
//
// class FlashSellListProduct {
//   FlashSellListProduct({
//     this.result,
//     this.status,
//     this.message,
//   });
//
//   List<Result>? result;
//   int? status;
//   String? message;
//
//   factory FlashSellListProduct.fromJson(Map<String, dynamic> json) =>
//       FlashSellListProduct(
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
//     this.price,
//     this.productImage,
//     this.discount,
//     this.weight1,
//     this.pkt1,
//     this.discountPercentage,
//     this.finalPrice,
//     this.sellerOption,
//     this.qty1,
//     this.productDescription,
//   });
//
//   int? id;
//   String? productName;
//   int? price;
//   String? productImage;
//   String? discount;
//   String? weight1;
//   String? pkt1;
//   int? discountPercentage;
//   int? finalPrice;
//   dynamic? sellerOption;
//   int? qty1;
//   dynamic? productDescription;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         id: json["Id"] == null ? null : json["Id"],
//         productName: json["ProductName"] == null ? null : json["ProductName"],
//         price: json["Price"] == null ? null : json["Price"],
//         productImage:
//             json["Product_Image"] == null ? null : json["Product_Image"],
//         discount: json["Discount"] == null ? null : json["Discount"],
//         weight1: json["Weight1"] == null ? null : json["Weight1"],
//         pkt1: json["Pkt1"] == null ? null : json["Pkt1"],
//         discountPercentage: json["DiscountPercentage"] == null
//             ? null
//             : json["DiscountPercentage"],
//         finalPrice: json["FinalPrice"] == null ? null : json["FinalPrice"],
//         sellerOption: json["SellerOption"],
//         qty1: json["Qty1"] == null ? null : json["Qty1"],
//         productDescription: json["ProductDescription"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id == null ? null : id,
//         "ProductName": productName == null ? null : productName,
//         "Price": price == null ? null : price,
//         "Product_Image": productImage == null ? null : productImage,
//         "Discount": discount == null ? null : discount,
//         "Weight1": weight1 == null ? null : weight1,
//         "Pkt1": pkt1 == null ? null : pkt1,
//         "DiscountPercentage":
//             discountPercentage == null ? null : discountPercentage,
//         "FinalPrice": finalPrice == null ? null : finalPrice,
//         "SellerOption": sellerOption,
//         "Qty1": qty1 == null ? null : qty1,
//         "ProductDescription": productDescription,
//       };
// }
//







///New
// To parse this JSON data, do
//
//     final flashSellListProduct = flashSellListProductFromJson(jsonString);

import 'dart:convert';

FlashSellListProduct flashSellListProductFromJson(String str) => FlashSellListProduct.fromJson(json.decode(str));

String flashSellListProductToJson(FlashSellListProduct data) => json.encode(data.toJson());

class FlashSellListProduct {
  FlashSellListProduct({
    required this.result,
    required this.status,
    required this.message,
  });

  List<Result> result;
  int status;
  String message;

  factory FlashSellListProduct.fromJson(Map<String, dynamic> json) => FlashSellListProduct(
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
 double? rating;
  // int id;
  // String productName;
  // double price;
  // String productImage;
  // String? discount;
  // String? weight1;
  // String pkt1;
  // double discountPercentage;
  // double finalPrice;
  // dynamic sellerOption;
  // double qty1;
  // dynamic productDescription;
  // double rating;

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
