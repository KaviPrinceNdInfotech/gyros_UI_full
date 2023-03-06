import 'package:get/get.dart';
import 'package:gyros_app/models/all_address_list_model.dart';
import 'package:gyros_app/services/api_provider.dart';

class AddressListController extends GetxController {
  //RxInt selectedIndex = 0.obs;

  //void toggle(int index) => selectedIndex.value = index;

  RxBool isLoading = true.obs;

  AddaddressModel? addaddressModel;

  void addresListApi() async {
    isLoading(true);
    //CallLoader.loader();

    addaddressModel = await ApiProvider.AddressListApi();
    if (addaddressModel != null) {
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
      //update();

      ///Todo: here changed...........nov 11
      //Get.off(AddAddress());

      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    addresListApi();
    //subcatidApi();
    super.onInit();
  }

  @override
  void onClose() {
    //addaddressModel = null;
    super.onClose();
  }

  @override
  void dispose() {
    //addaddressModel = null;
    super.dispose();
  }
}
