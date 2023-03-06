import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetEmailController extends GetxController {
  final GlobalKey<FormState> resetEmailFormKey = GlobalKey<FormState>();

  late TextEditingController emailController;

  var email = '';

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
  }

  String? validateEml(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  void checkEmailreset() {
    final isValid = resetEmailFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    resetEmailFormKey.currentState!.save();
  }
}
