// To parse this JSON data, do
//
//     final flashSaleProductDetailsModel = flashSaleProductDetailsModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final flashSaleProductDetailsModel = flashSaleProductDetailsModelFromJson(jsonString);

import 'dart:convert';

FlashSaleProductDetailsModel flashSaleProductDetailsModelFromJson(String str) =>
    FlashSaleProductDetailsModel.fromJson(json.decode(str));

String flashSaleProductDetailsModelToJson(FlashSaleProductDetailsModel data) =>
    json.encode(data.toJson());

class FlashSaleProductDetailsModel {
  FlashSaleProductDetailsModel({
    this.result,
    this.status,
    this.message,
  });

  List<Result>? result;
  int? status;
  String? message;

  factory FlashSaleProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      FlashSaleProductDetailsModel(
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
    this.price,
    this.discount,
    this.productImage,
    this.productDescription,
    this.multipleImage,
    this.discountPercentage,
    this.finalPrice,
    this.qty1,
    this.weight1,
    this.pkt1,
    this.weight2,
    this.pkt2,
    this.qty2,
    this.weight3,
    this.pkt3,
    this.qty5,
    this.qty3,
    this.weight4,
    this.pkt4,
    this.qty4,
    this.weight5,
    this.pkt5,
    this.price1,
    this.discountPercentage1,
    this.finalPrice1,
    this.price2,
    this.discountPercentage2,
    this.fInalPrice2,
    this.price3,
    this.discountPercentage3,
    this.finalPrice3,
    this.price4,
    this.discountPercentage4,
    this.fInalPrice4,
    this.price5,
    this.discountPercentage5,
    this.finalPrice5,
  });

  int? id;
  String? productName;
  int? price;
  String? discount;
  String? productImage;
  String? productDescription;
  List<String>? multipleImage;
  int? discountPercentage;
  int? finalPrice;
  int? qty1;
  String? weight1;
  String? pkt1;
  String? weight2;
  String? pkt2;
  int? qty2;
  dynamic? weight3;
  dynamic? pkt3;
  dynamic? qty5;
  dynamic? qty3;
  dynamic? weight4;
  dynamic? pkt4;
  dynamic? qty4;
  dynamic? weight5;
  dynamic? pkt5;
  int? price1;
  int? discountPercentage1;
  int? finalPrice1;
  int? price2;
  int? discountPercentage2;
  int? fInalPrice2;
  dynamic? price3;
  dynamic? discountPercentage3;
  dynamic? finalPrice3;
  dynamic? price4;
  dynamic? discountPercentage4;
  dynamic? fInalPrice4;
  dynamic? price5;
  dynamic? discountPercentage5;
  dynamic? finalPrice5;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["Id"],
        productName: json["ProductName"],
        price: json["Price"],
        discount: json["Discount"],
        productImage: json["Product_Image"],
        productDescription: json["ProductDescription"],
        multipleImage: List<String>.from(json["multipleImage"].map((x) => x)),
        discountPercentage: json["DiscountPercentage"],
        finalPrice: json["FinalPrice"],
        qty1: json["Qty1"],
        weight1: json["Weight1"],
        pkt1: json["Pkt1"],
        weight2: json["Weight2"],
        pkt2: json["Pkt2"],
        qty2: json["Qty2"],
        weight3: json["Weight3"],
        pkt3: json["Pkt3"],
        qty5: json["Qty5"],
        qty3: json["Qty3"],
        weight4: json["Weight4"],
        pkt4: json["Pkt4"],
        qty4: json["Qty4"],
        weight5: json["Weight5"],
        pkt5: json["Pkt5"],
        price1: json["Price1"],
        discountPercentage1: json["DiscountPercentage1"],
        finalPrice1: json["FinalPrice1"],
        price2: json["Price2"],
        discountPercentage2: json["DiscountPercentage2"],
        fInalPrice2: json["FInalPrice2"],
        price3: json["Price3"],
        discountPercentage3: json["DiscountPercentage3"],
        finalPrice3: json["FinalPrice3"],
        price4: json["Price4"],
        discountPercentage4: json["DiscountPercentage4"],
        fInalPrice4: json["FInalPrice4"],
        price5: json["Price5"],
        discountPercentage5: json["DiscountPercentage5"],
        finalPrice5: json["FinalPrice5"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ProductName": productName,
        "Price": price,
        "Discount": discount,
        "Product_Image": productImage,
        "ProductDescription": productDescription,
        "multipleImage": List<dynamic>.from(multipleImage!.map((x) => x)),
        "DiscountPercentage": discountPercentage,
        "FinalPrice": finalPrice,
        "Qty1": qty1,
        "Weight1": weight1,
        "Pkt1": pkt1,
        "Weight2": weight2,
        "Pkt2": pkt2,
        "Qty2": qty2,
        "Weight3": weight3,
        "Pkt3": pkt3,
        "Qty5": qty5,
        "Qty3": qty3,
        "Weight4": weight4,
        "Pkt4": pkt4,
        "Qty4": qty4,
        "Weight5": weight5,
        "Pkt5": pkt5,
        "Price1": price1,
        "DiscountPercentage1": discountPercentage1,
        "FinalPrice1": finalPrice1,
        "Price2": price2,
        "DiscountPercentage2": discountPercentage2,
        "FInalPrice2": fInalPrice2,
        "Price3": price3,
        "DiscountPercentage3": discountPercentage3,
        "FinalPrice3": finalPrice3,
        "Price4": price4,
        "DiscountPercentage4": discountPercentage4,
        "FInalPrice4": fInalPrice4,
        "Price5": price5,
        "DiscountPercentage5": discountPercentage5,
        "FinalPrice5": finalPrice5,
      };
}

/// this is model it is developed without json to and it will show the miltiple index by the abhishek bhaiya.
// import 'dart:convert';
//
// FlashSaleProductDetailsModel flashSaleProductDetailsModelFromJson(String str) =>
//     FlashSaleProductDetailsModel.fromJson(json.decode(str));
//
// String flashSaleProductDetailsModelToJson(FlashSaleProductDetailsModel data) =>
//     json.encode(data.toJson());
//
// class FlashSaleProductDetailsModel {
//   FlashSaleProductDetailsModel({
//     this.result,
//     this.status,
//     this.message,
//   });
//
//   List<Result>? result;
//   int? status;
//   String? message;
//
//   factory FlashSaleProductDetailsModel.fromJson(Map<String, dynamic> json) =>
//       FlashSaleProductDetailsModel(
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
//     this.price,
//     this.discount,
//     this.productImage,
//     this.productDescription,
//     this.multipleImage,
//     this.qty1,
//     this.weight1,
//     this.pkt1,
//   });
//
//   int? id;
//   String? productName;
//   int? price;
//   String? discount;
//   String? productImage;
//   String? productDescription;
//   List<String>? multipleImage;
//   int? qty1;
//   String? weight1;
//   String? pkt1;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         id: json["Id"],
//         productName: json["ProductName"],
//         price: json["Price"],
//         discount: json["Discount"],
//         productImage: json["Product_Image"],
//         productDescription: json["ProductDescription"],
//         multipleImage: List<String>.from(json["multipleImage"].map((x) => x)),
//         qty1: json["Qty1"],
//         weight1: json["Weight1"],
//         pkt1: json["Pkt1"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "ProductName": productName,
//         "Price": price,
//         "Discount": discount,
//         "Product_Image": productImage,
//         "ProductDescription": productDescription,
//         "multipleImage": List<dynamic>.from(multipleImage!.map((x) => x)),
//         "Qty1": qty1,
//         "Weight1": weight1,
//         "Pkt1": pkt1,
//       };
// }

///.........old model......
// import 'dart:convert';
//
// FlashSaleProductDetailsModel flashSaleProductDetailsModelFromJson(String str) =>
//     FlashSaleProductDetailsModel.fromJson(json.decode(str));
//
// String flashSaleProductDetailsModelToJson(FlashSaleProductDetailsModel data) =>
//     json.encode(data.toJson());
//
// class FlashSaleProductDetailsModel {
//   FlashSaleProductDetailsModel({
//     this.result,
//     this.status,
//     this.message,
//   });
//
//   List<Result>? result;
//   int? status;
//   String? message;
//
//   factory FlashSaleProductDetailsModel.fromJson(Map<String, dynamic> json) =>
//       FlashSaleProductDetailsModel(
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
//     this.price,
//     this.productImage,
//     this.discount,
//     this.weight1,
//     this.pkt1,
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
//   dynamic sellerOption;
//   int? qty1;
//   String? productDescription;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         id: json["Id"],
//         productName: json["ProductName"],
//         price: json["Price"],
//         productImage: json["Product_Image"],
//         discount: json["Discount"],
//         weight1: json["Weight1"],
//         pkt1: json["Pkt1"],
//         sellerOption: json["SellerOption"],
//         qty1: json["Qty1"],
//         productDescription: json["ProductDescription"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "ProductName": productName,
//         "Price": price,
//         "Product_Image": productImage,
//         "Discount": discount,
//         "Weight1": weight1,
//         "Pkt1": pkt1,
//         "SellerOption": sellerOption,
//         "Qty1": qty1,
//         "ProductDescription": productDescription,
//       };
// }
