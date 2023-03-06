// To parse this JSON data, do
//
//     final newModel = newModelFromJson(jsonString);

import 'dart:convert';

NewModel? newModelFromJson(String str) => NewModel.fromJson(json.decode(str));

String newModelToJson(NewModel? data) => json.encode(data!.toJson());

class NewModel {
  NewModel({
    this.productModelApi,
    this.status,
    this.message,
  });

  ProductModelApi? productModelApi;
  int? status;
  String? message;

  factory NewModel.fromJson(Map<String, dynamic> json) => NewModel(
    productModelApi: ProductModelApi.fromJson(json["ProductModelApi"]),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "ProductModelApi": productModelApi!.toJson(),
    "status": status,
    "message": message,
  };
}

class ProductModelApi {
  ProductModelApi({
    this.id,
    this.productName,
    this.productImage,
    this.productDescription,
    this.multipleImage,
    this.packetSizemodel,
  });

  int? id;
  String? productName;
  String? productImage;
  String? productDescription;
  List<String?>? multipleImage;
  List<PacketSizemodel?>? packetSizemodel;

  factory ProductModelApi.fromJson(Map<String, dynamic> json) => ProductModelApi(
    id: json["Id"],
    productName: json["ProductName"],
    productImage: json["Product_Image"],
    productDescription: json["ProductDescription"],
    multipleImage: json["multipleImage"] == null ? [] : List<String?>.from(json["multipleImage"]!.map((x) => x)),
    packetSizemodel: json["packetSizemodel"] == null ? [] : List<PacketSizemodel?>.from(json["packetSizemodel"]!.map((x) => PacketSizemodel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "ProductName": productName,
    "Product_Image": productImage,
    "ProductDescription": productDescription,
    "multipleImage": multipleImage == null ? [] : List<dynamic>.from(multipleImage!.map((x) => x)),
    "packetSizemodel": packetSizemodel == null ? [] : List<dynamic>.from(packetSizemodel!.map((x) => x!.toJson())),
  };
}

class PacketSizemodel {
  PacketSizemodel({
    this.pkt,
    this.qty,
    this.price,
    this.discountPercentage,
    this.finalPrice,
    this.image,
  });

  String? pkt;
  int? qty;
  int? price;
  int? discountPercentage;
  int? finalPrice;
  String? image;

  factory PacketSizemodel.fromJson(Map<String, dynamic> json) => PacketSizemodel(
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
