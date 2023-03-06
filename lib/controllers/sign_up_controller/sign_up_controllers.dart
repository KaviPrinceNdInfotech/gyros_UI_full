import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gyros_app/controllers/otp_timer_controller/otp_timer_controllerss.dart';
import 'package:gyros_app/services/api_provider.dart';
import 'package:gyros_app/widgets/circular_loader.dart';
import 'package:http/http.dart' as http;

import '../../view/login_page/login_pagee.dart';

// class SignUpPageController extends GetxController {
//   var isVisible = true.obs;
//   final GlobalKey<FormState> SignUpFormKey = GlobalKey<FormState>();
//
//   void calluserProfileApi() async {
//     print(name.toString());
//     http.Response r = await ApiProvider.addUserApi(
//       name.toString(),
//       phone.toString(),
//       email.toString(),
//       password.toString(),
//       confirmpassword.toString(),
//     );
//     if (r.statusCode == 200) {
//       //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
//       //Get.to(()=> LoginPage());
//
//       // _timeController.email = email.text;
//       // _timeController.phoneNumber = number.text;
//       Get.to(() => NavBar());
//     }
//   }
//   //NavController _navController = Get.find();
//
//   late TextEditingController nameController,
//       emailController,
//       phoneController,
//       passwordController,
//       confirmpasswordController;
//   var name = '';
//   var email = '';
//   var phone = '';
//   var password = '';
//   var confirmpassword = '';
//   @override
//   void onInit() {
//     super.onInit();
//     nameController = TextEditingController();
//     emailController = TextEditingController();
//     phoneController = TextEditingController();
//     passwordController = TextEditingController();
//     confirmpasswordController = TextEditingController();
//     // _navController.tabindex(0);
//     // Get.to(() => NavBar());
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     nameController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     passwordController.dispose();
//     confirmpasswordController.dispose();
//   }
//
//   String? validateName(String value) {
//     if (value.length < 2) {
//       return "Provide valid name";
//     }
//     return null;
//   }
//
//   String? validateEmail(String value) {
//     if (!GetUtils.isEmail(value)) {
//       return "Provide valid Email";
//     }
//     return null;
//   }
//
//   String? validatePhone(String value) {
//     if (value.length < 10) {
//       return "Phone must be of 10 characters";
//     }
//     return null;
//   }
//
//   String? validatePassword(String value) {
//     if (value.length < 6) {
//       return "password should be 6 character";
//     }
//     return null;
//   }
//
//   String? validateConfirmPassword(String value) {
//     if (value.length < 6) {
//       return "re enter your password";
//     }
//     return null;
//   }
//
//   void checkSignUp() {
//     final isValid = SignUpFormKey.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     SignUpFormKey.currentState!.save();
//   }
// }

class SignUpPageController extends GetxController {
  RxBool isLoading = true.obs;
  GlobalKey<FormState> signupform = GlobalKey(debugLabel: "signupform");

  OtpTimerController _timeController = Get.put(OtpTimerController());

  void callsignupApi() async {
    CallLoader.loader();
    print(Name.text);
    http.Response r = await ApiProvider.signUpApi(
      Name.text,
      Mobile_No.text,
      Email_Id.text,
      PassWord.text,
      ConfirmPassWord.text,
    );
    if (r.statusCode == 200) {
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
      //Get.to(()=> LoginPage());
      CallLoader.hideLoader();
      //Get.to(() => NavBar());
      Get.to(() => LoginPage());

      // _timeController.email = Email_Id.text;
      // _timeController.phoneNumber = Mobile_No.text;
    }
  }

  //from here add member and add patient both ccontroller function ..............

  TextEditingController Name = TextEditingController();
  TextEditingController Mobile_No = TextEditingController();
  TextEditingController Email_Id = TextEditingController();
  //TextEditingController state = TextEditingController();
  //TextEditingController city = TextEditingController();
  TextEditingController PassWord = TextEditingController();
  TextEditingController ConfirmPassWord = TextEditingController();

  //this is City..........
  //Rx<String?> selectedCity = (null as String?).obs;

  //RxList<String> cities = <String>[].obs;

  //This is State....................

  //Rx<String?> selectedState = (null as String?).obs;

  //RxList<String> states = <String>[].obs;
  //................................

  @override
  void onInit() {
    // stateCityMap.forEach((key, value) {
    //   states.add(key);
    // });
    // states.refresh();
    super.onInit();

    Name;
    Mobile_No;
    Email_Id;
    PassWord;
    ConfirmPassWord;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    Name.dispose();
    Mobile_No.dispose();
    Email_Id.dispose();
    PassWord.dispose();
    ConfirmPassWord.dispose();
  }

  String? validatename(value) {
    if (value.length < 2) {
      return "Provide valid name";
    }

    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.length < 10) {
      return "Phone must be of 10 characters";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 5) {
      return "password should be 6 character";
    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value.length < 5) {
      return "re enter your password";
    }
    return null;
  }

  void checkSignUp() {
    if (signupform.currentState!.validate()) {
      callsignupApi();
    }
    signupform.currentState!.save();
  }
}
