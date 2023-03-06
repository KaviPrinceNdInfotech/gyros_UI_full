//
//
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:gyros_app/models/invoice_model/invoice_model.dart';
//
// import '../../models/wallet_model/wallet_model.dart';
// import '../../services/api_provider.dart';
//
// class InvoiceController extends GetxController{
//   RxBool isLoading = true.obs;
//   InvoiceModel? getinvoidelist;
//
//   void invoiceListssApi() async {
//     isLoading(true);
//     getinvoidelist = await ApiProvider.invoiceApi();
//     if (getinvoidelist != null) {
//       isLoading(false);
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     invoiceListssApi();
//   }
//
//   @override
//   void dispose() {
//     Get.delete<InvoiceController>();
//     super.dispose();
//   }
//
// }
//
//
//
