import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gyros_app/view/otp_new_section/otp_new_part.dart';
import 'package:http/http.dart' as http;

import '../../services/api_provider.dart';
import '../../widgets/circular_loader.dart';
import '../otp_timer_controller/otp_timer_controllerss.dart';

class LoginMobileController extends GetxController {
  RxBool isLoading = false.obs;
  final GlobalKey<FormState> MobileLoginFormKey =
      GlobalKey(debugLabel: "MobileLoginFormKey");
  TextEditingController MobileOrEmail = TextEditingController();

  OtpTimerController _timeController = Get.put(OtpTimerController());

  // late TextEditingController phoneController;

  void phoneemailApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.PhoneEmailApi(
      MobileOrEmail.text,
    );

    if (r.statusCode == 200) {
      // var data = jsonDecode(r.body);

      CallLoader.hideLoader();
      Get.to(() => OtpVerification());
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //       builder: (context) => Otp()),
      // );
      //Get.to(() => Otp(MobileOrEmail: MobileOrEmail));

      // _timeController.email = MobileOrEmail.text;
      // _timeController.phoneNumber = MobileOrEmail.text;
    }
  }

  @override
  void onInit() {
    super.onInit();
    MobileOrEmail;

    // phoneController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //MobileOrEmail.dispose();
  }

  String? validatePhone(String value) {
    if (value.length < 1) {
      return "provide valid Mobile / Email";
    }
    return null;
  }

  checkMobileLogin() async {
    var isValidate = MobileLoginFormKey.currentState!.validate();
    if (!isValidate) {
      return;
    } else {
      phoneemailApi();
    }
    // {
    //   phoneemailApi();
    // }
    MobileLoginFormKey.currentState!.save();
  }
}
