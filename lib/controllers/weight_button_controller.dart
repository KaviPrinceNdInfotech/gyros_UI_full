import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../services/api_provider.dart';


class WeightButtonController extends GetxController{
  RxBool isLoading = true.obs;
  RxInt selectedimg = 0.obs;
  RxInt selectedsingleimg = 0.obs;

  GlobalKey<FormState> weightform = GlobalKey();
  void WeightButtonApi() async {
    // CallLoader.loader();
    // print(Name.text);
    http.Response r = await ApiProvider.weightButtonApi(
      Id.text,
      Pkt.text,
      Qty.text,
      Price.text,
      Count.text,
      FinalAmount.text,
    );
    if (r.statusCode == 200) {

      // CallLoader.hideLoader();

      //Get.to(() => LoginPage());


    }
  }

  TextEditingController Id = TextEditingController();
  TextEditingController Pkt = TextEditingController();
  TextEditingController Email_Id = TextEditingController();
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
    Id.dispose();
    Pkt.dispose();
    Qty.dispose();
    Price.dispose();
    Count.dispose();
    FinalAmount.dispose();
  }

  void weightButton() {
    if (weightform.currentState!.validate()) {
      WeightButtonApi();
    }
    weightform.currentState!.save();
  }

}