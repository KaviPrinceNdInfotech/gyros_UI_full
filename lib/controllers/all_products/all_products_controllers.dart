import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gyros_app/models/all_product_model.dart';
import 'package:gyros_app/services/api_provider.dart';

class AllProductController extends GetxController {
  RxBool isLoading = true.obs;

  AllProductModel? allProductModel;

  void productsApi() async {
    isLoading(true);

    allProductModel = await ApiProvider.AllProductApi();
    if (allProductModel != null) {

      isLoading(false);

    }
  }

  @override
  void onInit() {
    productsApi();
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
