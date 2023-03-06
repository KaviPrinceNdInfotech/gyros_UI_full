import 'package:get/get.dart';
import 'package:gyros_app/models/flash_product_descriptions_model.dart';
import 'package:gyros_app/services/api_provider.dart';

import '../../view/model_cart_practice/widgets/item_details_pageee/item_details_catagary.dart';

class FlashProductByIdController extends GetxController {
  RxBool isLoading = true.obs;
  RxInt selectedimg = 0.obs;
  String productid = '';

  FlashSaleProductDetailsModel? flashproductbyid;

  void flashproductbyIdApi() async {
    isLoading(false);

    flashproductbyid =
        await ApiProvider.getproductdetails(productid.toString());
    if (flashproductbyid != null) {
      Get.to(
        () => ItemDetailss(), //next page class
        duration: Duration(
            milliseconds: 300), //duration of transitions, default 1 sec
        transition:
            // Transition.leftToRight //transition effect
            // Transition.fadeIn
            //Transition.size
            Transition.zoom,
      );
      isLoading(false);

      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    //subcatidApi();
    super.onInit();
  }

  @override
  void onClose() {
    flashproductbyid = null;
    super.onClose();
  }

  @override
  void dispose() {
    flashproductbyid = null;
    super.dispose();
  }
}
