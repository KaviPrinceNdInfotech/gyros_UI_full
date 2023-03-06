import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotCodeController extends GetxController {
  final GlobalKey<FormState> ForgotFormKey = GlobalKey<FormState>();

  late TextEditingController codeController;

  var code = '';

  @override
  void onInit() {
    super.onInit();

    codeController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    codeController.dispose();
  }

  String? validateCode(String value) {
    if (value.length < 6) {
      return "Code must be of 6 characters";
    }
    return null;
  }

  void checkCodereset() {
    final isValid = ForgotFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    ForgotFormKey.currentState!.save();
  }
}
