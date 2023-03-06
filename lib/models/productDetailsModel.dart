// To parse this JSON data, do
//
//     final getProductDetailModel = getProductDetailModelFromJson(jsonString);

import 'dart:convert';

GetProductDetailModel getProductDetailModelFromJson(String str) =>
    GetProductDetailModel.fromJson(json.decode(str));

String getProductDetailModelToJson(GetProductDetailModel data) =>
    json.encode(data.toJson());

class GetProductDetailModel {
  GetProductDetailModel({
    required this.result,
    required this.status,
    required this.message,
  });

  List<Result> result;
  int status;
  String message;

  factory GetProductDetailModel.fromJson(Map<String, dynamic> json) =>
      GetProductDetailModel(
        result:
        List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
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
    required this.discount,
    required this.productImage,
    required this.productDescription,
    required this.multipleImage,
    required this.discountPercentage,
    required this.finalPrice,
    required this.qty1,
    required this.weight1,
    required this.pkt1,
    required this.weight2,
    required this.pkt2,
    required this.qty2,
    required this.weight3,
    required this.pkt3,
    required this.qty5,
    required this.qty3,
    required this.weight4,
    required this.pkt4,
    required this.qty4,
    required this.weight5,
    required this.pkt5,
    required this.price1,
    required this.discountPercentage1,
    required this.finalPrice1,
    required this.price2,
    required this.discountPercentage2,
    required this.fInalPrice2,
    required this.price3,
    required this.discountPercentage3,
    required this.finalPrice3,
    required this.price4,
    required this.discountPercentage4,
    required this.fInalPrice4,
    required this.price5,
    required this.discountPercentage5,
    required this.finalPrice5,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
  });

  int id;
  String productName;
  int price;
  String discount;
  String productImage;
  String productDescription;
  List<String> multipleImage;
  int discountPercentage;
  int finalPrice;
  int qty1;
  dynamic weight1;
  String pkt1;
  dynamic weight2;
  String pkt2;
  int qty2;
  dynamic weight3;
  String pkt3;
  int qty5;
  int qty3;
  dynamic weight4;
  String pkt4;
  int qty4;
  dynamic weight5;
  String pkt5;
  int price1;
  int discountPercentage1;
  int finalPrice1;
  int price2;
  int discountPercentage2;
  int fInalPrice2;
  int price3;
  int discountPercentage3;
  int finalPrice3;
  int price4;
  int discountPercentage4;
  int fInalPrice4;
  int price5;
  int discountPercentage5;
  int finalPrice5;
  dynamic image1;
  dynamic image2;
  dynamic image3;
  dynamic image4;
  dynamic image5;

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
    image1: json["Image1"],
    image2: json["Image2"],
    image3: json["Image3"],
    image4: json["Image4"],
    image5: json["Image5"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "ProductName": productName,
    "Price": price,
    "Discount": discount,
    "Product_Image": productImage,
    "ProductDescription": productDescription,
    "multipleImage": List<dynamic>.from(multipleImage.map((x) => x)),
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
    "Image1": image1,
    "Image2": image2,
    "Image3": image3,
    "Image4": image4,
    "Image5": image5,
  };
}
