import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


import '../../models/tried_model.dart';
import '../../services/api_provider.dart';


class TriedProductController extends GetxController {
  RxBool isLoading = true.obs;

  TriedProduct? allProductModel;

  void triedproductsApi() async {
    isLoading(true);

    allProductModel = await ApiProvider.TriedProductApi();
    if (allProductModel != null) {
      print('bjbcjkdsbckjsd: $allProductModel');
      isLoading(false);

    }
  }

  @override
  void onInit() {
    triedproductsApi();
    //subcatidApi();
    super.onInit();
  }

  @override
  void onClose() {
    allProductModel = null;
    super.onClose();
  }

  @override
  void dispose() {
    allProductModel = null;
    super.dispose();
  }
}
