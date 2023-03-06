// To parse this JSON data, do
//
//     final ProductDetailsModel = ProductDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel ProductDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String ProductDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    required this.productModelApi,
    required this.status,
    required this.message,
  });

  ProductModelApi productModelApi;
  int status;
  String message;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        productModelApi: ProductModelApi.fromJson(json["ProductModelApi"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "ProductModelApi": productModelApi.toJson(),
        "status": status,
        "message": message,
      };
}

class ProductModelApi {
  ProductModelApi({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.productDescription,
    required this.multipleImage,
    required this.packetSizemodel,
  });

  int id;
  String productName;
  String productImage;
  String productDescription;
  List<String> multipleImage;
  List<PacketSizemodel> packetSizemodel;

  factory ProductModelApi.fromJson(Map<String, dynamic> json) =>
      ProductModelApi(
        id: json["Id"],
        productName: json["ProductName"],
        productImage: json["Product_Image"],
        productDescription: json["ProductDescription"],
        multipleImage: List<String>.from(json["multipleImage"].map((x) => x)),
        packetSizemodel: List<PacketSizemodel>.from(
            json["packetSizemodel"].map((x) => PacketSizemodel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ProductName": productName,
        "Product_Image": productImage,
        "ProductDescription": productDescription,
        "multipleImage": List<dynamic>.from(multipleImage.map((x) => x)),
        "packetSizemodel":
            List<dynamic>.from(packetSizemodel.map((x) => x.toJson())),
      };
}

class PacketSizemodel {
  PacketSizemodel({
    required this.pkt,
    required this.qty,
    required this.price,
    required this.discountPercentage,
    required this.finalPrice,
    required this.image,
  });

  String pkt;
  int qty;
  int price;
  int discountPercentage;
  int finalPrice;
  String image;

  factory PacketSizemodel.fromJson(Map<String, dynamic> json) =>
      PacketSizemodel(
        pkt: json["Pkt"],
        qty: json["Qty"],
        price: json["Price"],
        discountPercentage: json["DiscountPercentage"],
        finalPrice: json["FinalPrice"],
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "Pkt": pkt,
        "Qty": qty,
        "Price": price,
        "DiscountPercentage": discountPercentage,
        "FinalPrice": finalPrice,
        "Image": image,
      };
}
