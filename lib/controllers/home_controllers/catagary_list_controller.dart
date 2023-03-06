import 'package:get/get.dart';
import 'package:gyros_app/models/catagary_list_model.dart';

class CatagaryController extends GetxController {
  RxBool isLoading = true.obs;
  CatagaryListModels? getcatagary;

  void callApi() async {
    //getcatagary = await ApiProvider.getallategaryApi();

    if (getcatagary != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    callApi();
    super.onInit();
  }
}
