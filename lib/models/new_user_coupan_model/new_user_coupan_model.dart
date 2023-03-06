// To parse this JSON data, do
//
//     final getCoupanCode = getCoupanCodeFromJson(jsonString);

import 'dart:convert';

GetCoupanCode getCoupanCodeFromJson(String str) => GetCoupanCode.fromJson(json.decode(str));

String getCoupanCodeToJson(GetCoupanCode data) => json.encode(data.toJson());

class GetCoupanCode {
  GetCoupanCode({
    this.result,
    this.message,
    this.status,
  });

  List<Result>? result;
  String? message;
  int? status;

  factory GetCoupanCode.fromJson(Map<String, dynamic> json) => GetCoupanCode(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "message": message,
    "status": status,
  };
}

class Result {
  Result({
    this.id,
    this.name,
    this.coupon,
    this.couponCode,
  });

  int? id;
  String? name;
  String? coupon;
  String? couponCode;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["Id"],
    name: json["Name"],
    coupon: json["Coupon"],
    couponCode: json["CouponCode"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Coupon": coupon,
    "CouponCode": couponCode,
  };
}
