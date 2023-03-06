import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:gyros_app/controllers/add_address_cotroller/add_adress_controller.dart';
import 'package:gyros_app/controllers/all_products/all_products_controllers.dart';
import 'package:gyros_app/controllers/blog_list_controller.dart';
import 'package:gyros_app/controllers/check_out_controller/check_out_controlles.dart';
import 'package:gyros_app/controllers/contact_us_controller/contact_us_controller.dart';
import 'package:gyros_app/controllers/forgot_email_code_controllers/forgot_email_cd_controllers.dart';
import 'package:gyros_app/controllers/get_profile/get_profile_controller.dart';
import 'package:gyros_app/controllers/gift_box_controller.dart';
import 'package:gyros_app/controllers/home_controllers/catagary_list_controller.dart';
import 'package:gyros_app/controllers/invoice_controller/invoice_controller.dart';
import 'package:gyros_app/controllers/login_controllerss/login_controllerssss.dart';
import 'package:gyros_app/controllers/phone_login_controllerr/phone_login_controllers.dart';
import 'package:gyros_app/controllers/post_query_controller/post_querry_controllerss.dart';
import 'package:gyros_app/controllers/refund_policy_controller/refundpolicy_controller.dart';
import 'package:gyros_app/controllers/reset_password/reset_ps_email_controllers.dart';
import 'package:gyros_app/controllers/rozar_pay_controller/rozar_pay_controller.dart';
import 'package:gyros_app/controllers/set_new_password/set_new_pswd_controller.dart';
import 'package:gyros_app/controllers/sign_up_controller/sign_up_controllers.dart';
import 'package:gyros_app/controllers/sub_catagary_controllers/sub_cat_id_controllers.dart';
import 'package:gyros_app/controllers/wallet/wallet_controller.dart';
import 'package:gyros_app/controllers/wallet_rozar_pay/wallet_post_controller.dart';
import 'package:gyros_app/controllers/wallet_rozar_pay/wallet_rozar_pay_controller.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:gyros_app/view/login_page/login_with_email/login_email_controller.dart';

import '../../view/cart_new_section/product_details/product_detail_controllerss/cart_new_controler.dart';
import '../../view/cart_new_section/product_details/product_detail_controllerss/fav_counter_controller.dart';
import '../../view/home_page/home_page_controller.dart';
import '../../view/login_page/login_otp/login_otp_timer_phone_email_controller.dart';
import '../../view/model_cart_practice/controllers/cart_controllersss.dart';
import '../address_list_controller/address_list_controllers.dart';
import '../all_products/search.dart';
import '../best_seller_controller.dart';
import '../coupan/get_coupan_controller.dart';
import '../coupan_post_controller/coupan_post_controller.dart';
import '../order_history_controller/order_history_controllers.dart';
import '../otp_timer_controller/otp_timer_controllerss.dart';
import '../our_story_controller.dart';
import '../post_order_controller/post_order_controller.dart';
import '../shipping_policy_controller/shipping_policy_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    //Get.put(IntroVideoBoxController());

    Get.put(CartNewController());
    Get.put(FavCounterController());
    Get.put(NavController());
    Get.put(RozarPayController());
    Get.put(LoginPageController());
    Get.put(SignUpPageController());
    Get.put(LoginMobileController());
    Get.put(AddAdressController());
    Get.put(ResetEmailController());
    Get.put(ForgotCodeController());
    Get.put(SetPasswordController());
    Get.put(CatagaryController());
    Get.put(HomePageController());
    Get.put(SubCatByIdController());
    Get.put(SubCatByIdController());
    Get.put(LoginEmailController());
    Get.put(OtpTimerController());
    Get.put(BlogListController());
    Get.put(GiftBoxController());
    Get.put(BestSellerController());
    Get.put(OurStoryController());
    Get.put(AllProductController());
    Get.put(ContactUsController());
    Get.put(PostQueryController());
    Get.put(AddressListController());
    Get.put(CheckoutController());
    Get.put(GetProfileController());
    Get.put(RefundPolicyController());
    Get.put(RefundPolicyController());
    Get.put(ShippingPolicyController());
    Get.put(OrderHistoryController());
    Get.put(PostOrderController());
    Get.put(LoginMobileController());
    Get.put(OtpTimerController1());
    Get.put(WalletController());
    Get.put(RozarwalletController());
    Get.put(WalletPostController());
    Get.put(CoupanListController());
    Get.put(CoupanPostController());
    Get.put(InvoiceController());
    Get.put(CartController());

    //Get.put(HomeController());

    //Get.put(CatagaryByIdController());
  }

// CartNewController _cartNewController = Get.put(CartNewController());
// FavCounterController _favCounterController = Get.put(FavCounterController());

}
