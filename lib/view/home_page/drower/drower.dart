import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_navbar.dart';
import 'package:gyros_app/view/botttom_nav_bar/whats_app_tracking_page.dart';
import 'package:gyros_app/view/home_page/drower/drower_page/gift_box.dart';
import 'package:gyros_app/view/home_page/drower/drower_page/our_story/our_stories.dart';
import 'package:gyros_app/view/login_page/login_pagee.dart';
import 'package:gyros_app/view/order_confirmation_screens/order_confirmation.dart';
import 'package:sizer/sizer.dart';
import '../../../controllers/get_profile/get_profile_controller.dart';
import '../../../controllers/wallet/wallet_controller.dart';
import '../../../controllers/wallet_rozar_pay/wallet_post_controller.dart';
import '../../wallet.dart';
import '../../wave_view_tracking/wave_views_trackings.dart';
import 'drower_page/blogs/my_blogs.dart';
import 'drower_page/profile_page_personal/personal_profile_page.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NavController _navController = Get.put(NavController(), permanent: true);
    GetProfileController _getProfileController = Get.put(GetProfileController());
    WalletController _walletController = Get.put(WalletController());
    //GetProfileController _getProfileController = Get.put(GetProfileController());

    WalletPostController _walletPostController = Get.put(WalletPostController());
    //_walletController.walletListssApi();


    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Image.asset('lib/assets/asset/guser_logo.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: AppColors.themecolors,
              ),
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.local_mall,
                color: Colors.black,
                size: 14.sp,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11.sp,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text(
                'Shop',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
              ),
              // tileColor: Get.currentRoute == '/AllProducts'
              //     ? Colors.grey[300]
              //     : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                _navController.tabindex(1);
                Get.to(() => NavBar());

                //Get.to(() => AllProducts());
                Get.offNamed('/NavBar');
              },
            ),
            ListTile(
              // horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.local_offer,
                color: Colors.black,
                size: 14.sp,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11.sp,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Best Deal',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  // Get.currentRoute == '/NavBar'
                  //     ? Colors.grey[300]
                  //     :
                  Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                _navController.tabindex(3);
                Get.to(() => NavBar());
                //Get.to(() => BestDeal());
                Get.offNamed('/NavBar');
              },
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.card_giftcard_outlined,
                color: Colors.black,
                size: 14.sp,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11.sp,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Gift Boxes',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/GiftBox' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => GiftBox());
                Get.offNamed('/GiftBox');
              },
            ),
            ListTile(
              // horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.history_edu_outlined,
                color: Colors.black,
                size: 14.sp,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11.sp,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Our Story',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/OurStory' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => OurStory());
                Get.offNamed('/OurStory');
              },
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.account_box_outlined,
                color: Colors.black,
                size: 14.sp,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11.sp,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Blogs',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/Blogss' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                //Get.back();
                Get.to(() => Blogss());
                Get.offNamed('/Blogss');
              },
              //
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.web,
                color: Colors.black,
                size: 14.sp,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11.sp,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Website',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/WhatsAppTrackOrder'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => WhatsAppTrackOrder());
                Get.offNamed('/WhatsAppTrackOrder');
              },
            ),
            ListTile(
              // horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.track_changes_sharp,
                color: Colors.black,
                size: 14.sp,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11.sp,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Traceability',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/WebViewTracking'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => WebViewTracking());
                //WaveViewHomePage(title: appName));
                //Tracking());
                Get.offNamed('/WebViewTracking');
              },
            ),

            ///here from profileeee...............................
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.account_circle,
                color: Colors.black,
                size: 14.sp,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11.sp,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/PersonalProfile'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                ///.................................................28feb....................new
                _getProfileController.addressidApi();
                _getProfileController.update();
                ///........................................................................................

                Get.to(() => PersonalProfile());
                Get.offNamed('/PersonalProfile');
              },
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.local_shipping_rounded,
                color: Colors.black,
                size: 14.sp,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11.sp,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'View order',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/OrderConfirmationPage'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);

                Get.back();
                ///.................................................28feb....................new
                _getProfileController.OrderHistoryApi();
                _getProfileController.update();
                ///........................................................................................
                Get.to(() => OrderConfirmationPage());
                Get.offNamed('/OrderConfirmationPage');
              },
            ),

            /// wallet
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.money,
                color: Colors.black,
                size: 14.sp,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11.sp,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Wallet',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/Wallet' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);

                Get.to(() => Wallet());
                Get.offNamed('/Wallet');
                ///.................................................28feb....................new
                _walletController.walletListssApi();
                _walletController.update();
                ///......................................................................................................
                // tileColor: Get.currentRoute == '/OrderConfirmationPage'
                //     ? Colors.grey[300]
                //     : null,
                // onTap: () {
                //   print(Get.currentRoute);
                //   Get.to(() => OrderConfirmationPage());
                //   Get.offNamed('/OrderConfirmationPage');
              },
            ),
            ListTile(
              // horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.login,
                color: Colors.black,
                size: 14.sp,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11.sp,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/LoginPage' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);

                GetStorage prefs = GetStorage();
                prefs.erase();
                //prefs.remove('email');

                Get.to(() => LoginPage());
                Get.offNamed('/LoginPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
