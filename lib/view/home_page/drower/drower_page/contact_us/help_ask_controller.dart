import 'package:get/state_manager.dart';

class HelpAskController extends GetxController {
  RxBool isTextFiledFocus = false.obs;

  toogle() {
    isTextFiledFocus.value = isTextFiledFocus as bool;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
