//
//
// import 'dart:convert';
//
// CartListModel cartListModelFromJson(String str) => CartListModel.fromJson(json.decode(str));
//
// String cartListModelToJson(CartListModel data) => json.encode(data.toJson());
//
// class CartListModel {
//   CartListModel({
//     required this.result,
//     required this.totalPrice,
//     required this.totalItem,
//     required this.status,
//     required this.message,
//   });
//
//   List<Result> result;
//   int totalPrice;
//   int totalItem;
//   int status;
//   String message;
//
//   factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
//     result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
//     totalPrice: json["TotalPrice"],
//     totalItem: json["TotalItem"],
//     status: json["status"],
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "result": List<dynamic>.from(result.map((x) => x.toJson())),
//     "TotalPrice": totalPrice,
//     "TotalItem": totalItem,
//     "status": status,
//     "message": message,
//   };
// }
//
// class Result {
//   Result({
//     required this.id,
//     required this.productName,
//     required this.categoryName,
//     required this.image,
//     required this.weight,
//     required this.matrix,
//     required this.qty,
//     required this.userId,
//     required this.createDate,
//     required this.price,
//     required this.finalAmount,
//     required this.count,
//   });
//
//   int id;
//   String productName;
//   String categoryName;
//   String image;
//   String weight;
//   String matrix;
//   String qty;
//   int userId;
//   DateTime createDate;
//   String price;
//   double finalAmount;
//   int count;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     id: json["Id"],
//     productName: json["ProductName"],
//     categoryName: json["CategoryName"],
//     image: json["Image"],
//     weight: json["Weight"],
//     matrix: json["Matrix"],
//     qty: json["Qty"],
//     userId: json["UserId"],
//     createDate: DateTime.parse(json["CreateDate"]),
//     price: json["Price"],
//     finalAmount: json["FinalAmount"],
//     count: json["Count"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "ProductName": productName,
//     "CategoryName": categoryName,
//     "Image": image,
//     "Weight": weight,
//     "Matrix": matrix,
//     "Qty": qty,
//     "UserId": userId,
//     "CreateDate": createDate.toIso8601String(),
//     "Price": price,
//     "FinalAmount": finalAmount,
//     "Count": count,
//   };
// }
//

///New model after add item count
// To parse this JSON data, do
//
//     final cartListModel = cartListModelFromJson(jsonString);

import 'dart:convert';

CartListModel cartListModelFromJson(String str) => CartListModel.fromJson(json.decode(str));

String cartListModelToJson(CartListModel data) => json.encode(data.toJson());

class CartListModel {
  CartListModel({
    required this.result,
    required this.totalPrice,
    required this.totalItem,
    required this.status,
    required this.message,
  });

  List<Result> result;
  int totalPrice;
  int totalItem;
  int status;
  String message;

  factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    totalPrice: json["TotalPrice"],
    totalItem: json["TotalItem"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
    "TotalPrice": totalPrice,
    "TotalItem": totalItem,
    "status": status,
    "message": message,
  };
}

class Result {
  Result({
    required this.id,
    required this.productName,
    required this.categoryName,
    required this.image,
    required this.weight,
    required this.matrix,
    required this.qty,
    required this.userId,
    required this.createDate,
    required this.price,
    required this.finalAmount,
    required this.count,
  });

  int id;
  String productName;
  String categoryName;
  String image;
  String weight;
  String matrix;
  String qty;
  int userId;
  DateTime createDate;
  String price;
  double finalAmount;
  int count;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["Id"],
    productName: json["ProductName"],
    categoryName: json["CategoryName"],
    image: json["Image"],
    weight: json["Weight"],
    matrix: json["Matrix"],
    qty: json["Qty"],
    userId: json["UserId"],
    createDate: DateTime.parse(json["CreateDate"]),
    price: json["Price"],
    finalAmount: json["FinalAmount"],
    count: json["Count"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "ProductName": productName,
    "CategoryName": categoryName,
    "Image": image,
    "Weight": weight,
    "Matrix": matrix,
    "Qty": qty,
    "UserId": userId,
    "CreateDate": createDate.toIso8601String(),
    "Price": price,
    "FinalAmount": finalAmount,
    "Count": count,
  };
}
