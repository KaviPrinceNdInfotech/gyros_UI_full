import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/rozar_pay_controller/rozar_pay_controller.dart';

class PaymentController extends GetxController {
  final GlobalKey<FormState> paymentFormKey = GlobalKey<FormState>();
  final RozarPayController _rozarPayController = Get.put(RozarPayController());

  //NavController _navController = Get.find();

  TextEditingController payment = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    payment;

    _rozarPayController.openCheckout();

    // _navController.tabindex(0);
    // Get.to(() => NavBar());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    payment.dispose();
  }

  String? validatePayment(String value) {
    if (value.length < 2) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  void checkPayment() {
    final isValid = paymentFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    paymentFormKey.currentState!.save();
  }
}
