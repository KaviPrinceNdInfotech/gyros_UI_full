import 'package:get/get.dart';
import 'package:gyros_app/catagary_list_by_id/catagary_list_by_id.dart';
import 'package:gyros_app/models/sub_cat_by_id_model.dart';
import 'package:gyros_app/services/api_provider.dart';

class SubCatByIdController extends GetxController {
  RxBool isLoading = true.obs;
  String catid = '';

  SubcatbyId? getcatbyid;

  void subcatidApi() async {
    isLoading(false);

    getcatbyid = await ApiProvider.getsubcatIdApi(catid.toString());
    if (getcatbyid != null) {
      Get.to(() => CatagaryListSubcatagary());
      isLoading(false);

      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    //subcatidApi();
    super.onInit();
  }

  @override
  void onClose() {
    getcatbyid = null;
    super.onClose();
  }

  @override
  void dispose() {
    getcatbyid = null;
    super.dispose();
  }
}
