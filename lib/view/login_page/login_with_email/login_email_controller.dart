import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gyros_app/services/api_provider.dart';
import 'package:gyros_app/widgets/circular_loader.dart';
import 'package:http/http.dart' as http;

import '../../botttom_nav_bar/bottom_navbar.dart';

class LoginEmailController extends GetxController {
  var isVisible = true.obs;
  RxBool isLoading = true.obs;
  final GlobalKey<FormState> loginEmailFormKey = GlobalKey();

  //  var email = '';
  // var password = '';
  var Id = '';

  void emailApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.LoginEmailApi(
      Email.text,
      PassWord.text,
    );

    if (r.statusCode == 200) {
      var data = jsonDecode(r.body);

      CallLoader.hideLoader();
      Get.to(() => NavBar());
    }
  }

  TextEditingController Email = TextEditingController();
  TextEditingController PassWord = TextEditingController();

  //NavController _navController = Get.find();

  //late TextEditingController emailController, passwordController;
// email = '';
//   var password = '';
  @override
  void onInit() {
    super.onInit();
    Email;
    PassWord;

    // _navController.tabindex(0);
    // Get.to(() => NavBar());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    Email.dispose();
    PassWord.dispose();
  }

  String? validateEmail(value) {
    if (value == '') {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 4) {
      return "Password must be of 4 characters";
    }
    return null;
  }

  void checkLogin() {
    if (loginEmailFormKey.currentState!.validate()) {
      emailApi();
    }
    loginEmailFormKey.currentState!.save();
  }
}
