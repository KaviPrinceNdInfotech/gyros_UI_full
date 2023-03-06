import 'dart:io';
import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gyros_app/controllers/invoice_controller/invoice_controller.dart';
import 'package:gyros_app/controllers/wallet/wallet_controller.dart';
import 'package:gyros_app/controllers/wallet_rozar_pay/wallet_post_controller.dart';
import 'package:gyros_app/controllers/wallet_rozar_pay/wallet_rozar_pay_controller.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:gyros_app/view/cart_new_section/product_details/product_detail_controllerss/cart_new_controler.dart';
import 'package:gyros_app/view/cart_new_section/product_details/product_detail_controllerss/fav_counter_controller.dart';
import 'package:gyros_app/view/home_page/home_page_controller.dart';
import 'package:gyros_app/view/login_page/login_otp/login_otp_timer_phone_email_controller.dart';
import 'package:gyros_app/view/login_page/login_with_email/login_email_controller.dart';
import 'package:gyros_app/view/splash_screenss/splash_screen.dart';
import 'package:sizer/sizer.dart';

import 'controllers/all_products/all_products_controllers.dart';
import 'controllers/best_seller_controller.dart';
import 'controllers/binding_controllers/binding_controllers.dart';
import 'controllers/blog_list_controller.dart';
import 'controllers/cart_controllers.dart';
import 'controllers/check_out_controller/check_out_controlles.dart';
import 'controllers/contact_us_controller/contact_us_controller.dart';
import 'controllers/coupan/get_coupan_controller.dart';
import 'controllers/coupan_post_controller/coupan_post_controller.dart';
import 'controllers/forgot_email_code_controllers/forgot_email_cd_controllers.dart';
import 'controllers/get_profile/get_profile_controller.dart';
import 'controllers/gift_box_controller.dart';
import 'controllers/home_controllers/catagary_list_controller.dart';
import 'controllers/login_controllerss/login_controllerssss.dart';
import 'controllers/order_history_controller/order_history_controllers.dart';
import 'controllers/otp_timer_controller/otp_timer_controllerss.dart';
import 'controllers/our_story_controller.dart';
import 'controllers/phone_login_controllerr/phone_login_controllers.dart';
import 'controllers/post_order_controller/post_order_controller.dart';
import 'controllers/post_query_controller/post_querry_controllerss.dart';
import 'controllers/refund_policy_controller/refundpolicy_controller.dart';
import 'controllers/reset_password/reset_ps_email_controllers.dart';
import 'controllers/rozar_pay_controller/rozar_pay_controller.dart';
import 'controllers/set_new_password/set_new_pswd_controller.dart';
import 'controllers/shipping_policy_controller/shipping_policy_controller.dart';
import 'controllers/sign_up_controller/sign_up_controllers.dart';
import 'controllers/sub_catagary_controllers/sub_cat_id_controllers.dart';
import 'models/all_product_model.dart';
import 'models/best_seller_models.dart';
import 'models/gift_box_model.dart';
import 'models/list_of_cart_model_api.dart';
//
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
   // Get.lazyPut(() => AllProductModel());
    Get.lazyPut(() => GiftcardModel());
    //Get.lazyPut(() => BestSellerModel());
    // Get.lazyPut(() => CartListModel());
   // Get.lazyPut(() => CartListModel());
    Get.lazyPut(() => CartNewController());
    Get.lazyPut(() => FavCounterController());
    Get.lazyPut(() => NavController());
    Get.lazyPut(() => RozarPayController());
    Get.lazyPut(() => LoginPageController());
    Get.lazyPut(() => SignUpPageController());
    Get.lazyPut(() => LoginMobileController());
    // Get.lazyPut(() => AddAdressController());
    Get.lazyPut(() => ResetEmailController());
    Get.lazyPut(() => ForgotCodeController());
    Get.lazyPut(() => SetPasswordController());
    Get.lazyPut(() => CatagaryController());
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => SubCatByIdController());
    Get.lazyPut(() => SubCatByIdController());
    Get.lazyPut(() => LoginEmailController());
    Get.lazyPut(() => OtpTimerController());
    Get.lazyPut(() => BlogListController());
    Get.lazyPut(() => GiftBoxController());
    Get.lazyPut(() => BestSellerController());
    Get.lazyPut(() => OurStoryController());
    Get.lazyPut(() => AllProductController());
    Get.lazyPut(() => ContactUsController());
    Get.lazyPut(() => PostQueryController());
    // Get.lazyPut(() => AddressListController());
    Get.lazyPut(() => CheckoutController());
    Get.lazyPut(() => GetProfileController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => RefundPolicyController());
    Get.lazyPut(() => RefundPolicyController());
    Get.lazyPut(() => ShippingPolicyController());
    Get.lazyPut(() => PostQueryController());
    Get.lazyPut(() => OrderHistoryController());
    Get.lazyPut(() => PostOrderController());
    Get.lazyPut(() => LoginMobileController());
    Get.lazyPut(() => OtpTimerController1());
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => RozarwalletController());
    Get.lazyPut(() => WalletPostController());
    Get.lazyPut(() => CoupanListController());
    Get.lazyPut(() => CoupanPostController());
    Get.lazyPut(() => InvoiceController());
    Get.lazyPut(() => CartController());

    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  // await Firebase.initializeApp(
  //   //options: DefaultFirebaseOptions.currentPlatform,
  // );
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) async {
    await GetStorage.init();
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  static final String title = 'Invoice';

  //late CartController controller = Get.put(CartController());

  // CartNewController _cartNewController = Get.put(CartNewController());
  // FavCounterController _favCounterController = Get.put(FavCounterController());

  MyApp({Key? key}) : super(key: key);
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: analytics);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Widget SplashScreen = SplashScreenView(
    //   navigateRoute:
    //
    //       //SplashPage(),
    //       //DrawerPracticee(),
    //       // OnboardingPage(),
    //       LoginPage(),
    //   //HomePage(),
    //   // SignUp(),
    //   //NavBar(),
    //   duration: 6500,
    //   imageSize: 100,
    //   backgroundColor: Colors.white,
    // );

    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        ///this is the remove part because binding is not working..
        initialBinding: ControllerBinding(),
        //getPages: AppPages.routs,
        //initialRoute: Routs.INITIAL,
        debugShowCheckedModeBanner: false,

        ///todo theme mode......................
        //themeMode: ThemeMode.system,
        //title: 'Book Appointment',
        ///todo here theme light and dart you have to uncomments

        //theme: MyTheme.lightTheme(context),
        //darkTheme: MyTheme.darkTheme(context),

        home:
            //SplashView(),
            SplashScreen(),
      );
    });
  }
}

///gyros 27-01-2023