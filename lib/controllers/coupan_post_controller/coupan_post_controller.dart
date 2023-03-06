
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import '../../services/api_provider.dart';
import '../../storage.dart';
import '../../view/home_page/profile/home_page_practice.dart';



class CoupanPostController extends GetxController{
  TextEditingController Companycoupon = TextEditingController();
  TextEditingController textfieldcoupon = TextEditingController();
  TextEditingController UserId = TextEditingController();
  var isVisible = true.obs;
  RxBool isLoading = true.obs;
  final GlobalKey<FormState> CupoonnFormKey =
  GlobalKey<FormState>(debugLabel: "CupponnFormKey");
 // GlobalKey<FormState> coupanform = GlobalKey(debugLabel: "coupanform");

  void postcoupanApi() async {
    isLoading(true);
    http.Response r = await ApiProvider.PostCoupanApi(
      Companycoupon.text,
      UserId.text,
    );

    if (r.statusCode == 200) {
      print("jhfdkdjsh: ${Companycoupon.text}");
      // Get.to(
      //       () => HomePagePractice(), //next page class
      //   duration: Duration(
      //       milliseconds: 300), //duration of transitions, default 1 sec
      //   transition:
      //
      //   Transition.zoom,
      // );
    }

    isLoading(false);
  }
  // Post coupon textfield
  void postcoupantextfieldApi() async {
    isLoading(true);
    http.Response r = await ApiProvider.PostCoupanTextFieldApi(
      textfieldcoupon.text,
      UserId.text,
    );

    if (r.statusCode == 200) {
      print("RRRRRRRRRRRRRRRRRRRRRRtext: ${textfieldcoupon.text}");
      // Get.to(
      //       () => HomePagePractice(), //next page class
      //   duration: Duration(
      //       milliseconds: 300), //duration of transitions, default 1 sec
      //   transition:
      //
      //   Transition.zoom,
      // );
    }

    isLoading(false);
  }



  void firstpostcoupanApi() async {
    isLoading(true);
    http.Response r = await ApiProvider.FirstPostCoupanApi(
      Companycoupon.text,
      UserId.text,
    );

    if (r.statusCode == 200) {
      print("jhfdkdjsh: ${Companycoupon.text}");
      // Get.to(
      //       () => HomePagePractice(), //next page class
      //   duration: Duration(
      //       milliseconds: 300), //duration of transitions, default 1 sec
      //   transition:
      //
      //   Transition.zoom,
      // );
    }

    isLoading(false);
  }


  @override
  void onInit() {
    Companycoupon;
    textfieldcoupon;
    UserId;
    super.onInit();


  }

  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
  }
  @override
  void dispose() {
    super.dispose();
    Companycoupon.dispose();
    textfieldcoupon.dispose();
    UserId.dispose();
    //box.read('key');
    CoupanPostController();
  }
  String? validateCoupan(String value) {
      if (value.length < 2) {
        return "";
    }
    return null;
  }
  void checkcoupontextfield() {
    //final isValid = AddressFormKey.currentState!.validate();
    if (textfieldcoupon.text.isEmpty) {
     Get.snackbar("Message", "Please fill TextField");
    }else{
      postcoupantextfieldApi();
    }
  }
}