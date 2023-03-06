
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import '../../services/api_provider.dart';
import '../../view/home_page/profile/home_page_practice.dart';

////Post coupan api

class NewCartController extends GetxController{
  var isVisible = true.obs;
  RxBool isLoading = true.obs;


  void newAddToCartApi(var Id, var Pkt, var Qty, var Price, var Count, var FinalAmount,) async {
    isLoading(true);
    http.Response r = await ApiProvider.NewAddToCartApi(
      Id.text,
      Pkt.text,
      Qty.text,
      Price.text,
      Count.text,
      FinalAmount.text,
    );
    if (r.statusCode == 200) {
      Get.to(
            () => HomePagePractice(), //next page class
        duration: Duration(
            milliseconds: 300), //duration of transitions, default 1 sec
        transition:

        Transition.zoom,
      );
    }

    isLoading(false);
  }



  TextEditingController Id = TextEditingController();
  TextEditingController Pkt = TextEditingController();
  TextEditingController Qty = TextEditingController();
  TextEditingController Price = TextEditingController();
  TextEditingController Count = TextEditingController();
  TextEditingController FinalAmount = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    Id;
    Pkt;
    Qty;
    Price;
    Count;
    FinalAmount;
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
    Id.dispose();
    Pkt.dispose();
    Qty.dispose();
    Price.dispose();
    Count.dispose();
    FinalAmount.dispose();
  }
}