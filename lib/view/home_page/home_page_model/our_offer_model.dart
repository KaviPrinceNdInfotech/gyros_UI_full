class ourOffer {
  List<ourOfferResult>? result;
  int? status;
  String? message;

  ourOffer({this.result, this.status, this.message});

  ourOffer.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <ourOfferResult>[];
      json['result'].forEach((v) {
        result!.add(new ourOfferResult.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class ourOfferResult {
  int? id;
  String? promotionalBannerPath;

  ourOfferResult({this.id, this.promotionalBannerPath});

  ourOfferResult.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    promotionalBannerPath = json['Promotional_BannerPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Promotional_BannerPath'] = this.promotionalBannerPath;
    return data;
  }
}
