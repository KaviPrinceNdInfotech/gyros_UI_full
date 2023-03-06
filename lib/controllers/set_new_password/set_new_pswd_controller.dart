import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetPasswordController extends GetxController {
  final GlobalKey<FormState> SetPasswordFormKey = GlobalKey<FormState>();

  late TextEditingController code1Controller;
  late TextEditingController code2Controller;

  var code1 = '';
  var code2 = '';

  @override
  void onInit() {
    super.onInit();

    code1Controller = TextEditingController();

    code2Controller = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    code1Controller.dispose();
    code2Controller.dispose();
  }

  String? validateCode1(String value) {
    if (value.length < 6) {
      return "Code must be of 6 characters";
    }
    return null;
  }

  String? validateCode2(String value) {
    if (value.length < 6) {
      return "Code must be of 6 characters";
    }
    return null;
  }

  void checkNewPassword() {
    final isValid = SetPasswordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    SetPasswordFormKey.currentState!.save();
  }
}
