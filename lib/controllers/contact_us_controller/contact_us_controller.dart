import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gyros_app/models/contact_us_model.dart';
import 'package:gyros_app/services/api_provider.dart';

class ContactUsController extends GetxController {
  RxBool isLoading = true.obs;

  ContactUsModel? contactUsModel;

  void contactusApi() async {
    isLoading(true);

    contactUsModel = await ApiProvider.ContactUsApi();
    if (contactUsModel != null) {
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

      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    contactusApi();
    //subcatidApi();
    super.onInit();
  }

  @override
  void onClose() {
    contactUsModel = null;
    super.onClose();
  }

  @override
  void dispose() {
    contactUsModel = null;
    super.dispose();
  }
}
