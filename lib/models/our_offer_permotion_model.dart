// To parse this JSON data, do
//
//     final ourOfferPromotionList = ourOfferPromotionListFromJson(jsonString);

import 'dart:convert';

OurOfferPromotionList ourOfferPromotionListFromJson(String str) =>
    OurOfferPromotionList.fromJson(json.decode(str));

String ourOfferPromotionListToJson(OurOfferPromotionList data) =>
    json.encode(data.toJson());

class OurOfferPromotionList {
  OurOfferPromotionList({
    this.result,
    this.status,
    this.message,
  });

  List<Result>? result;
  int? status;
  String? message;

  factory OurOfferPromotionList.fromJson(Map<String, dynamic> json) =>
      OurOfferPromotionList(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Result {
  Result({
    this.id,
    this.promotionalBannerPath,
  });

  int? id;
  String? promotionalBannerPath;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["Id"],
        promotionalBannerPath: json["Promotional_BannerPath"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Promotional_BannerPath": promotionalBannerPath,
      };
}
