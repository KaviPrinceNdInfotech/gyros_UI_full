// // To parse this JSON data, do
// //
// //     final getCoupan = getCoupanFromJson(jsonString);
//
// import 'dart:convert';
//
// GetCoupan getCoupanFromJson(String str) => GetCoupan.fromJson(json.decode(str));
//
// String getCoupanToJson(GetCoupan data) => json.encode(data.toJson());
//
// class GetCoupan {
//   GetCoupan({
//     this.result,
//     this.status,
//     this.message,
//   });
//
//   List<Result>? result;
//   int? status;
//   String? message;
//
//   factory GetCoupan.fromJson(Map<String, dynamic> json) => GetCoupan(
//     result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
//     status: json["status"],
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "result": List<dynamic>.from(result!.map((x) => x.toJson())),
//     "status": status,
//     "message": message,
//   };
// }
//
// class Result {
//   Result({
//     this.id,
//     this.couponCode,
//     this.flat,
//     this.amount,
//     this.name,
//     this.minimumAmount,
//     this.maximumAmount,
//   });
//
//   int? id;
//   String? couponCode;
//   dynamic flat;
//   String? amount;
//   String? name;
//   int? minimumAmount;
//   int? maximumAmount;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     id: json["Id"],
//     couponCode: json["CouponCode"],
//     flat: json["Flat"],
//     amount: json["Amount"],
//     name: json["Name"],
//     minimumAmount: json["MinimumAmount"],
//     maximumAmount: json["MaximumAmount"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "CouponCode": couponCode,
//     "Flat": flat,
//     "Amount": amount,
//     "Name": name,
//     "MinimumAmount": minimumAmount,
//     "MaximumAmount": maximumAmount,
//   };
// }


// To parse this JSON data, do
//
//     final getCoupan = getCoupanFromJson(jsonString);

import 'dart:convert';

GetCoupan getCoupanFromJson(String str) => GetCoupan.fromJson(json.decode(str));

String getCoupanToJson(GetCoupan data) => json.encode(data.toJson());

class GetCoupan {
  GetCoupan({
    required this.result,
    required this.status,
    required this.message,
  });

  List<Result> result;
  int status;
  String message;

  factory GetCoupan.fromJson(Map<String, dynamic> json) => GetCoupan(
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
    required this.couponCode,
    required this.amount,
    required this.name,
    required this.minimumAmount,
    required this.maximumAmount,
  });

  int id;
  String couponCode;
  String amount;
  String name;
  // int minimumAmount;
  // int maximumAmount;
  double minimumAmount;
  double maximumAmount;
  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["Id"],
    couponCode: json["CouponCode"],
    amount: json["Amount"],
    name: json["Name"],
    minimumAmount: json["MinimumAmount"],
    maximumAmount: json["MaximumAmount"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "CouponCode": couponCode,
    "Amount": amount,
    "Name": name,
    "MinimumAmount": minimumAmount,
    "MaximumAmount": maximumAmount,
  };
}
