import 'package:get/get.dart';
import 'package:gyros_app/models/get_profile_model.dart';
import 'package:gyros_app/models/order_history_model.dart';
import 'package:gyros_app/services/api_provider.dart';

class GetProfileController extends GetxController {
  RxBool isLoading = true.obs;

  GetprofileModel? getprofileModel;
  OrderHistoryModel? orderHistoryModel;

  void addressidApi() async {
    isLoading(true);

    getprofileModel = await ApiProvider.GetProfileApi();
    if (getprofileModel?.result != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);

      //Get.to(()=>Container());
    }
  }

  ///TODO: from here order history......api
  void OrderHistoryApi() async {
    isLoading(false);

    orderHistoryModel = await ApiProvider.GetHistoryApi();
    print("I am checking here");
    print(orderHistoryModel);
    if (orderHistoryModel?.result != null) {
      //Get.to(() => TotalPrice());
      isLoading(true);

      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    super.onInit();
    addressidApi();
    OrderHistoryApi();
  }

  @override
  void onClose() {
    getprofileModel = null;
    //orderHistoryModel = null;
    //getorderhistorymodel = null;
    super.onClose();
  }

  @override
  void dispose() {
    getprofileModel = null;
    //orderHistoryModel = null;
    //getorderhistorymodel = null;
    super.dispose();
  }
}
