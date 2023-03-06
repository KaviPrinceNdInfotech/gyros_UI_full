import 'package:get/get.dart';
import 'package:gyros_app/models/order_history_model.dart';
import 'package:gyros_app/services/api_provider.dart';

class OrderHistoryController extends GetxController {
  RxBool isLoading = true.obs;

  OrderHistoryModel? orderHistoryModel;

  void orderHistoryApi() async {
    isLoading(false);

    orderHistoryModel = await ApiProvider.GetHistoryApi();
    if (orderHistoryModel != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);

      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    orderHistoryApi();

    super.onInit();
  }

  @override
  void onClose() {
    orderHistoryModel = null;
    super.onClose();
  }

  @override
  void dispose() {
    orderHistoryModel = null;
    super.dispose();
  }
}

///todo from here checkout model value..............
