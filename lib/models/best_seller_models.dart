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
    required this.price,
    required this.productImage,
    this.discount,
    this.weight1,
    required this.pkt1,
    required this.discountPercentage,
    required this.finalPrice,
   // this.sellerOption,
    required this.qty1,
    //this.productDescription,
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
 // dynamic sellerOption;
  int qty1;
  //dynamic productDescription;
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
    //sellerOption: json["SellerOption"],
    qty1: json["Qty1"],
    //productDescription: json["ProductDescription"],
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
    //"SellerOption": sellerOption,
    "Qty1": qty1,
    //"ProductDescription": productDescription,
    "Rating": rating,
  };
}
