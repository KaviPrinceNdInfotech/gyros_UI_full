
//
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// import '../../models/wallet_model/wallet_model.dart';
// import '../../services/api_provider.dart';
//
// class walletController extends GetxController{
//   RxBool isLoading = true.obs;
//   WalletModel? getwalletlist;
//
//   void walletListssApi() async {
//     isLoading(true);
//     getwalletlist = await ApiProvider.walletAmountApi();
//     if (getwalletlist != null
//     //getcatagartlist!.result!.isNotEmpty
//     ) {
//       isLoading(false);
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     walletListssApi();
//   }
//
//   @override
//   void dispose() {
//     Get.delete<walletController>();
//     super.dispose();
//   }
// }

///Todos
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/wallet_model/wallet_model.dart';
import '../../services/api_provider.dart';

class WalletController extends GetxController{
  RxBool isLoading = true.obs;
  WalletModel? getwalletlist;

  void walletListssApi() async {
    isLoading(true);
    getwalletlist = await ApiProvider.walletAmountApi();
    if (getwalletlist != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    walletListssApi();
  }

  @override
  void dispose() {
    Get.delete<WalletController>();
    super.dispose();
  }

}