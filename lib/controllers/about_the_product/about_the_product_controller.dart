import 'package:get/get.dart';
import 'package:gyros_app/services/api_provider.dart';

import '../../models/about_the_product_model.dart';

class AboutProductController extends GetxController{

  RxBool isLoading = true.obs;
  String PrdId = '';
  AllDetail? getabouttheproduct;

  void aboutTheProductApi() async{
    isLoading(true);
    getabouttheproduct = await ApiProvider.AboutTheProductApi(PrdId.toString());
    if(getabouttheproduct != null){
      isLoading(false);
    }
  }


  @override
  void onInit() {
    super.onInit();
    aboutTheProductApi();
  }

  @override
  void dispose() {
    Get.delete<AboutProductController>();
    super.dispose();
  }

}