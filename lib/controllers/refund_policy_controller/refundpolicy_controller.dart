import 'package:get/get.dart';
import 'package:gyros_app/models/refund_policy_model.dart';
import 'package:gyros_app/services/api_provider.dart';

class RefundPolicyController extends GetxController {
  RxBool isLoading = true.obs;
  RefundpolicyModel? refundpolicyModels;

  void RefundApi() async {
    isLoading(true);

    refundpolicyModels = await ApiProvider.RefundPolicyApi();
    if (refundpolicyModels != null) {
      //Get.to(() => ItemDetailss());
      isLoading(false);

      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    RefundApi();
    //subcatidApi();
    super.onInit();
  }

  @override
  void onClose() {
    refundpolicyModels = null;
    super.onClose();
  }

  @override
  void dispose() {
    refundpolicyModels = null;
    super.dispose();
  }
}
