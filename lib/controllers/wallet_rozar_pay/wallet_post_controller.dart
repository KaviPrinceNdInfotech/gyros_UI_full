import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gyros_app/controllers/wallet/wallet_controller.dart';
import 'package:gyros_app/services/api_provider.dart';
import 'package:gyros_app/view/wallet.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../view/home_page/profile/home_page_practice.dart';
import '../../widgets/circular_loader.dart';

class WalletPostController extends GetxController {

  RxBool isLoading = true.obs;
  var Id = '';
  final GlobalKey<FormState> walletamountFormKey = GlobalKey();
  TextEditingController amount = TextEditingController();



///this is new 2
//   Future<int> walletPostApi() async {
//     //isLoading(true);
//     CallLoader.loader();
//    // print(ProductName.text);
//     http.Response r = await ApiProvider.WalletPostApi(
//         UserId.text,
//         Money.text
//     );
//     if (r.statusCode == 200) {
//       Get.to(
//             () => HomePagePractice(), //next page class
//         duration: Duration(
//             milliseconds: 300), //duration of transitions, default 1 sec
//         transition:
//
//         Transition.zoom,
//       );
//       //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
//       //Get.to(()=> LoginPage());
//       CallLoader.hideLoader();
//       isLoading(false);
//       //_navController.tabindex(0);
//       // Get.to(() => NavBar());
//
//       //_timeController.email = Email.text;
//       //_timeController.phoneNumber = OrderNo.text;
//     }
//     return r.statusCode;
//   }
  ///.......................lower method is commented on 28 feb .................by rahul
  Future<int> walletPostApi() async {
    isLoading(true);
    http.Response r = await ApiProvider.WalletPostApi(
      UserId.text,
        Money.text
    );
    if (r.statusCode == 200) {
      ///TODO: we can navigate directly this page through this navigation with add to cart with Id.
      Get.to(
            () => HomePagePractice(), //next page class
        duration: Duration(
            milliseconds: 300), //duration of transitions, default 1 sec
        transition:

        Transition.zoom,
      );
    }
    isLoading(false);
    //todo///////01/03
    return r.statusCode;
  }
  ///............................................................................................
  ///
  ///
  ///.......................lower method is commented on 28 feb .................by rahul
  Future<int> walletPostUpdateApi() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    //p.setString("rrrrrrrrrr4567", "${_checkoutController.checkoutModel?.result?.totalCost.toString()}");
    var  v=p.getString("rrrrrrrrrr4567");
    print("object3&&&&&&&&&&&&&&&:${v}");
    isLoading(true);
    http.Response r = await ApiProvider.WalletPostUpdateApi(
        UserId.text,
        v,
    );
    if (r.statusCode == 200) {
      ///TODO: we can navigate directly this page through this navigation with add to cart with Id.
      // Get.to(
      //       () => HomePagePractice(), //next page class
      //   duration: Duration(
      //       milliseconds: 300), //duration of transitions, default 1 sec
      //   transition:
      //
      //   Transition.zoom,
      // );
    }else if (r.statusCode == 400) {
      // Get.to(
      //       () => Wallet(), //next page class
      //   duration: Duration(
      //       milliseconds: 300), //duration of transitions, default 1 sec
      //   transition:
      //
      //   Transition.zoom,
      // );
      Get.snackbar('message', r.body);
    }
    isLoading(false);
    //todo///////01/03
    return r.statusCode;
  }
  ///............................................................................................
  TextEditingController UserId = TextEditingController();
  TextEditingController Money = TextEditingController();
  TextEditingController walletAmount = TextEditingController();

 // TextEditingController amount = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    UserId;
    Money;
    walletAmount;
    //amount;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
  }

  @override
  void dispose() {
    super.dispose();
    UserId.dispose();
    Money.dispose();
  }

  String? validateAmount(value) {
    if (value == '') {
      return "Select Amount";
    }
    return null;
  }

  void checkAmount() {

    if (walletamountFormKey.currentState!.validate()) {
      walletPostApi();
      walletPostUpdateApi();
    }
    walletamountFormKey.currentState!.save();
  }
  void checkupdateAmount() {

    if (walletamountFormKey.currentState!.validate()) {
      walletPostUpdateApi();
    }
    walletamountFormKey.currentState!.save();
  }

}



///////////////
// static LoginEmailApi(var Email,
//     var PassWord,) async {
//   var url = baseUrl + 'api/AdminApi/LoginWithEmail';
//
//   var body = {
//     "Email": Email,
//     "PassWord": PassWord,
//   };
//   print(body);
//   http.Response r = await http.post(
//     Uri.parse(url), body: body,
//     //headers: headers
//   );
//   print(r.body);
//   if (r.statusCode == 200) {
//     var prefs = GetStorage();
//     //saved id..........
//     prefs.write("Id".toString(), json.decode(r.body)['Id']);
//     Id = prefs.read("Id").toString();
//     print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');
//
//     //saved token.........
//     prefs.write("token".toString(), json.decode(r.body)['token']);
//     token = prefs.read("token").toString();
//     print(token);
//     return r;
//   } else if (r.statusCode == 401) {
//     Get.snackbar('message', r.body);
//   } else {
//     Get.snackbar('Error', r.body);
//     return r;
//   }
// }
























