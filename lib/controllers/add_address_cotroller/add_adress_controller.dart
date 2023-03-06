import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gyros_app/services/api_provider.dart';
import 'package:http/http.dart' as http;

import '../../view/model_cart_practice/viewss/adress_pagess/address_list/address_listss.dart';
import '../address_list_controller/address_list_controllers.dart';
import '../otp_timer_controller/otp_timer_controllerss.dart';

class AddAdressController extends GetxController {
  var isVisible = true.obs;
  RxBool isLoading = true.obs;
  AddressListController _addressListController =
      Get.put(AddressListController());

  final GlobalKey<FormState> AddressFormKey =
      GlobalKey<FormState>(debugLabel: "AddressFormKey");
  OtpTimerController _timeController = Get.put(OtpTimerController());

  void postaddresssApi() async {
    isLoading(true);
    //CallLoader.loader();
    //print(Name.text);
    http.Response r = await ApiProvider.PostAddressApi(
      Name.text,
      Mobile.text,
      State.text,
      City.text,
      Area.text,
      PinCode.text,
    );
    if (r.statusCode == 200) {
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
      //Get.to(()=> LoginPage());
      //CallLoader.hideLoader();

      Get.to(
        () => AddressList(), //next page class
        duration: Duration(
            milliseconds: 300), //duration of transitions, default 1 sec
        transition:
            // Transition.leftToRight //transition effect
            // Transition.fadeIn
            //Transition.size
            Transition.zoom,
      );

    }

    isLoading(false);
  }

  TextEditingController Name = TextEditingController();
  TextEditingController Mobile = TextEditingController();
  TextEditingController State = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController Area = TextEditingController();
  TextEditingController PinCode = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController OrderNo = TextEditingController();

  // late TextEditingController fullnameController,
  //     mobilenumberController,
  //     enterstateController,
  //     entercityController,
  //     enterareaController,
  //     enterhomeController,
  //     enterpinController;
  //
  // var fullname = '';
  // var mobilenumber = '';
  // var enterstate = '';
  // var entercity = '';
  // var enterarea = '';
  // var enterhome = '';
  // var enterpin = '';

  @override
  void onInit() {
    ///TODO: here address list................
    // _addressListController.addresListApi();
    super.onInit();
    Name;
    Mobile;
    State;
    City;
    Area;
    PinCode;
    Email;
    OrderNo;

    // fullnameController = TextEditingController();
    // mobilenumberController = TextEditingController();
    // enterstateController = TextEditingController();
    // entercityController = TextEditingController();
    // enterareaController = TextEditingController();
    // enterhomeController = TextEditingController();
    // enterpinController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // Name.dispose();
    // Mobile.dispose();
    // State.dispose();
    // City.dispose();
    // Area.dispose();
    // PinCode.dispose();
    // Email.dispose();
    // OrderNo.dispose();
  }

  @override
  void dispose() {
    //Get.delete<AddAdressController>();
    super.dispose();
    Name.dispose();
    Mobile.dispose();
    State.dispose();
    City.dispose();
    Area.dispose();
    PinCode.dispose();
    Email.dispose();
    OrderNo.dispose();
    AddAdressController();
  }

  String? validateFullname(String value) {
    if (value.length < 2) {
      return "";
    }
    return null;
  }

  String? validateMobile(String value) {
    if (value.length < 10) {
      return "";
    }
    return null;
  }

  String? validateState(String value) {
    if (value.length < 2) {
      return "";
    }
    return null;
  }

  String? validateCity(String value) {
    if (value.length < 2) {
      return "";
    }
    return null;
  }

  String? validateArea(String value) {
    if (value.length < 2) {
      return "";
    }
    return null;
  }

  String? validateHome(String value) {
    if (value.length < 2) {
      return "";
    }
    return null;
  }

  String? validatePin(String value) {
    if (value.length < 6) {
      return "";
    }
    return null;
  }

  void checkaddAdress() {
    //final isValid = AddressFormKey.currentState!.validate();
    if (AddressFormKey.currentState!.validate()) {
      postaddresssApi();


      ///TODO: here calling address liust..........
      // _addressListController.addresListApi();
    }
    AddressFormKey.currentState!.save();
  }
}
