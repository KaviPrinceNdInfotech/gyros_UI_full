import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gyros_app/models/all_product_model.dart';
import 'package:gyros_app/models/blog_model.dart';
import 'package:gyros_app/models/catagary_list_model.dart';
import 'package:gyros_app/models/checkout_address_model.dart';
import 'package:gyros_app/models/checkout_model.dart';
import 'package:gyros_app/models/contact_us_model.dart';
import 'package:gyros_app/models/first_purchase_banner_home_model.dart';
import 'package:gyros_app/models/flash_product_descriptions_model.dart';
import 'package:gyros_app/models/flash_sall_list_product_model.dart';
import 'package:gyros_app/models/gift_box_model.dart';
import 'package:gyros_app/models/invoice_model/invoice_model.dart';
import 'package:gyros_app/models/list_of_cart_model_api.dart';
//import 'package:gyros_app/models/newProductModel.dart';
import 'package:gyros_app/models/no_of_cart_item_model.dart';
import 'package:gyros_app/models/order_history_model.dart';
import 'package:gyros_app/models/privecy_policy_model.dart';
import 'package:gyros_app/models/product_detail_new_model.dart';
import 'package:gyros_app/models/refund_policy_model.dart';
import 'package:gyros_app/models/shipping_policy_model.dart';
import 'package:gyros_app/models/slider_banner_models.dart';
import 'package:gyros_app/models/sub_cat_by_id_model.dart';
import 'package:gyros_app/storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../getProductModel.dart';
import '../models/about_the_product_model.dart';
import '../models/all_address_list_model.dart';
import '../models/best_seller_models.dart';

import '../models/get_coupan_model.dart';
import '../models/get_profile_model.dart';

import '../models/invoice_model/invoice_model.dart';
import '../models/invoice_model/invoice_model.dart';
import '../models/new_user_coupan_model/new_user_coupan_model.dart';
import '../models/our_offer_permotion_model.dart';
import '../models/our_story_model.dart';
import '../models/productDetailsModel.dart';
import '../models/stand_out_model.dart';
import '../models/tried_model.dart';
import '../models/wallet_model/wallet_model.dart';
import '../widgets/circular_loader.dart';

class ApiProvider {
  static var baseUrl = 'https://api.gyros.farm/';
  static String token = '';
  static String Token = '';
  static String categoryid = '';
  static String catid = '';
  static String productid = '';
  static String orderid = '';
  static String Id = ''.toString();
  static String coupan1 = ''.toString();
  //coupanfirst
  static String coupanfirst = ''.toString();
  static String amount = ''.toString();
  static String Companycoupon = '';
  static String prodid = '';
  static String cartlistid = '';
  static String addressid = '';
  static String Message = "";
  static String prodId = '';
  static String PrdId = '';
  static String Invoice = ''.toString();
  static String invoiceget = ''.toString();
  static String code = ''.toString();
  static String coupanget = ''.toString();
  //coupanget
final box = GetStorage();

  ///TODO: here we have to add different api in this page...........

  /// Add to cart Api--///
  static addtoCart(var productId, var pkt, var qty, var count, var price,
      var finalamnt) async {
    try {
      var url = baseUrl + 'api/ProductApi/AddToCartV1/$productId';
      var headers = {
        'Authorization': 'Bearer $token',
      };

      var body = {
        "Id": Id,
        "Pkt": "$pkt",
        "Qty": "$qty",
        "Price": "$price",
        "Count": "$count",
        "FinalAmount": "$finalamnt"
      };
      print(body);
      print(headers);

      http.Response r =
      await http.post(Uri.parse(url), body: body, headers: headers);

      print(r.body);
      print(r.statusCode);
      if (r.statusCode == 200) {
        return r;
      } else {
        Get.snackbar('Failed', "Can't add to cart");
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  //sign up  Api gyros  gyros Api 1........................................................
  static signUpApi(
      var Name,
      var Mobile_No,
      var Email_Id,
      var PassWord,
      var ConfirmPassWord,
      ) async {
    try {
      var url = baseUrl + 'api/AdminApi/Registration';

      var body = {
        "Name": Name,
        "Mobile_No": Mobile_No,
        "Email_Id": Email_Id,
        "PassWord": PassWord,
        "ConfirmPassWord": ConfirmPassWord,
      };
      print(body);
      http.Response r = await http.post(
        Uri.parse(url),
        body: body,
      );
      print(r.body);
      if (r.statusCode == 200) {
        return r;
      } else {
        Get.snackbar('Error', 'SignUp Fail');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  ///

  static PhoneEmailApi(
      var MobileOrEmail,
      ) async {
    var url = baseUrl + 'api/AdminApi/LoginMobileOrEmail';
    var body = {
      "MobileOrEmail": MobileOrEmail,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///TODO: otp new section.................................
  ///
  // from here verify otp.........................................

  static verifyOTP(var MobileOrEmail, var Otp) async {
    var url = baseUrl + 'api/AdminApi/MobileOrEmailOtpVerify';
    var body = {
      'number': "$MobileOrEmail",
      'otp': "$Otp",
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      prefs.write("Id".toString(), json.decode(r.body)['Id']);
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      //saved token.........
      prefs.write("token".toString(), json.decode(r.body)['token']);
      token = prefs.read("token").toString();
      print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }

  }

  //login with email api gyros api 2..................................

  static LoginEmailApi(
      var Email,
      var PassWord,
      ) async {
    var url = baseUrl + 'api/AdminApi/LoginWithEmail';

    var body = {
      "Email": Email,
      "PassWord": PassWord,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      prefs.write("Id".toString(), json.decode(r.body)['Id']);
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      //saved token.........
      prefs.write("token".toString(), json.decode(r.body)['token']);
      token = prefs.read("token").toString();
      print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  //login with email api gyros api 3..................................

  static OtpApi(var Otp, var MobileOrEmail) async {
    var url = baseUrl + 'api/AdminApi/MobileOrEmailOtpVerify';

    var body = {"Otp": "$Otp", "MobileOrEmail": "$MobileOrEmail"};
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      prefs.write("Id".toString(), json.decode(r.body)['Id']);
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      //saved token.........
      prefs.write("token".toString(), json.decode(r.body)['token']);
      token = prefs.read("token").toString();
      print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  /// refresh login token...........

  // else if(response.statusCode == 401){
  // //refresh token and call getUser again
  // final response = http.post(Uri.https(BASE_URL, '/api/[YourAuthorizationEndpoint]'),
  // headers: {'grant_type': 'refresh_token', 'refresh_token': '$refresh_token'});
  // token = jsonDecode(response.body)['token'];
  // refresh_token = jsonDecode(response.body)['refresh_token'];
  // return getUser();
  // }
  //catagary list api gyros  api 3.....................

  ///TODO: phone email verification.............
  ///
  //login with email api gyros api 2..................................

  // static PhoneEmailApi(
  //   var MobileOrEmail,
  // ) async {
  //   var url = baseUrl + 'api/AdminApi/LoginMobileOrEmail';
  //
  //   var body = {
  //     "MobileOrEmail": MobileOrEmail,
  //   };
  //   print(body);
  //   http.Response r = await http.post(
  //     Uri.parse(url), body: body,
  //     //headers: headers
  //   );
  //   print(r.body);
  //   if (r.statusCode == 200) {
  //     var prefs = GetStorage();
  //     //saved id..........
  //     prefs.write("Id".toString(), json.decode(r.body)['Id']);
  //     Id = prefs.read("Id").toString();
  //     print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
  //
  //     //saved token.........
  //     // prefs.write("token".toString(), json.decode(r.body)['token']);
  //     // token = prefs.read("token").toString();
  //     // print(token);
  //     return r;
  //   } else if (r.statusCode == 401) {
  //     Get.snackbar('message', r.body);
  //   } else {
  //     Get.snackbar('Error', r.body);
  //     return r;
  //   }
  // }

  //

  //login with mobile api new 3..................

  // static userloginApi(var userIdentifier) async {
  //   var url = baseUrl + 'user/login';
  //
  //   var body = {
  //     "userIdentifier": userIdentifier,
  //   };
  //   http.Response r = await http.post(Uri.parse(url), body: body,);
  //   print(r.body);
  //   if (r.statusCode == 200) {
  //     return r;
  //   }
  //   else {
  //     Get.snackbar('Error', 'Details');
  //     return r;
  //   }
  // }
  //
  // //from login mobile otp. new 4.................
  ///....................................................
  // static verifyphoneotp(var userIdentifier, var otp) async {
  //   var url = baseUrl + 'user/login-otp-verification';
  //
  //   var body = {
  //     "userIdentifier": "$userIdentifier",
  //     "otp": "$otp",
  //   };
  //   print(body);
  //   http.Response r = await http.post(Uri.parse(url), body: body,);
  //   print(r.body);
  //   if (r.statusCode == 200) {
  //     var prefs = GetStorage();
  //     prefs.write(
  //         "token", json.decode(r.body)['data']['loginToken']);
  //     token = prefs.read("token");
  //     print(token);
  //     return r;
  //   }
  //   else {
  //     Get.snackbar('Error', 'OTP');
  //     return r;
  //   }
  // }
  ///gyros
  static AllcatagaryApi() async {
    var url = baseUrl + 'api/AdminApi/ProductList';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        CatagaryListModels catagarylist = catagaryListModelsFromJson(r.body);
        return catagarylist;
      }
    } catch (error) {
      return;
    }
  }
  ///wallet get api
  static walletAmountApi() async {
    var prefs = GetStorage();
    //read id..........
    Id = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&Richa:${Id}');
     //var url = baseUrl + 'api/AdminApi/ListWalletMoney/27';
      var url = baseUrl + 'api/AdminApi/ListWalletMoney/$Id';

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        WalletModel? walletlist = walletModelFromJson(r.body);
        return walletlist;
      }
    } catch (error) {
      print('Error5');

      return;
    }
  }



  // ///pdf invoice api
  // static invoiceApi(var Invoice) async {
  //
  //   //prefs.write("Id".toString(), json.decode(r.body)['Id']);
  //
  //   var url = baseUrl + 'api/Order/InvoiceV1/2023BNW1';
  //   //var url = baseUrl + 'api/Order/InvoiceV1/$Invoice';
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     //  var prefs = GetStorage();
  //     // // prefs.write("Invoice".toString(), json.decode(r.body)['Invoice']);
  //     //  Invoice = prefs.read("Invoice").toString();
  //     //  print('jdjfijfkf:${Invoice}');
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       InvoiceModel invoiceproductlist = invoiceModelFromJson(r.body);
  //       print("ksjhffjhffmj: ${invoiceproductlist.result![0].price!.toDouble()}");
  //       return invoiceproductlist;
  //     }
  //   } catch (error) {
  //     print("bduegbfff: ${error}");
  //     return;
  //   }
  // }

  //slider banner Api gyros 4.........

  static SliderBannerApi() async {
    var url = baseUrl + 'api/AdminApi/BannerImage';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        SliderListModel sliderbanerlist = sliderListModelFromJson(r.body);
        return sliderbanerlist;
      }
    } catch (error) {
      return;
    }
  }

  //our offer banner Api gyros 5...................................................

  static ourOfferApi() async {
    var url = baseUrl + 'api/AdminApi/PromotionImage';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        OurOfferPromotionList ourofferlist =
        ourOfferPromotionListFromJson(r.body);
        return ourofferlist;
      }
    } catch (error) {
      return;
    }
  }

  //tried product
  static TriedProductApi() async {
    var url = baseUrl + 'api/AdminApi/AllSubcategory';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        TriedProduct allProductModel = triedProductFromJson(r.body);
        print('jhcdjkhjksdch: $allProductModel');
        return allProductModel;
      }
    } catch (error) {
      return;
    }
  }

  //new user coupan api
  static NewUserCoupanApi() async {
    SharedPreferences pref =  await SharedPreferences.getInstance() ;
    var coupanfirst =  pref.getString('first_time_coupan');
    print("xvhgdndf: ${coupanfirst}");
    var url = baseUrl + 'api/AdminApi/NewUserCoupon';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        GetCoupanCode aboutproductlist = getCoupanCodeFromJson(r.body);
        print("aboutproductlist: $aboutproductlist");
        return aboutproductlist;
      }
    } catch (error) {
      return;
    }
  }

 ///pdf invoice
  static invoiceApi(var Invoice) async {

    var prefs = GetStorage();
  var  invoiceget = prefs.read("rahul").toString();
    print('mdsjjjjhdgl:${invoiceget}');
    //var url = baseUrl + 'api/Order/InvoiceV1/2023BNW8';
        var url = baseUrl + 'api/Order/InvoiceV1/$invoiceget';
    try {
      http.Response r = await http.get(Uri.parse(url));
     //  var prefs = GetStorage();
     //  //saved invoice..........
     //  Invoice = prefs.write("Invoice".toString(), json.decode(r.body)['Invoice']);
     //  print('bhngbnhl:${Invoice.toString()}');
     //  Invoice = prefs.read("Invoice").toString();
     // print('mdsflfdgl:${Invoice.toString()}');

      print(r.body.toString());
      if (r.statusCode == 200) {
        // var prefs = GetStorage();
        // //saved invoice..........
        // prefs.write("Invoice".toString() , json.decode(r.body)['Invoice']);
        // print('mjgihjbngiuj:${Invoice.toString()}');
        // Invoice = prefs.read("Invoice").toString();
        // print('mdsflfdgl:${Invoice}');
        //var prefs = GetStorage();
        // //saved invoice..........
        // prefs.write('invoiceget', '${invoiceproductlist.result?.first.invoice}');
        // print('mjgihjbngiuj:${invoiceproductlist.result?.first.invoice}');
        // Invoice = prefs.read("invoiceproductlist.result?.first.invoice").toString();
        // print('mdsflfdgl:${invoiceproductlist.result?.first.invoice}');
        InvoiceModel invoiceproductlist = invoiceModelFromJson(r.body);
        print("invoiceget: ${invoiceproductlist.result?.first.invoice}");

        prefs.write('invoiceget', '${invoiceproductlist.result?.first.invoice}');
        print("invoiceget: ${invoiceproductlist.result?.first.invoice}");

        // print('mdsjjdgl:${invoiceget}');
        //  print("invoiceget: ${invoiceproductlist.result?.first.invoice}");
        return invoiceproductlist;
      }
    } catch (error) {
      print("bduegbfff: ${error}");
      return;
    }
  }



  //sub_cat_by_id  gyros api 6.....................................

  static getsubcatIdApi(var catid) async {
    var url = baseUrl + 'api/AdminApi/SubcategoryList/$catid';
    //var headers = {'Authorization': 'Bearer $token'};
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        SubcatbyId getsubcatbyid = subcatbyIdFromJson(r.body);
        return getsubcatbyid;
      }
    } catch (error) {
      return;
    }
  }

  //here add address api...............gyros api 7.....

  static PostAddressApi(
      var Name,
      var Mobile,
      var State,
      var City,
      var Area,
      var PinCode,
      ) async {
    try {
      var prefs = GetStorage();
      //saved id..........
      // prefs.write("Id".toString(), json.decode(r.body)['Id']);
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&88999ppppp:${Id}');
      var url = baseUrl + 'api/AdminApi/DeliveryAddress/$Id';

      var body = {
        "Name": Name,
        "Mobile": Mobile,
        "State": State,
        "City": City,
        "Area": Area,
        "PinCode": PinCode,
      };
      print(body);
      http.Response r = await http.post(
        Uri.parse(url), body: body,
        //headers: headers
      );
      print(r.body);
      if (r.statusCode == 200) {
        return r;
      } else {
        Get.snackbar('Error', 'Address not added');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  //Apply coupan api
  static ApplyCoupanApi(
      var CompanyCoupon,
      var UserId,
      ) async {
    try {
      var prefs = GetStorage();

      /*  Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&88999ppppp:${Id}');*/
      var url = baseUrl + 'api/ProductApi/EmployeeDiscountCoupon';

      var body = {
        "Companycoupon": CompanyCoupon,
        "UserId": UserId,
      };
      print(body);
      http.Response r = await http.post(
        Uri.parse(url), body: body,
        //headers: headers
      );
      print(r.body);
      if (r.statusCode == 200) {
        return r;
      } else {
        Get.snackbar('Error', 'Address not added');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  //text coupan api
  static TextCoupanApi(
      var CompanyCoupon,
      var UserId,
      ) async {
    try {
      var prefs = GetStorage();

      /*  Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&88999ppppp:${Id}');*/
      var url = baseUrl + 'api/ProductApi/EmployeeDiscountCoupon';

      var body = {
        "Name": CompanyCoupon,
        "Mobile": UserId,
      };
      print(body);
      http.Response r = await http.post(
        Uri.parse(url), body: body,
        //headers: headers
      );
      print(r.body);
      if (r.statusCode == 200) {
        return r;
      } else {
        Get.snackbar('Error', 'Address not added');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }







 /// Post coupan api original
  static PostCoupanApi(var Companycoupon, var UserId) async {
    SharedPreferences pref =  await SharedPreferences.getInstance() ;
     var coupan2 =  pref.getString('coupan_apply');
     print("jkhgkdjg: ${coupan2}");
    var url = baseUrl + 'api/ProductApi/EmployeeDiscountCoupon';
    var body = {
     // 'Companycoupon': Companycoupon,
      'Companycoupon': "$coupan2",
      'UserId': "$Id",
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    if (r.statusCode == 200) {
      Get.snackbar('Sucess', '${r.body.toString()}',
      colorText: Colors.red.shade900);
      var prefs = GetStorage();
      //saved id..........
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
      //saved token.........
      prefs.write("Companycoupon".toString(), json.decode(r.body)['Companycoupon']);
      Companycoupon = prefs.read("Companycoupon").toString();
      print('&&&&&&&:${Companycoupon}');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }

  }
/// Post coupon textfield
  static PostCoupanTextFieldApi(var Companycoupon, var UserId) async {
 var   textfield = Companycoupon.toString();
    var url = baseUrl + 'api/ProductApi/EmployeeDiscountCoupon';
    var body = {
      'Companycoupon': "$textfield",
      'UserId': "$Id",
    };
    http.Response r = await http.post(
      Uri.parse(url), body: body,
    );
    if (r.statusCode == 200) {
      Get.snackbar('Message', '${r.body.toString()}',
          colorText: Colors.red.shade900);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }


  /// first user Post coupan api original
  static FirstPostCoupanApi(var Companycoupon, var UserId) async {
    SharedPreferences pref =  await SharedPreferences.getInstance() ;
    var coupanfirst =  pref.getString('first_time_coupan');
    print("jkhgkdjg: ${coupanfirst}");
    // SharedPreferences pref =  await SharedPreferences.getInstance() ;
    // var coupanfirst =   pref.getString('first_time_coupan');
    // print("jkhgkxddjg: ${coupanfirst}");
    var url = baseUrl + 'api/ProductApi/EmployeeDiscountCoupon';
    var body = {

      // 'Companycoupon': Companycoupon,
      'Companycoupon': "$coupanfirst",
      'UserId': "$Id",
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........

      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      //saved token.........
      prefs.write("Companycoupon".toString(), json.decode(r.body)['Companycoupon']);
      Companycoupon = prefs.read("Companycoupon").toString();
      print('&&&&&&&:${Companycoupon}');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

 //  static PostCoupanApi(
 //      var Companycoupon,
 //      var UserId,
 //      ) async {
 //    try {
 //      // var prefs = GetStorage();
 //      // Id = prefs.read("Id").toString();
 //      // print('&&&&&&&&&&&&&&&&&&&&&&88999ppppp:${Id}');
 //
 //
 //      var url = baseUrl + 'api/ProductApi/EmployeeDiscountCoupon';
 //      var body = {
 //        // "Companycoupon": Companycoupon,
 //        "Companycoupon": Companycoupon,
 //        "UserId": '${Id}',
 //        // "Companycoupon": 'Gyros87110',
 //        // "UserId": '213',
 //      };
 //      print(body);
 //      http.Response r = await http.post(
 //        Uri.parse(url), body: body,
 //        //headers: headers
 //      );
 //      print(r.body);
 //      if (r.statusCode == 200) {
 //        print("hvbdjhg00bjshfks: ${Companycoupon}");
 //        var prefs = GetStorage();
 //        //saved id..........
 //       // prefs.write("Id".toString(), json.decode(r.body)['Id']);
 //        Id = prefs.read("Id").toString();
 //        print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
 //
 //        //saved coupan.........
 //        // prefs.write("Companycoupon".toString(), json.decode(r.body)['Companycoupon']);
 //        // Companycoupon = prefs.read("Companycoupon").toString();
 //        // print('&&&&44444444444&:${Companycoupon}');
 //
 //        prefs.write("Companycoupon".toString(), json.decode(r.body)['Companycoupon']);
 //        Companycoupon = prefs.read("Companycoupon").toString();
 //        print(Companycoupon);
 //        return r;
 //      } else {
 //        Get.snackbar('Error', 'Address not added');
 //        return r;
 //      }
 //    } catch (e) {
 //      print('Error');
 //      print(e.toString());
 //    }
 //  }

 // First Purchase banner gyros  api gyros 8 api.....................

  static FirstPurchaseApi() async {
    var url = baseUrl + 'api/AdminApi/Specialoffer';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        FirstOrderBanner firstofferlist = firstOrderBannerFromJson(r.body);
        return firstofferlist;
      }
    } catch (error) {
      return;
    }
  }

  // flash sell product list gyros..9 Api ..............FlashSellListProduct

  static FlashsellproduuctApi() async {
    var url = baseUrl + 'api/AdminApi/FlashSale';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        FlashSellListProduct flashsaleproductlist =
        flashSellListProductFromJson(r.body);
        return flashsaleproductlist;
      }
    } catch (error) {
      return;
    }
  }

  //get Coupan api
  static CoupanApi() async {

    var prefs = GetStorage();
//SharedPreferences p = SharedPreferences.getInstance() as SharedPreferences;


    // var  invoiceget = prefs.read("invoiceget").toString();
    // print('mdsjjjjhdgl:${invoiceget}');
    var url = baseUrl + 'api/AdminApi/CouponList';

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
      //  Get.snackbar('Sucess', 'Coupon Apply Sucessfully');

        var prefs = GetStorage();
        //saved id..........

        prefs.write("coupanget".toString(), json.decode(r.body)['couponCode']);
        coupanget = prefs.read("coupanget").toString();
        print('&&jghjgfgkj:${coupanget}');


        GetCoupan coupanlist = GetCoupan.fromJson(jsonDecode(r.body));
        // GetCoupan coupanlist = getCoupanFromJson(r.body);
        print("aboutproductlist: $coupanlist");

        return coupanlist;
      }
    } catch (error) {
      return print("Error24");
    }
  }







  // static getproductdetails(var productid) async {
  //   var url = baseUrl + 'api/AdminApi/FlaseSaleSubList/$productid';
  //
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       FlashSaleProductDetailsModel productdetailsbyid =
  //       flashSaleProductDetailsModelFromJson(r.body);
  //       return productdetailsbyid;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }
  ///about the product api...............................changed 2
  static AboutTheProductApi(var productid) async {

   // var url = baseUrl + 'api/AdminApi/AboutProduct/$productid ';
    var url = baseUrl + 'api/AdminApi/AboutProduct/69';
    try {
      http.Response r = await http.get(Uri.parse(url));

      //  var prefs = GetStorage();
      // // //prefs.write("PrdId".toString(), json.decode(r.body)['PrdId']);
      // productid = prefs.read("productid").toString();
      // print('&&&&4545:${productid}');
      print(r.body.toString());
      if (r.statusCode == 200) {
        AllDetail aboutproductlist = allDetailFromJson(r.body);
        print("aboutproductlist: $aboutproductlist");
        return aboutproductlist;
      }
    } catch (error) {
      return;
    }
  }

  ///Stand out api
  static StandOutApi() async {
    var url = baseUrl + 'api/AdminApi/StandOut/69';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        StandOut standoutlist = standOutFromJson(r.body);
        return standoutlist;
      }
    } catch (error) {
      return;
    }
  }
//////////


  ///invoice api
 //  static InvoiceApi() async {
 //    var prefs = GetStorage();
 //   // prefs.write("Id".toString(), json.decode(r.body)['Id']);
 //    Invoice = prefs.read("Invoice").toString();
 //    print('&&&&999999: ${Invoice}');
 //     var url = baseUrl + 'api/Order/InvoiceV1/2023BNW7';
 //    //var url = baseUrl + 'api/Order/InvoiceV1/$Invoice';
 //    try {
 //      http.Response r = await http.get(Uri.parse(url));
 //
 //      // var prefs = GetStorage();
 //      // prefs.write("Invoice".toString(), json.decode(r.body)['Invoice']);
 //      // Invoice = prefs.read("Invoice").toString();
 //      // print('&&&&&&&&&&&&:${Invoice}');
 //      print(r.body.toString());
 //      if (r.statusCode == 200) {
 //
 // //        var prefs = GetStorage();
 // //        //saved id..........
 // //        //prefs.write("Invoice".toString(), json.decode(r.body)['Invoice']);
 // //        Invoice = prefs.read("Invoice").toString();
 // // print('&&gjhjkh&&&:${Invoice}');
 //        InvoiceModel invoicelist = invoiceModelFromJson(r.body);
 //        print('&&&&&&&&&&&&&&&&&&&&&&: ${invoicelist}');
 //        return invoicelist;
 //      }
 //    } catch (e) {
 //      return;
 //    }
 //  }
  //sub flash sale product_by_id  gyros api 10.....................................

  static getproductdetails(var productid) async {
    var url = baseUrl + 'api/AdminApi/FlaseSaleSubList/$productid';

    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        FlashSaleProductDetailsModel productdetailsbyid =
        flashSaleProductDetailsModelFromJson(r.body);
        return productdetailsbyid;
      }
    } catch (error) {
      return;
    }
  }

  //blog post Api gyros.......11...................

  static BlogPostApi() async {
    var url = baseUrl + 'api/AdminApi/Blog';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        BlogModel blocgmodellist = blogModelFromJson(r.body);
        return blocgmodellist;
      }
    } catch (error) {
      return;
    }
  }

  // get Gift Api gyros.......12........

  static GiftBoxApi() async {
    var url = baseUrl + 'api/AdminApi/Gift';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        GiftcardModel giftcardmodel = giftcardModelFromJson(r.body);
        return giftcardmodel;
      }
    } catch (error) {
      return;
    }
  }

  // Best seller Api gyros.......13........

  static BestSellerApi() async {
    var url = baseUrl + 'api/AdminApi/BestSale';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        BestSellerModel bestSellerModel = bestSellerModelFromJson(r.body);
        return bestSellerModel;
      }
    } catch (error) {
      return;
    }
  }

  // Best seller Api gyros.......14...................address neww

  static AddressListApi() async {
    var prefs = GetStorage();
    //read id..........
    Id = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&prince108:${Id}');
    var url = baseUrl + 'api/AdminApi/ListAddress/$Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        //update();
        AddaddressModel allAddressModel = addaddressModelFromJson(r.body);
        return allAddressModel;
      }
    } catch (error) {
      return;
    }
  }

  // Our Story  get Api gyros.......15........

  static OurStoryApi() async {
    var url = baseUrl + 'api/AdminApi/OurStories';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        OurStoryModel ourStoryModelModel = ourStoryModelFromJson(r.body);
        return ourStoryModelModel;
      }
    } catch (error) {
      return;
    }
  }

  ///get_cart_list api.....gyros........16...........abhi bhaiya....when id passs in body in get api...
  static GetCartApi() async {
    var prefs = GetStorage();
    //read id..........
    Id = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&prince55:${Id}');
    //read token.........
    token =
    //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIzMWVjY2NjYi03Yjc5LTQyZjUtYjVkNC1mNGMxODc2ZGI0NzMiLCJJZCI6IjEiLCJ1c2VyaWQiOiIxIiwibmFtZSI6Inh5eiIsImV4cCI6MTY2NDUxNTI5MCwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjYiLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo0NDM2NiJ9.vSL6mzm_RFgWi3aLkmTOYiyMb3P0oHhZ_w1dddx7nao';
    //"Bearer $token";
    //'$token';
    // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJlOWNmMjg0ZC0yMGZhLTQ1ZTgtYmUxZC0wOTc1MmJmOGJmMzkiLCJJZCI6IjEiLCJ1c2VyaWQiOiIxIiwibmFtZSI6Inh5eiIsImV4cCI6MTY2NDQ0OTA4MSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNjYiLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo0NDM2NiJ9.ACMtaKjLrauPfyU0MKR67gwXANAC3A5yvNaFNgdLEjU';
    prefs.read("token").toString();
    final body = {"Id": "$Id"};
    final request = http.StreamedRequest('GET',
        Uri.parse("https://api.gyros.farm/api/ProductApi/AddToCartList"));
    request.headers["Authorization"] = "Bearer $token";
    request.headers["Content-type"] = "application/json";
    request.sink
      ..add(utf8.encode(json.encode(body)))
      ..close();
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    print(response.statusCode);
    print("princebody:${response.body}");
    print("&&&&&&&&&&&&&&&&&&prince: ${token}");

    if (response.statusCode == 200) {
      CartListModel cartListModel = cartListModelFromJson(response.body);
      return cartListModel;
    }
  }

  ///wallet post api
  static WalletPostApi(var UserId, var Money) async {
    var url = baseUrl + 'api/AdminApi/AddWalletMoney';
    var prefs = GetStorage();
    // saved id..........
    //prefs.write("Id".toString(), json.decode(r.body)['Id']);
    Id = prefs.read("Id").toString();
    print('kjkjkljjkl:${Id}');
    //
    // token = prefs.read("token").toString();
    // print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');

    var body = {
      // "UserId": UserId,
      "UserId": Id,
      "Money": Money,
    };
    // final headers = {"Authorization": "Bearer $token"};

    print(body);
    http.Response r = await http.post(Uri.parse(url), body: body);
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
     //  var prefs = GetStorage();
     // // saved id..........
     //  prefs.write("Id".toString(), json.decode(r.body)['Id']);
     //  Id = prefs.read("Id").toString();
     //  print('kjkjkljjkl:${Id}');
      // Get.snackbar('Sucess', 'Added cart Sucessfully');
      return r;
    } else if (r.statusCode == 200) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///add to cart api....gyros....17............wronfggggggg.........
  ///richa
  static AddToCartApi(
      var productId,
      ) async {
    var url = baseUrl + 'api/ProductApi/AddToCart/$productId';
    var prefs = GetStorage();
    //saved id..........
    final userId = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&okoko:${Id}');

    token = prefs.read("token").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');

    var body = {
      "Id": userId,
    };
    final headers = {"Authorization": "Bearer $token"};

    print(body);
    http.Response r =
    await http.post(Uri.parse(url), body: body, headers: headers);
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      Get.snackbar('Sucess', 'Added cart Sucessfully');
      return r;
    } else {
      Get.snackbar('Message', 'Already Added');
      ///orignal code
      //Get.snackbar('Error', 'Already Added');
      return r;
    }
  }

  ///////////////////

  ///new detail cart page api
  ///
  static NewAddToCartApi(var Id, Pkt, Qty, Price, Count, FinalAmount) async {
    // var url = baseUrl + 'api/ProductApi/AddToCartV1/69';
    var url = baseUrl + 'api/ProductApi/AddToCartV1/$productid';
    var prefs = GetStorage();
    //saved id..........

    print('&&&&&&&&&&&&&&&&&&&&&&okoko:${Id}');

    token = prefs.read("token").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');

    var body = {
      "Id": Id,
      "Pkt": Pkt,
      "Qty": Qty,
      "Price": Price,
      "Count": Count,
      "FinalAmount": FinalAmount,
    };
    final headers = {"Authorization": "Bearer $token"};

    print(body);
    http.Response r =
    await http.post(Uri.parse(url), body: body, headers: headers);
    prefs.write("productId".toString(), json.decode(r.body)['productId']);
    final productId = prefs.read("productId").toString();
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      Get.snackbar('Sucess', 'Added cart Sucessfully');
      return r;
    } else {
      Get.snackbar('Error', 'Already Added');
      return r;
    }
  }

  // static NewAddToCartApi(
  //     var Id,
  //     var Pkt,
  //     var Qty,
  //     var Price,
  //     var Count,
  //     var FinalAmount,
  //     ) async {
  //   try {
  //     var prefs = GetStorage();
  //    // Id = prefs.read("Id").toString();
  //     prefs.write("productId".toString(), json.decode(r.body)['productId']);
  //    final productId = prefs.read("productId").toString();
  //     print('jkdklkfjdslk:${productId}');
  //
  //     token = prefs.read("token").toString();
  //     print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');
  //     /*  Id = prefs.read("Id").toString();
  //     print('&&&&&&&&&&&&&&&&&&&&&&88999ppppp:${Id}');*/
  //     var url = baseUrl + 'api/ProductApi/AddToCart/$Id';
  //  //  var url = baseUrl + 'api/ProductApi/AddToCartV1/69';
  //   // var url = baseUrl + 'api/ProductApi/AddToCartV1/$Id';
  //     token = prefs.read("token").toString();
  //     print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');
  //   //  print('jkdklkfjdslk:${productId}');
  //     var body = {
  //       "Id": Id,
  //       "Pkt": Pkt,
  //       "Qty": Qty,
  //       "Price": Price,
  //       "Count": Count,
  //       "FinalAmount": FinalAmount,
  //     };
  //     final headers = {"Authorization": "Bearer $token"};
  //     print(body);
  //     http.Response r = await http.post(
  //       Uri.parse(url), body: body, headers: headers
  //       //headers: headers
  //     );
  //     print(r.body);
  //     if (r.statusCode == 200) {
  //       return r;
  //     } else {
  //       Get.snackbar('Error', 'Address not added');
  //       return r;
  //     }
  //   } catch (e) {
  //     print('Error');
  //     print(e.toString());
  //   }
  // }
  // static NewAddToCartApi(var productId,) async {
  //var url = baseUrl + 'api/ProductApi/AddToCart/$productId';
  // var url = baseUrl + 'api/ProductApi/AddToCartV1/69';
  //   var prefs = GetStorage();
  //   //saved id..........
  //   // final userId = prefs.read("Id").toString();
  //   // print('&&&&&&&&&&&&&&&&&&&&&&okoko:${Id}');
  //   //
  //   // token = prefs.read("token").toString();
  //   // print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');
  //
  //   var body = {
  //     "Id": Id,
  //     "Pkt": Pkt,
  //     "Qty": Qty,
  //     "Price": userId,
  //     "Count": userId,
  //     "FinalAmount": userId,
  //   };
  //  // final headers = {"Authorization": "Bearer $token"};
  //
  //   print(body);
  //   http.Response r =
  //   await http.post(Uri.parse(url), body: body);
  //   print(url);
  //   print(r.body);
  //   print(r.statusCode);
  //
  //   if (r.statusCode == 200) {
  //     Get.snackbar('Sucess', 'Added cart Sucessfully');
  //     return r;
  //   } else {
  //     Get.snackbar('Error', 'Already Added');
  //     return r;
  //   }
  // }

  ///total no of item in cart...........api 18.........
  //NoOfCartModel

  static NoOfCartApi() async {
    var prefs = GetStorage();
    //read id..........
    Id = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&prince55:${Id}');

    //read token.........

    token = prefs.read("token").toString();
    final body = {"Id": "$Id"};

    final request = http.StreamedRequest(
        'GET', Uri.parse("https://api.gyros.farm/api/ProductApi/NoOfItem"));
    request.headers["Authorization"] = "Bearer $token";
    request.headers["Content-type"] = "application/json";
    request.sink
      ..add(utf8.encode(json.encode(body)))
      ..close();
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    print(response.statusCode);
    print("princebody:${response.body}");
    print("&&&&&&&&&&&&&&&&&&prince: ${token}");

    if (response.statusCode == 200) {
      NoOfCartModel noOfCartModel = noOfCartModelFromJson(response.body);
      return noOfCartModel;
    }
  }

  //login with plus cart api gyros api 19.....................................

  static cartplusApi(
      var productId,
      ) async {
    var url = baseUrl + 'api/ProductApi/PlusAddToCart/$productId';
    var prefs = GetStorage();
    //saved id..........

    final userId = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&okoko:${userId}');

    token = prefs.read("token").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');
    var body = {
      "Id": userId,
    };
    final headers = {"Authorization": "Bearer $token"};

    print(body);
    http.Response r =
    await http.post(Uri.parse(url), body: body, headers: headers);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      return r;
    } else {
      Get.snackbar('Error', 'not increase');
      return r;
    }
  }

  //login with decrease cart api gyros api 20..................................

  static cartminusApi(
      var productId,
      ) async {
    var url = baseUrl + 'api/ProductApi/DeleteAddToCart/$productId';

    var prefs = GetStorage();
    //saved id..........

    final userId = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&okoko:${userId}');

    token = prefs.read("token").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');
    var body = {
      "Id": userId,
    };
    final headers = {"Authorization": "Bearer $token"};

    print(body);
    http.Response r =
    await http.post(Uri.parse(url), body: body, headers: headers);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body.toString());
      if (r.statusCode == 200) {
       // Get.snackbar('message', "Delete Successfully");
      } else {
        Get.snackbar('message', data["error"]);
      }
      return r;
    } else {
      // Get.snackbar('message', data["stat"]);
      return r;
    }
  }

  //sub_address_by_id  gyros api 21.....................................

  static getaddressIdApi(var addressid) async {
    var prefs = GetStorage();
    //read id..........
    Id = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&prince1012:${Id}');
    var url =
    //'https://api.gyros.farm/api/AdminApi/GetByAddress/2';
    baseUrl + 'api/AdminApi/GetByAddress/$addressid';
    print('url');
    //var headers = {'Authorization': 'Bearer $token'};
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        AdressbyidModel getaddressbyid = adressbyidModelFromJson(r.body);
        return getaddressbyid;
      }
    } catch (error) {
      return;
    }
  }

  ///...................

  // static GetCartApi() async {
  //   var prefs = GetStorage();
  //
  //   //prefs.write("token", json.decode(r.body)['token']);
  //   Id = prefs.read(Id);
  //   print(Id);
  //   final body = {
  //     'Id': 'Id',
  //   };
  //   final jsonString = json.encode(body);
  //   //final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
  //
  //   // final jsonData = jsonDecode(response.body) as List;
  //   token = prefs.read("token");
  //   print(token);
  //   var headers = {
  //     'Authorization': 'Bearer $token',
  //   };
  //   var url = baseUrl + 'api/ProductApi/AddToCartList';
  //   try {
  //     http.Response r =
  //         await http.post(Uri.parse(url), headers: headers, body: body
  //             //body: jsonString,
  //             );
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       CartListModel cartlistModel = cartListModelFromJson(r.body);
  //       return cartlistModel;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }
  ///
  // get all product  get Api gyros.......22........

  static AllProductApi() async {
    var url = baseUrl + 'api/AdminApi/AllSubcategory';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        AllProductModel allProductModel = allProductModelFromJson(r.body);
        return allProductModel;
      }
    } catch (error) {
      return;
    }
  }

  //tried all product api
  static TriedApi() async {
    var url = baseUrl + 'api/AdminApi/AllSubcategory';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        AllProductModel allProductModel = allProductModelFromJson(r.body);
        return allProductModel;
      }
    } catch (error) {
      return;
    }
  }

  // get about us  get Api gyros.......23........

  static ContactUsApi() async {
    var url = baseUrl + 'api/AdminApi/ContactUs';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        ContactUsModel contactUsModel = contactUsModelFromJson(r.body);
        return contactUsModel;
      }
    } catch (error) {
      return;
    }
  }

  //sign up  Api gyros  gyros Api 24........................................................
  static PostQueryApi(
      var Name,
      var Email,
      var OrderNo,
      var Message,
      ) async {
    try {
      var url = baseUrl + 'api/AdminApi/Query';

      var body = {
        "Name": Name,
        "Email": Email,
        "OrderNo": OrderNo,
        "Message": Message,
      };
      print(body);
      http.Response r = await http.post(
        Uri.parse(url),
        body: body,
      );
      print(r.body);
      if (r.statusCode == 200) {
        return r;
      } else {
        Get.snackbar('Error', 'send correct data');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  //get address api..............api gyros  get profile api...25..........................

  static GetProfileApi() async {
    var prefs = GetStorage();
    //read id..........
    Id = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&prince108profile:${Id}');
    var url = baseUrl + 'api/AdminApi/UpdateProfile/$Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        GetprofileModel getprofileModel = getprofileModelFromJson(r.body);
        return getprofileModel;
      }
    } catch (error) {
      return;
    }
  }

  // Our refund  policy  get Api gyros.......26........gyros............

  static RefundPolicyApi() async {
    var url = baseUrl + 'api/AdminApi/Refundpolicy';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        RefundpolicyModel refundpolicyModel = refundpolicyModelFromJson(r.body);
        return refundpolicyModel;
      }
    } catch (error) {
      return;
    }
  }

  // Our privecy  policy  get Api gyros.......27........gyros............

  static PrivecyPolicyApi() async {
    var url = baseUrl + 'api/AdminApi/Privacypolicy';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        PrivecypolicyModel privecypolicyModel =
        privecypolicyModelFromJson(r.body);
        return privecypolicyModel;
      }
    } catch (error) {
      return;
    }
  }

  // Our shipping  policy  get Api gyros.......28........gyros............

  static ShippingPolicyApi() async {
    var url = baseUrl + 'api/AdminApi/Shippingpolicy';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        ShippingpolicyModel shippingpolicyModel =
        shippingpolicyModelFromJson(r.body);
        return shippingpolicyModel;
      }
    } catch (error) {
      return;
    }
  }

  //get checkout api..............api gyros  get profile api...29..........................

  static GetCheckoutApi() async {
    var prefs = GetStorage();
    //read id..........
    Id = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&prince108profile:${Id}');
    var url = baseUrl + 'api/ProductApi/Checkout/$Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      print(url);
      if (r.statusCode == 200) {
        CheckoutModel checkoutModel = checkoutModelFromJson(r.body);
        print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR123: ${checkoutModel.result?.deliveryCharge}");
        return checkoutModel;
      }
    } catch (error) {
      print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR: ${error}");
      return;
    }
  }

  //get orderhistory api..............api gyros  get profile api...30..........................

  static GetHistoryApi() async {
    var prefs = GetStorage();
    //read id..........
    Id = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&prince108profile:${Id}');
    var url = baseUrl + 'api/Order/OrderHistory/$Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        OrderHistoryModel orderHistoryModel = orderHistoryModelFromJson(r.body);
       var rahul= prefs.write("rahul", orderHistoryModel.result[0].invoice);
        print("###############################: ${rahul}");
        return orderHistoryModel;
      }
    } catch (error) {
      print('errror with model ${error}');
      return;
    }
  }

  //login with email api gyros api 2..................................

  static PostOrderApi() async {
    var prefs = GetStorage();
    Id = prefs.read("Id").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
    //saved token.........
    token = prefs.read("token").toString();
    final headers = {"Authorization": "Bearer $token"};

    var url = baseUrl + 'api/Order/Orders/$Id';
    print(token);

    http.Response r = await http.post(
      Uri.parse(url), headers: headers,
      //headers: headers
    );

    if (r.statusCode == 200) {
      print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  //ContactUsModel
  ///
  //post address api gyros api 5..................................
  ///

  // static PostAddressApi(
  //   var Name,
  //   var Mobile,
  //   var State,
  //   var City,
  //   var Area,
  //   var PinCode,
  // ) async {
  //   var prefs = GetStorage();
  //   //read id..........
  //   Id = prefs.read("Id").toString();
  //   print('&&&&&&&&&&&&&&&&&&prince111:${Id}');
  //   var url = baseUrl + 'api/AdminApi/DeliveryAddress/$Id';
  //
  //   var body = {
  //     "Name": Name,
  //     "Mobile": Mobile,
  //     "State": State,
  //     "City": City,
  //     "Area": Area,
  //     "PinCode": PinCode,
  //   };
  //   print(body);
  //   http.Response r = await http.post(
  //     Uri.parse(url), body: body,
  //     //headers: headers
  //   );
  //   print(r.body);
  //   if (r.statusCode == 200) {
  //     return r;
  //   } else {
  //     Get.snackbar('Error', 'Address not added');
  //     return r;
  //   }
  // }

  ///till gyros..................................gyros.........gyros.......gyros

  ///
  ///......................old code.........

  // static signUpApi(
  //   var Name,
  //   var Mobile_No,
  //   var Email_Id,
  //   var PassWord,
  //   var ConfirmPassWord,
  // ) async {
  //   try {
  //     var url = baseUrl + 'api/AdminApi/Registration';
  //
  //     var body = {
  //       "Name": Name,
  //       "Mobile_No": Mobile_No,
  //       "Email_Id": Email_Id,
  //       "PassWord": PassWord,
  //       "ConfirmPassWord": ConfirmPassWord,
  //     };
  //     print(body);
  //     http.Response r = await http.post(
  //       Uri.parse(url),
  //       body: body,
  //     );
  //     print(r.body);
  //     if (r.statusCode == 200) {
  //       return r;
  //     } else {
  //       Get.snackbar('Error', 'SignUp Fail');
  //       return r;
  //     }
  //   } catch (e) {
  //     print('Error');
  //     print(e.toString());
  //   }
  // }

  //OTP Varification New 2....................................

  static verifyotpApi(
      var emailOtp, var smsOtp, var email, var phone_number) async {
    var url = baseUrl + 'user/signup-verification';
    var body = {
      "emailOtp": emailOtp,
      "smsOtp": smsOtp,
      "email": email,
      "phone_number": phone_number,
    };

    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      prefs.write("token", json.decode(r.body)['data']['token']);
      token = prefs.read("token");
      return r;
    } else {
      Get.snackbar('Error', 'OTP');
      return r;
    }
  }

  //login with mobile api new 3..................

  static userloginApi(var userIdentifier) async {
    var url = baseUrl + 'user/login';

    var body = {
      "userIdentifier": userIdentifier,
    };
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else {
      Get.snackbar('Error', 'Details');
      return r;
    }
  }

  //from login mobile otp. new 4.................

  static verifyphoneotp(var userIdentifier, var otp) async {
    var url = baseUrl + 'user/login-otp-verification';

    var body = {
      "userIdentifier": "$userIdentifier",
      "otp": "$otp",
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      prefs.write("token", json.decode(r.body)['data']['loginToken']);
      token = prefs.read("token");
      print(token);
      return r;
    } else {
      Get.snackbar('Error', 'OTP');
      return r;
    }
  }

  //aadhar detail updated...............new 5............

  static userAadharApi(
      var aadhaarCardNumber,
      ) async {
    var prefs = GetStorage();
    token = prefs.read("token");
    print(token);
    var headers = {
      'Authorization': 'Bearer $token',
    };
    print(headers);
    var url = baseUrl + 'user/aadhaar-number';

    var body = {
      "aadhaarCardNumber": aadhaarCardNumber,
    };
    print(body);
    http.Response r =
    await http.put(Uri.parse(url), body: body, headers: headers);
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else {
      Get.snackbar('Error', 'Details');
      return r;
    }
  }

  //personal details page.........new 7.........

  static PersonalDetailApi(var profession, var date_of_birth, var pin_code,
      var name, var gender, var state, var city) async {
    var prefs = GetStorage();
    token = prefs.read("token");
    print(token);
    var headers = {
      'Authorization': 'Bearer $token',
    };
    print(headers);
    var url = baseUrl + 'user/personal-details';

    var body = {
      "profession": profession,
      "date_of_birth": date_of_birth,
      "pin_code": pin_code,
      "name": name,
      "gender": gender,
      "state": state,
      "city": city,
    };
    print(body);
    http.Response r =
    await http.put(Uri.parse(url), body: body, headers: headers);
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else {
      Get.snackbar('Error', 'Details');
      return r;
    }
  }

  //add bank detail...............new 8...............

  ///get all catagary API........new 9...........guros..........................................

  // static getallategaryApi() async {
  //   var url = 'https://api.gyros.farm/api/AdminApi/ProductList';
  //
  //   var prefs = GetStorage();
  //   var r;
  //   prefs.write("id", jsonDecode(r.body)["cat"]['_id']);
  //   categoryid = prefs.read('id');
  //   print("userId : $categoryid");
  //
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       List<CatagaryListModels> getallcat = catagaryListModelsFromJson(r.body);
  //       //List<CatagaryListModel> getallcategary = catagaryListFromJson(r.body);
  //       return getallcat;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  ///get catagary name Api new 10.. gyros...............................

  // static getcatnameIdApi(var catid) async {
  //   var prefs = GetStorage();
  //   categoryid = prefs.read('id');
  //   print("userid  $categoryid");
  //   var url = baseUrl + 'SubcategoryList/$catid';
  //   var headers = {'Authorization': 'Bearer $token'};
  //   try {
  //     http.Response r = await http.get(Uri.parse(url), headers: headers);
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       List<CatagaryListModels> getcatname =
  //           catagaryListModelsFromJson(r.body);
  //       // List<CatagaryListModel> getcatname = catagaryListModelFromJson(r.body);
  //       return getcatname;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  ///get Priority catagary api 10........................................

  // static getprioritycatageryApi() async {
  //   var url = baseUrl + 'category/priority';
  //
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       GetPriorityCategary getprioritycategary =
  //       getPriorityCategaryFromJson(r.body);
  //       return getprioritycategary;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  ///get tradding offer (banner) api new 11.....................

  // static getbanerApi() async {
  //   var prefs = GetStorage();
  //   token = prefs.read("token");
  //   print(token);
  //   var headers = {
  //     'Authorization': 'Bearer $token',
  //   };
  //   var url = baseUrl + 'offer/trending';
  //
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       GetBannerModel getbanner = getBannerModelFromJson(r.body);
  //       return getbanner;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  ///get wallet api  new 12......................................
  // static getwalletApi() async {
  //   var prefs = GetStorage();
  //   token = prefs.read("token");
  //   print(token);
  //   var headers = {
  //     'Authorization': 'Bearer $token',
  //   };
  //   var url = baseUrl + 'wallet';
  //   try {
  //     http.Response r = await http.get(Uri.parse(url), headers: headers);
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       GetWalletModel getbanner = getWalletModelFromJson(r.body);
  //       return getbanner;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  ///get lead api new 13............................

  // static getleadApi() async {
  //   var prefs = GetStorage();
  //   token = prefs.read("token");
  //   print(token);
  //   var headers = {
  //     'Authorization': 'Bearer $token',
  //   };
  //   var url = baseUrl + 'lead';
  //
  //   try {
  //     http.Response r = await http.get(Uri.parse(url), headers: headers);
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       GetleadModel getlead = getleadModelFromJson(r.body);
  //       return getlead;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  ///get credit link Api...........14 new............

  // static getcreditlinkApi() async {
  //   var prefs = GetStorage();
  //   token = prefs.read("token");
  //   print(token);
  //   var headers = {
  //     'Authorization': 'Bearer $token',
  //   };
  //   var url = baseUrl + 'credit-line/withdrawals';
  //
  //   try {
  //     http.Response r = await http.get(Uri.parse(url), headers: headers);
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       GetcreditlinkModel getcreditlink = getcreditlinkModelFromJson(r.body);
  //       return getcreditlink;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  ///get personal detail Api new 15 new...............

  // static getpersonaldetailApi() async {
  //   var prefs = GetStorage();
  //   token = prefs.read("token");
  //   print(token);
  //   var headers = {
  //     'Authorization': 'Bearer $token',
  //   };
  //   var url = baseUrl + 'user/personal-details';
  //   try {
  //     http.Response r = await http.get(Uri.parse(url), headers: headers);
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       GetpersonaldetailModel getpersonaldetail =
  //       getpersonaldetailModelFromJson(r.body);
  //       return getpersonaldetail;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  //put profile image new 16.......................

  static putprofileimageApi(var imagePath) async {
    var prefs = GetStorage();
    token = prefs.read("token");
    print(token);
    var url = baseUrl + 'user/profile-image';
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest('PUT', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    http.Response r = await http.Response.fromStream(response);
    print(r.reasonPhrase);
    return r;
  }

  ///get catagary name Api new 17..................

  // static getcatnameApi(var catid) async {
  //   // var prefs = GetStorage();
  //   // categoryid = prefs.read('id');
  //   //   print("userid  $categoryid");
  //   var url = baseUrl + 'offer/category/$catid';
  //   var headers = {'Authorization': 'Bearer $token'};
  //   try {
  //     http.Response r = await http.get(Uri.parse(url), headers: headers);
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       Getcategarynamemodel getcatname = getcategarynamemodelFromJson(r.body);
  //       return getcatname;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  ///get offer by id new 18....................................

  // static getofferIdApi(var offerid) async {
  //   var prefs = GetStorage();
  //   token = prefs.read("token");
  //   print(token);
  //
  //   // var prefs = GetStorage();
  //   // categoryid = prefs.read('id');
  //   //   print("userid  $categoryid");
  //   var url = baseUrl + 'offer/$offerid';
  //
  //   var headers = {'Authorization': 'Bearer $token'};
  //   try {
  //     http.Response r = await http.get(Uri.parse(url), headers: headers);
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       GetalloffersIdmodel getofferid = getalloffersIdmodelFromJson(r.body);
  //       return getofferid;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  ///get user Api for  this is not a list drawer box new 19...............

  // static getuserApi() async {
  //   var prefs = GetStorage();
  //   token = prefs.read("token");
  //   print(token);
  //   var headers = {
  //     'Authorization': 'Bearer $token',
  //   };
  //   var url = baseUrl + 'user';
  //
  //   try {
  //     http.Response r = await http.get(Uri.parse(url), headers: headers);
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       GetDrawerModel getDrawerModel = getDrawerModelFromJson(r.body);
  //       return getDrawerModel;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  ///get bank detail API new 20.........

  // static getbankdetailApi() async {
  //   var prefs = GetStorage();
  //   token = prefs.read("token");
  //   print(token);
  //   var headers = {
  //     'Authorization': 'Bearer $token',
  //   };
  //   var url = baseUrl + 'user/bank-details';
  //   try {
  //     http.Response r = await http.get(Uri.parse(url), headers: headers);
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       GetBankDetailModel getbankdetail = getBankDetailModelFromJson(r.body);
  //       return getbankdetail;
  //     }
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }

  ///get all lead Count  new 21....................

  // static getleadcountApi() async {
  //   var prefs = GetStorage();
  //   token = prefs.read("token");
  //   print(token);
  //   var headers = {
  //     'Authorization': 'Bearer $token',
  //   };
  //   var url = baseUrl + 'lead/count';
  //
  //   try {
  //     http.Response r = await http.get(Uri.parse(url), headers: headers);
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       Getleadcount getleadcount = getleadcountFromJson(r.body);
  //       return getleadcount;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  ///post Chat support api..new 22...........................

  static userChatsupportApi(
      var comment,
      ) async {
    var prefs = GetStorage();
    token = prefs.read("token");
    print(token);
    var headers = {
      'Authorization': 'Bearer $token',
    };
    print(headers);
    var url = baseUrl + 'support-ticket';

    var body = {
      "comment": comment,
    };
    print(body);
    http.Response r =
    await http.post(Uri.parse(url), body: body, headers: headers);
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else {
      Get.snackbar('Error', 'Details');
      return r;
    }
  }

  //add bank details..................................................................

  static addbankinApi(
      var accHolderName,
      var bankname,
      var accnumber,
      var confirmaccnumber,
      var ifsccode,
      ) async {
    var url = baseUrl + 'api/addbank';

    var body = {
      "accHolderName": accHolderName,
      "bankname": bankname,
      "accnumber": accnumber,
      "confirmaccnumber": confirmaccnumber,
      "ifsccode": ifsccode,
    };

    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else {
      Get.snackbar('Error', 'Details');
      return r;
    }
  }

  //addpersonal details..................................

  // static addpersonalApi(var fullname,var phone,var city,var state,
  //     var email,var profession,var DOB,var gender) async {
  //   var prefs = GetStorage();
  //   userid = prefs.read('id');
  //   print("userid  $userid");
  //
  //   var url = baseUrl + 'api/updateuser/$userid';
  //   var body = {
  //     "fullname":fullname,
  //     "phone":phone,
  //     "city":city,
  //     "state":state,
  //     "email":email,
  //     "profession":profession,
  //     "DOB":DOB,
  //     "gender":gender,
  //   };
  //
  //   http.Response r = await http.put(Uri.parse(url),body: body,);
  //   print(r.body);
  //   if(r.statusCode == 200) {
  //     return r;
  //   }
  //   else {
  //     Get.snackbar('Error', 'Details');
  //     return r;
  //   }
  //
  // }

  ///get all top earning partner API.......................................................

  // static gettopearninhgApi() async {
  //   var url = baseUrl + 'api/footergetbanner';
  //   // var headers = {
  //   //   'Authorization': 'Bearer $token'
  //   // };
  //
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     print(r.body.toString());
  //     if (r.statusCode == 200) {
  //       //list is here
  //       List<TopEarningPartnerModel> gettopearning =
  //       topEarningPartnerModelFromJson(r.body);
  //       return gettopearning;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  ///login with Facebook Api...............................

  static loginWithFacebook(String fbToken) async {
    //CallLoader.loader();
    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
      http.Request('POST', Uri.parse(baseUrl + 'user/login/facebook'));
      request.body = json.encode({"fbToken": fbToken});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      http.Response r = await http.Response.fromStream(response);
      var data = jsonDecode(r.body);
      if (response.statusCode == 200) {
        // CallLoader.hideLoader();
        var prefs = GetStorage();
        prefs.write("token", json.decode(r.body)['data']['loginToken']);
        token = prefs.read("token");
        if (data['data']['phoneNumberVerified']) {
          //Get.offAll(() => BottomBarScreen());
        } else {
          //Get.offAll(() => EnterMobileScreen());
        }
      } else {
        //CallLoader.hideLoader();
        //CallLoader.errorDialog(jsonDecode(r.body)["error"]);
      }
    } on HttpException catch (e) {
      //CallLoader.hideLoader();
      //CallLoader.errorDialog(e.message);
    }
  }

  ///login with google..................................
  static loginWithGoogle(String gToken) async {
    //CallLoader.loader();
    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
      http.Request('POST', Uri.parse(baseUrl + 'user/login/google'));
      request.body = json.encode({"googleIdToken": gToken});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      http.Response r = await http.Response.fromStream(response);
      var data = jsonDecode(r.body);
      if (response.statusCode == 200) {
        //CallLoader.hideLoader();
        var prefs = GetStorage();
        prefs.write("token", json.decode(r.body)['data']['loginToken']);
        token = prefs.read("token");
        if (data['data']['phoneNumberVerified']) {
          //Get.offAll(() => BottomBarScreen());
        } else {
          //Get.offAll(() => EnterMobileScreen());
        }
      } else {
        //CallLoader.hideLoader();
        //CallLoader.errorDialog(jsonDecode(r.body)["error"]);
      }
    } on HttpException catch (e) {
      //CallLoader.hideLoader();
      //CallLoader.errorDialog(e.message);
    }
  }

  static editMobile(String mobile) async {
    //CallLoader.loader();
    try {
      var headers = {
        'Authorization': 'Bearer ' + token,
        'Content-Type': 'application/json'
      };
      var request =
      http.Request('PUT', Uri.parse(baseUrl + 'user/phone-number'));
      request.body = json.encode({"phoneNumber": mobile});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      http.Response r = await http.Response.fromStream(response);
      if (response.statusCode == 200) {
        //CallLoader.hideLoader();
        //Get.to(() => VerifyMobileScreen());
      } else {
        //CallLoader.hideLoader();
        //CallLoader.errorDialog(jsonDecode(r.body)['error']);
      }
    } on HttpException catch (e) {
      //CallLoader.hideLoader();
      //CallLoader.errorDialog(e.message);
    }
  }

  static verifyMobile({required String mobile, required String otp}) async {
    //CallLoader.loader();
    try {
      var headers = {
        'Authorization': 'Bearer ' + token,
        'Content-Type': 'application/json'
      };
      var request =
      http.Request('POST', Uri.parse(baseUrl + 'user/verify-phone-number'));
      request.body = json.encode({"phoneNumber": mobile, "otp": otp});
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      http.Response r = await http.Response.fromStream(response);
      //CallLoader.hideLoader();
      if (response.statusCode == 200) {
        // Get.offAll(() => BottomBarScreen());
      } else {
        //CallLoader.errorDialog(jsonDecode(r.body)["error"]);
      }
    } on HttpException catch (e) {
      // CallLoader.hideLoader();
      //CallLoader.errorDialog(e.message);
    }
  }

  static getAllProduct() async {
    var url = baseUrl + 'api/AdminApi/AllSubcategory';
    try {
      http.Response r = await http.get(Uri.parse(url));

      if (r.statusCode == 200) {
        GetProductModel getProductModel = getProductModelFromJson(r.body);
        return getProductModel;
      } else {}
    } catch (error) {
      return error;
    }
  }

  static getProductDetails(var id) async {
    var url = baseUrl + 'api/AdminApi/FlaseSaleSubList/$id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body);
      print(r.statusCode);

      if (r.statusCode == 200) {
        GetProductDetailModel getProductDetailModel =
        getProductDetailModelFromJson(r.body);
        return getProductDetailModel;
      }
    } catch (error) {
      return error;
    }
  }

  static postReview(
      var name,
      var email,
      var title,
      var description,
      var mobile,
      var rating1,
      var rating2,
      var rating3,
      var rating4,
      var rating5,
      var imagePath) async {
    var headers = {
      'productid': '98',
      'Name': '$name',
      'Email': '$email',
      'Description': '$description',
      'Mobile': '$mobile',
      'Title': '$title',
      'Rating1': '$rating1',
      'Rating2': '$rating2',
      'Rating3': '$rating3',
      'Rating4': '$rating4',
      'Rating5': '$rating5'
    };
    print(name);
    print(email);
    print(title);
    print(description);
    print(mobile);
    print(rating1);
    print(rating2);
    print(rating3);
    print(rating4);
    print(rating5);
    print(imagePath);
    try {
      var url = baseUrl + '/api/FileUpload/Upload';
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath('image', imagePath));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      http.Response r = await http.Response.fromStream(response);
      print(r.statusCode);
      print(r.body);
      if (r.statusCode == 200) {
        return r;
      } else {
        CallLoader.hideLoader();
        Get.snackbar('Error', r.body);
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  ///new detail model api..........detail page 4 feb 2023..........okoko.....prince
  static newproductdetails(var productid) async {
    var url = baseUrl + 'api/AdminApi/SubCategoryFullDescriptions/$productid';
    //var url = baseUrl + 'api/AdminApi/SubCategoryFullDescriptions/69';
    print("hfgvjdfkdfdgricha: ${productid}");
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        ProductDetailsModel? newproductdetailsbyid =
        ProductDetailsModelFromJson(r.body);
        print("hbvcjvkjdj: ${newproductdetailsbyid.productModelApi.productName}");
        return newproductdetailsbyid;
      }
    } catch (error) {
      return;
    }
  }

  ///post api for detail page weight button
  static weightButtonApi(
      var Id,
      var Pkt,
      var Qty,
      var Price,
      var Count,
      var FinalAmount,
      ) async {
    try {
      var url = baseUrl + 'api/ProductApi/AddToCartV1';
      // var url = baseUrl + 'api/ProductApi/AddToCartV1/69';
      var prefs = GetStorage();
      //saved id..........
      final userId = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&okoko:${Id}');

      token = prefs.read("token").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&okok:${token}');
      var body = {
        "Id": Id,
        "Pkt": Pkt,
        "Qty": Qty,
        "Price": Price,
        "Count": Count,
        "FinalAmount": FinalAmount,
      };
      final headers = {"Authorization": "Bearer $token"};
      print(body);
      http.Response r = await http.post(
        Uri.parse(url),
        body: body,
        headers: headers,
      );
      // print(r.body);
      print(r.statusCode);

      if (r.statusCode == 200) {
        return r;
      } else {
        Get.snackbar('Error', ' Fail');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }
}
