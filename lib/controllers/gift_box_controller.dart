import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/gift_box_model.dart';
import '../services/api_provider.dart';

class GiftBoxController extends GetxController {
  RxBool isLoading = true.obs;

  GiftcardModel? giftcardModel;

  void giftboxApi() async {
    isLoading(false);

    giftcardModel = await ApiProvider.GiftBoxApi();
    if (giftcardModel != null) {
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
    giftcardModel = null;
    super.onClose();
  }

  @override
  void dispose() {
    giftcardModel = null;
    super.dispose();
  }
}
