// To parse this JSON data, do
//
//     final firstOrderBanner = firstOrderBannerFromJson(jsonString);

import 'dart:convert';

FirstOrderBanner firstOrderBannerFromJson(String str) =>
    FirstOrderBanner.fromJson(json.decode(str));

String firstOrderBannerToJson(FirstOrderBanner data) =>
    json.encode(data.toJson());

class FirstOrderBanner {
  FirstOrderBanner({
    required this.result,
    required this.status,
    required this.message,
  });

  List<Result> result;
  int status;
  String message;

  factory FirstOrderBanner.fromJson(Map<String, dynamic> json) =>
      FirstOrderBanner(
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
    required this.imagePath,
  });

  int id;
  String imagePath;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["Id"],
        imagePath: json["ImagePath"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ImagePath": imagePath,
      };
}
