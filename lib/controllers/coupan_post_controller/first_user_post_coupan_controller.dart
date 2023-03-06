
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import '../../services/api_provider.dart';
import '../../storage.dart';
import '../../view/home_page/profile/home_page_practice.dart';



class FirstCoupanPostController extends GetxController{
  var isVisible = true.obs;
  RxBool isLoading = true.obs;
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

  TextEditingController Companycoupon = TextEditingController();
  TextEditingController UserId = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    Companycoupon;
    UserId;
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
    UserId.dispose();
    box.read('key');
  }

  String? validateCoupan(String value) {
    if (value.length < 2) {
      return "";
    }
    return null;
  }
}