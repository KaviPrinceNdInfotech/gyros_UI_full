import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gyros_app/services/api_provider.dart';
import 'package:http/http.dart' as http;

import '../../view/botttom_nav_bar/bottom_nav_bar_controller.dart';
import '../../view/botttom_nav_bar/bottom_navbar.dart';
import '../phone_login_controllerr/phone_login_controllers.dart';

class OtpVerifyController extends GetxController {
  RxBool isLoading = true.obs;

  GlobalKey<FormState> mobileform = GlobalKey();

  LoginMobileController _loginMobileController = Get.find();
  NavController _navController = Get.find();

  //LoginMobileController loginMobileController = Get.find();

  void callOtpApi(String otp) async {
    http.Response r = await ApiProvider.verifyOTP(_loginMobileController.MobileOrEmail.text, otp);
    if (r.statusCode == 200) {
      //Get.to(() => DetailsProfile());
      _navController.tabindex(0);
      Get.to(() => NavBar());
    }
  }

  String? validateMobile(value) {
    if (value == '') {
      return 'please enter your otp';
    }
    return null;
  }

  checkMobile() async {
    var isValidate = mobileform.currentState!.validate();
    if (!isValidate) {
      return;
    } else {
      // callotpApi();
    }
    mobileform.currentState!.save();
  }
}
