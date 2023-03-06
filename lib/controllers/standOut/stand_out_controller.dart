import 'package:get/get.dart';
import 'package:gyros_app/services/api_provider.dart';

import '../../models/about_the_product_model.dart';
import '../../models/stand_out_model.dart';

class StandOutController extends GetxController{

  RxBool isLoading = true.obs;

  StandOut? getstandoutpoints;

  void standoutApi() async{

    isLoading(true);
    getstandoutpoints = await ApiProvider.StandOutApi();
    if(getstandoutpoints != null){
      isLoading(false);

    }
  }


  @override
  void onInit() {
    super.onInit();
    standoutApi();
  }

  @override
  void dispose() {
    Get.delete<StandOutController>();
    super.dispose();
  }

}