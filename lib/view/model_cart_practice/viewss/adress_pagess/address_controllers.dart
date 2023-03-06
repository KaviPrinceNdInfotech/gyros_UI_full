import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
  RxBool isLoading = true.obs;
  GlobalKey<FormState> addressform = GlobalKey();
  //OtpTimerController _timeController = Get.find();

  // void calluserProfileApi() async {
  //
  //   print(name.text);
  //   http.Response r = await ApiProvider.addUserApi(name.text,number.text,email.text,selectedCity.value,selectedState.value,);
  //   if(r.statusCode==200){
  //
  //     //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
  //     //Get.to(()=> LoginPage());
  //
  //     _timeController.email = email.text;
  //     _timeController.phoneNumber = number.text;
  //     Get.to(()=>OTPPage(
  //     ));
  //   }
  // }

  //from here add member and add patient both ccontroller function ..............

  TextEditingController Name = TextEditingController();
  TextEditingController Mobile = TextEditingController();
  TextEditingController State = TextEditingController();
  TextEditingController City = TextEditingController();
  //TextEditingController state = TextEditingController();
  //TextEditingController city = TextEditingController();
  TextEditingController Area = TextEditingController();
  TextEditingController Building = TextEditingController();
  TextEditingController Pin = TextEditingController();

  //this is City..........
  RxString selectedCity = 'Delhi'.obs;

  List<String> cities = ['Delhi', 'Mumbai'];

  //This is State....................

  RxString selectedState = 'Bihar'.obs;

  List<String> states = ['Bihar', 'Delhi', 'UP', 'MP'];
  //................................

  @override
  void onInit() {
    super.onInit();
  }

  String? validatename(value) {
    if (value == '') {
      return ' please enter Name';
    }
    return null;
  }

  CheckName() {
    var isValidate = addressform.currentState!.validate();
    if (!isValidate) {
      return;
    } else {
      // Get.to(()=> HomePage());
    }
    addressform.currentState!.save();
  }

  String? validateNumber(value) {
    if (value == '') {
      return ' please enter valid Number';
    }
    return null;
  }

  CheckNumber() {
    var isValidate = addressform.currentState!.validate();
    if (!isValidate) {
      return;
    } else {
      //Get.to(()=> HomePage());
    }
    addressform.currentState!.save();
  }

  String? validateEmail(value) {
    if (value == '') {
      return ' please enter valid State';
    }
    return null;
  }

  CheckState() {
    var isValidate = addressform.currentState!.validate();
    if (!isValidate) {
      return;
    } else {
      //Get.to(()=> HomePage());
    }
    addressform.currentState!.save();
  }
}
