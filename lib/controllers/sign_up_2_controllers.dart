// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import '../../services/api_provider.dart';
//
// class UserProfileController extends GetxController {
//   RxBool isLoading = true.obs;
//   GlobalKey<FormState> signupform = GlobalKey(debugLabel: "signupform");
//   //OtpTimerController _timeController = Get.find();
//
//   void calluserProfileApi() async {
//     print(name.text);
//     http.Response r = await ApiProvider.addUserApi(
//       name.text,
//       number.text,
//       email.text,
//       selectedCity.value,
//       selectedState.value,
//     );
//     if (r.statusCode == 200) {
//       //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
//       //Get.to(()=> LoginPage());
//
//       //_timeController.email = email.text;
//       //_timeController.phoneNumber = number.text;
//       //Get.to(() => OTPPage());
//     }
//   }
//
//   //from here add member and add patient both ccontroller function ..............
//
//   TextEditingController name = TextEditingController();
//   TextEditingController number = TextEditingController();
//   TextEditingController email = TextEditingController();
//   //TextEditingController state = TextEditingController();
//   //TextEditingController city = TextEditingController();
//   TextEditingController referalCode = TextEditingController();
//
//   //this is City..........
//   Rx<String?> selectedCity = (null as String?).obs;
//
//   RxList<String> cities = <String>[].obs;
//
//   //This is State....................
//
//   Rx<String?> selectedState = (null as String?).obs;
//
//   RxList<String> states = <String>[].obs;
//   //................................
//
//   @override
//   void onInit() {
//     // stateCityMap.forEach((key, value) {
//     //   states.add(key);
//     // });
//     states.refresh();
//     super.onInit();
//   }
//
//   String? validatename(value) {
//     if (value == '') {
//       return ' please enter Name';
//     }
//     return null;
//   }
// }
