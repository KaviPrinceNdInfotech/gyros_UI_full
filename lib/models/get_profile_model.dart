// To parse this JSON data, do
//
//     final getprofileModel = getprofileModelFromJson(jsonString);

import 'dart:convert';

GetprofileModel getprofileModelFromJson(String str) =>
    GetprofileModel.fromJson(json.decode(str));

String getprofileModelToJson(GetprofileModel data) =>
    json.encode(data.toJson());

class GetprofileModel {
  GetprofileModel({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  Result? result;

  factory GetprofileModel.fromJson(Map<String, dynamic> json) =>
      GetprofileModel(
        status: json["status"],
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": result!.toJson(),
      };
}

class Result {
  Result({
    this.id,
    this.name,
    this.mobileNo,
    this.emailId,
    this.password,
    this.roleId,
    this.otp,
    this.token,
    this.emailOtp,
    this.rgx,
  });

  int? id;
  String? name;
  String? mobileNo;
  String? emailId;
  String? password;
  int? roleId;
  dynamic? otp;
  dynamic? token;
  dynamic? emailOtp;
  String? rgx;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["Id"],
        name: json["Name"],
        mobileNo: json["Mobile_No"],
        emailId: json["Email_Id"],
        password: json["Password"],
        roleId: json["Role_Id"],
        otp: json["OTP"],
        token: json["Token"],
        emailOtp: json["Email_OTP"],
        rgx: json["Rgx"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Mobile_No": mobileNo,
        "Email_Id": emailId,
        "Password": password,
        "Role_Id": roleId,
        "OTP": otp,
        "Token": token,
        "Email_OTP": emailOtp,
        "Rgx": rgx,
      };
}
