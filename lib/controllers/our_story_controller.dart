import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/our_story_model.dart';
import '../services/api_provider.dart';

class OurStoryController extends GetxController {
  RxBool isLoading = true.obs;

  OurStoryModel? ourStoryModel;

  void ourstoryApi() async {
    isLoading(true);

    ourStoryModel = await ApiProvider.OurStoryApi();
    if (ourStoryModel != null) {
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
    ourstoryApi();
    //subcatidApi();
    super.onInit();
  }

  @override
  void onClose() {
    ourStoryModel = null;
    super.onClose();
  }

  @override
  void dispose() {
    ourStoryModel = null;
    super.dispose();
  }
}
