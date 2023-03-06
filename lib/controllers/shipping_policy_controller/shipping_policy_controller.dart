import 'package:get/get.dart';
import 'package:gyros_app/models/shipping_policy_model.dart';
import 'package:gyros_app/services/api_provider.dart';

class ShippingPolicyController extends GetxController {
  RxBool isLoading = true.obs;
  ShippingpolicyModel? shippingpolicyModel;

  void ShippingpolicyApi() async {
    isLoading(true);

    shippingpolicyModel = await ApiProvider.ShippingPolicyApi();
    if (shippingpolicyModel != null) {
      //Get.to(() => ItemDetailss());
      isLoading(false);

      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    ShippingpolicyApi();
    //subcatidApi();
    super.onInit();
  }

  @override
  void onClose() {
    shippingpolicyModel = null;
    super.onClose();
  }

  @override
  void dispose() {
    shippingpolicyModel = null;
    super.dispose();
  }
}
