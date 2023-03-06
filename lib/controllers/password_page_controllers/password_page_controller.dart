import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpPhoneController extends GetxController {
  var isVisible = true.obs;

  final GlobalKey<FormState> OtpFormKey = GlobalKey<FormState>();

  late TextEditingController firstOtpController,
      secondOtpController,
      thirdOtpController,
      fourthOtpController;

  var firstotp = '';
  var secondotp = '';
  var thirdotp = '';
  var fourthotp = '';

  @override
  void onInit() {
    super.onInit();

    firstOtpController = TextEditingController();
    secondOtpController = TextEditingController();
    thirdOtpController = TextEditingController();
    fourthOtpController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    firstOtpController.dispose();
    secondOtpController.dispose();
    thirdOtpController.dispose();
    fourthOtpController.dispose();
  }

  String? validatePassword1(String value) {
    if (value.length < 1) {
      return "";
    }
    return null;
  }

  String? validatePassword12(String value) {
    if (value.length < 1) {
      return "";
    }
    return null;
  }

  String? validatePassword3(String value) {
    if (value.length < 1) {
      return "";
    }
    return null;
  }

  String? validatePassword4(String value) {
    if (value.length < 1) {
      return "";
    }
    return null;
  }

  void checkOtp() {
    final isValid = OtpFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    OtpFormKey.currentState!.save();
  }
}
