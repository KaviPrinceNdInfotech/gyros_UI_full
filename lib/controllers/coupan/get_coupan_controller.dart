// import 'package:get/get.dart';
// import '../../models/get_coupan_model.dart';
// import '../../services/api_provider.dart';
//
// class GetCoupanController extends GetxController{
//
//
//   RxBool isLoading = true.obs;
//   GetCoupan? getCoupanList;
//
//   void getCoupanApi() async {
//     isLoading(true) ;
//     getCoupanList = await ApiProvider.GetCoupanApi();
//     if (getCoupanList != null
//     ) {
//       isLoading(false);
//     }
//   }
//
//   @override
//   onInit() {
//     getCoupanApi();
//     super.onInit();
//
//   }
//
//
//   @override
//   void dispose() {
//     Get.delete<GetCoupanController>();
//     super.dispose();
//   }
//
// }
//

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/get_coupan_model.dart';
import '../../services/api_provider.dart';
import '../../storage.dart';

class CoupanListController extends GetxController{
  RxBool isLoading = true.obs;
  GetCoupan? getaboutthecoupan;

  void coupanApi() async{
    isLoading(true);
    getaboutthecoupan = await ApiProvider.CoupanApi();
    if(getaboutthecoupan != null){
      isLoading(false);
    }
  }
  TextEditingController Companycoupon = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    coupanApi();
  }

  @override
  void dispose() {
    Get.delete<CoupanListController>();
    super.dispose();
    box.read('key');
  }
}
