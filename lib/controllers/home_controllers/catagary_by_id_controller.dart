// import 'package:get/get.dart';
// import 'package:gyros_app/models/catagary_list_by_id_model.dart';
// import 'package:gyros_app/services/api_provider.dart';
//
// class CatagaryByIdController extends GetxController {
//   RxBool isLoading = true.obs;
//   var catagaryid = '';
//   CatagaryListModel? getcatagarybyid;
//
//   void callApi() async {
//     getcatagarybyid = null;
//     print(catagaryid.toString());
//     getcatagarybyid = await ApiProvider.getcatnameIdApi(catagaryid.toString());
//     if (getcatagarybyid != null) {
//       // Get.to(()=> Container());
//
//       isLoading(false);
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void dispose() {
//     getcatagarybyid = null;
//     super.dispose();
//   }
// }
