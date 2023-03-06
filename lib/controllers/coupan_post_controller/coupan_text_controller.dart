
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import '../../services/api_provider.dart';
import '../../view/home_page/profile/home_page_practice.dart';



class CoupanTextController extends GetxController{
  var isVisible = true.obs;
  RxBool isLoading = true.obs;


  void textcoupanApi() async {
    isLoading(true);
    http.Response r = await ApiProvider.TextCoupanApi(
      CompanyCoupon.text,
      UserId.text,
    );
    if (r.statusCode == 200) {
      Get.to(
            () => HomePagePractice(), //next page class
        duration: Duration(
            milliseconds: 300), //duration of transitions, default 1 sec
        transition:

        Transition.zoom,
      );
    }

    isLoading(false);
  }

  TextEditingController CompanyCoupon = TextEditingController();
  TextEditingController UserId = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    CompanyCoupon;
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
    CompanyCoupon.dispose();
    UserId.dispose();
  }
}