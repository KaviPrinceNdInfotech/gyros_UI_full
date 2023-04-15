// To parse this JSON data, do
//
//     final getProductReview = getProductReviewFromJson(jsonString);

import 'dart:convert';

GetProductReview getProductReviewFromJson(String str) => GetProductReview.fromJson(json.decode(str));

String getProductReviewToJson(GetProductReview data) => json.encode(data.toJson());

class GetProductReview {
  GetProductReview({
    required this.result,
    required this.status,
    required this.message,
  });

  List<Result> result;
  int status;
  String message;

  factory GetProductReview.fromJson(Map<String, dynamic> json) => GetProductReview(
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
    required this.name,
    required this.description,
    this.mobile,
    required this.email,
    required this.title,
    required this.image,
    required this.productId,
    required this.rating1,
    required this.rating2,
    required this.rating3,
    required this.rating4,
    required this.rating5,
    this.imagePathNew,
    this.imagePath,
  });

  int id;
  String name;
  String description;
  String? mobile;
  String email;
  String title;
  String image;
  int productId;
  int rating1;
  int rating2;
  int rating3;
  int rating4;
  int rating5;
  dynamic imagePathNew;
  dynamic imagePath;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["Id"],
    name: json["Name"],
    description: json["Description"],
    mobile: json["Mobile"],
    email: json["Email"],
    title: json["Title"],
    image: json["Image"],
    productId: json["ProductId"],
    rating1: json["Rating1"],
    rating2: json["Rating2"],
    rating3: json["Rating3"],
    rating4: json["Rating4"],
    rating5: json["Rating5"],
    imagePathNew: json["ImagePathNew"],
    imagePath: json["ImagePath"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Description": description,
    "Mobile": mobile,
    "Email": email,
    "Title": title,
    "Image": image,
    "ProductId": productId,
    "Rating1": rating1,
    "Rating2": rating2,
    "Rating3": rating3,
    "Rating4": rating4,
    "Rating5": rating5,
    "ImagePathNew": imagePathNew,
    "ImagePath": imagePath,
  };
}
