
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gyros_app/controllers/check_out_controller/check_out_controlles.dart';
import 'package:gyros_app/models/list_of_cart_model_api.dart';
import 'package:gyros_app/view/model_cart_practice/widgets/cart_product2.dart';
import 'package:gyros_app/widgets/circular_loader.dart';
import 'package:http/http.dart' as http;
import '../../models/checkout_model.dart';
import '../../services/api_provider.dart';
import '../../storage.dart';
import '../../view/home_page/profile/home_page_practice.dart';



class CoupanPostController extends GetxController{
  TextEditingController Companycoupon = TextEditingController();
  TextEditingController textfieldcoupon = TextEditingController();
  TextEditingController UserId = TextEditingController();
  var isVisible = true.obs;
  RxBool isLoading = true.obs;
  final GlobalKey<FormState> CupoonnFormKey =
  GlobalKey<FormState>(debugLabel: "CupponnFormKey");
 // GlobalKey<FormState> coupanform = GlobalKey(debugLabel: "coupanform");

  ///implement through Api in cart list get.........

  CartListModel? cartListModel;
  //late final CartListModel cartListModel;

  void CartListgApi() async {
    isLoading(true);

    cartListModel = await ApiProvider.GetCartApi();
    if (cartListModel != null) {
      //Get.to(() => ItemDetailss());
      isLoading(false);

      //Get.to(()=>Container());
    }
  }


  ///latest implement through Api in cart list get. by kumar prince 3 april 2023 new....start..

  CheckoutModel? checkoutModel;
  //late final CartListModel cartListModel;

  void getcheckoutApi() async {
    isLoading(true);

    checkoutModel = await ApiProvider.GetCheckoutApi();
    if (checkoutModel?.result?.totalPrice == null) {
      //Get.to(() => TotalPrice());
      isLoading(false);

      //Get.to(()=>Container());
    }
  }

  /// latest implement through Api in cart list get. by kumar prince 3 april 2023 new........end....


  void postcoupanApi() async {
    //CallLoader.loader();

    isLoading(true);
    http.Response r = await ApiProvider.PostCoupanApi(
      Companycoupon.text,
      UserId.text,
    );
    if (r.statusCode == 200) {
      ///new cuppon on 3 april 2023.........
          //CallLoader.hideLoader();
      getcheckoutApi();
      update();


      CartListgApi();
      update();

      print("jhfdkdjsh: ${Companycoupon.text}");
      isLoading(false);

      // Get.to(
      //       () => HomePagePractice(), //next page class
      //   duration: Duration(
      //       milliseconds: 300), //duration of transitions, default 1 sec
      //   transition:
      //
      //   Transition.zoom,
      // );
    }

   // isLoading(false);
  }
  // Post coupon textfield
  void postcoupantextfieldApi() async {
    //CallLoader.loader();

    isLoading(true);
    http.Response r = await ApiProvider.PostCoupanTextFieldApi(
      textfieldcoupon.text,
      UserId.text,
    );

    if (r.statusCode == 200) {
      //CallLoader.hideLoader();

      getcheckoutApi();
      update();


      CartListgApi();
      update();

      print("RRRRRRRRRRRRRRRRRRRRRRtext: ${textfieldcoupon.text}");
      // Get.to(
      //       () => HomePagePractice(), //next page class
      //   duration: Duration(
      //       milliseconds: 300), //duration of transitions, default 1 sec
      //   transition:
      //
      //   Transition.zoom,
      // );
    }

    isLoading(false);
  }



  void firstpostcoupanApi() async {
   // CallLoader.loader();

    isLoading(true);
    http.Response r = await ApiProvider.FirstPostCoupanApi(
      Companycoupon.text,
      UserId.text,
    );

    if (r.statusCode == 200) {
      //CallLoader.hideLoader();
      getcheckoutApi();
      update();


      CartListgApi();
      update();

      print("jhfdkdjsh: ${Companycoupon.text}");
      // Get.to(
      //       () => HomePagePractice(), //next page class
      //   duration: Duration(
      //       milliseconds: 300), //duration of transitions, default 1 sec
      //   transition:
      //
      //   Transition.zoom,
      // );
    }

    isLoading(false);
  }


  @override
  void onInit() {
    Companycoupon;
    textfieldcoupon;
    UserId;

    super.onInit();
    getcheckoutApi();
    CartListgApi();




  }

  @override
  void onReady() {
    //getcheckoutApi();
    super.onReady();
  }
  @override
  void onClose() {
    getcheckoutApi();
  }
  @override
  void dispose() {
   // getcheckoutApi();
    super.dispose();
    Companycoupon.dispose();
    textfieldcoupon.dispose();
    UserId.dispose();
    //getcheckoutApi();
    //box.read('key');
    CoupanPostController();
  }
  String? validateCoupan(String value) {
      if (value.length < 2) {
        return "";
    }
    return null;
  }
  void checkcoupontextfield() {
    //final isValid = AddressFormKey.currentState!.validate();
    if (textfieldcoupon.text.isEmpty) {
     Get.snackbar("Message", "Please fill TextField");
    }else{
      postcoupantextfieldApi();
      //CallLoader.loader();

      getcheckoutApi();
      update();


      CartListgApi();
      update();
      //CallLoader.hideLoader();
    }
  }
}