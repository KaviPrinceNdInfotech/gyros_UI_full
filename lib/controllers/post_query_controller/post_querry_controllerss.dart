import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gyros_app/controllers/otp_timer_controller/otp_timer_controllerss.dart';
import 'package:gyros_app/services/api_provider.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_navbar.dart';
import 'package:gyros_app/widgets/circular_loader.dart';
import 'package:http/http.dart' as http;

class PostQueryController extends GetxController {
  RxBool isLoading = true.obs;
  GlobalKey<FormState> postqueryforms = GlobalKey(debugLabel: "postqueryforms");
  NavController _navController = Get.put(NavController());

  OtpTimerController _timeController = Get.put(OtpTimerController());
  var Id = '';

  void postqueryApi() async {
    //isLoading(true);
    CallLoader.loader();
    print(Name.text);
    http.Response r = await ApiProvider.PostQueryApi(
      Name.text,
      Email.text,
      OrderNo.text,
      Message.text,
    );
    if (r.statusCode == 200) {
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
      //Get.to(()=> LoginPage());
      CallLoader.hideLoader();
      isLoading(false);
      _navController.tabindex(0);
      Get.to(() => NavBar());

      //_timeController.email = Email.text;
      //_timeController.phoneNumber = OrderNo.text;
    }
  }

  //from here add member and add patient both ccontroller function ..............

  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController OrderNo = TextEditingController();
  TextEditingController Message = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    Name;
    Email;
    OrderNo;
    Message;
    //postqueryApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    Name.dispose();
    Email.dispose();
    OrderNo.dispose();
    Message.dispose();
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

  String? validateOrderNo(String value) {
    if (value.length < 2) {
      return "Phone must be of 10 characters";
    }
    return null;
  }

  String? validateMessage(String value) {
    if (value.length < 2) {
      return "password should be 5 character";
    }
    return null;
  }

  void checkPostQuery() {
    if (postqueryforms.currentState!.validate()) {
      postqueryApi();
    }
    postqueryforms.currentState!.save();
  }
}
