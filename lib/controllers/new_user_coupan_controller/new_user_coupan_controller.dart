import 'package:get/get.dart';

import '../../models/new_user_coupan_model/new_user_coupan_model.dart';
import '../../services/api_provider.dart';

class CoupanController extends GetxController{

  RxBool isLoading = true.obs;
  GetCoupanCode? getcoupanproduct;

  void newUserCoupanApi() async{
    isLoading(true);
    getcoupanproduct = await ApiProvider.NewUserCoupanApi();
    if(getcoupanproduct != null){
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    newUserCoupanApi();
  }

  @override
  void dispose() {

    super.dispose();
  }
}