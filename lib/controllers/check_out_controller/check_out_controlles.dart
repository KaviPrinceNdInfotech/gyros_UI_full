import 'package:get/get.dart';
import 'package:gyros_app/models/checkout_address_model.dart';
import 'package:gyros_app/models/checkout_model.dart';
import 'package:gyros_app/services/api_provider.dart';
import 'package:gyros_app/view/model_cart_practice/widgets/cart_total.dart';

class CheckoutController extends GetxController {
  RxBool isLoading = true.obs;

  String addressid = '';

  AdressbyidModel? getaddressbyid;
  CheckoutModel? checkoutModel;

  void addressidApi() async {
    isLoading(true);

    getaddressbyid = await ApiProvider.getaddressIdApi(addressid.toString());
    if (getaddressbyid != null) {

      Get.to(() => TotalPrice());
      isLoading(false);

      //Get.to(()=>Container());
    }
  }

  ///todo from here checkout model value..............

  void getcheckoutApi() async {
    isLoading(true);

    checkoutModel = await ApiProvider.GetCheckoutApi();
    if (checkoutModel?.result?.totalPrice == null) {
      //Get.to(() => TotalPrice());
      isLoading(false);

      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    getcheckoutApi();
    addressidApi();
    super.onInit();
  }

  @override
  void onClose() {
    getaddressbyid = null;
    checkoutModel = null;
    super.onClose();
  }

  @override
  void dispose() {
    getaddressbyid = null;
    checkoutModel = null;
    super.dispose();
  }
}
