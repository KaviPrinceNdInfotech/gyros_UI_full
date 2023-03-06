//PrivecyPolicyApi

import 'package:get/get.dart';
import 'package:gyros_app/models/privecy_policy_model.dart';
import 'package:gyros_app/services/api_provider.dart';

class PrivecyPolicyController extends GetxController {
  RxBool isLoading = true.obs;

  PrivecypolicyModel? privecypolicyModel;

  void PrivecyPolicyApi() async {
    isLoading(true);

    privecypolicyModel = await ApiProvider.PrivecyPolicyApi();
    if (privecypolicyModel != null) {
      //Get.to(() => ItemDetailss());
      isLoading(false);

      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    PrivecyPolicyApi();
    //subcatidApi();
    super.onInit();
  }

  @override
  void onClose() {
    privecypolicyModel = null;
    super.onClose();
  }

  @override
  void dispose() {
    privecypolicyModel = null;
    super.dispose();
  }
}
