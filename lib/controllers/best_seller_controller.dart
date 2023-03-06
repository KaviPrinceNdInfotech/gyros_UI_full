import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/best_seller_models.dart';
import '../services/api_provider.dart';

class BestSellerController extends GetxController {
  RxBool isLoading = true.obs;

  BestSellerModel? bestsellermodel;

  void giftboxApi() async {
    isLoading(true);

    bestsellermodel = await ApiProvider.BestSellerApi();
    if (bestsellermodel != null) {
      // Get.to(
      //   () => ItemDetailss(), //next page class
      //   duration: Duration(
      //       milliseconds: 400), //duration of transitions, default 1 sec
      //   transition:
      //       // Transition.leftToRight //transition effect
      //       // Transition.fadeIn
      //       //Transition.size
      //       Transition.zoom,
      // );
      isLoading(false);

      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    giftboxApi();
    //subcatidApi();
    super.onInit();
  }

  @override
  void onClose() {
    bestsellermodel = null;
    super.onClose();
  }

  @override
  void dispose() {
    bestsellermodel = null;
    super.dispose();
  }
}
