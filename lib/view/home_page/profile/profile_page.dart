import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/privecy_policy/privecy_policyyy.dart';
import 'package:gyros_app/shiping_policy/shipping_policyyy.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_navbar.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/view/home_page/drower/drower_page/contact_us/help_supportss.dart';
import 'package:gyros_app/view/login_page/login_pagee.dart';
import 'package:gyros_app/view/refund_policy/refund_policy.dart';
import 'package:sizer/sizer.dart';

import '../../order_confirmation_screens/order_confirmation.dart';

//import 'main_screen_details.dart';

class ProfilePages extends StatelessWidget {
  ProfilePages({Key? key}) : super(key: key);

  NavController _navController = Get.put(NavController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        //decoration: BoxDecoration(gradient: gradient3),
        child: Container(
          decoration: BoxDecoration(
              //color: Color(0xffd0f5b0)
               color: Color(0xffE8F9FD)
            //gradient: MyTheme.gradient1,
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 5.h,
              ),

              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                dense: true,
                visualDensity: VisualDensity(horizontal: 0, vertical: 3),
                leading: Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Icon(Icons.home),
                ),
                // Icon(
                //   Icons.home,
                //   size: 12.sp,
                //   color: Colors.black,
                // ),
                title: Text(
                  'Home',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 9.sp,
                  color: Colors.black,
                ),
                onTap: () {
                  ///Get.to(PaymentPage());
                  //Get.to(StepperDemo());

                  ///here home return......
                  _navController.tabindex(0);
                  Get.to(() => NavBar());

                  ///Todo: cart practice......
                  // Get.to(() => CatalogScreen());
                  //_bottomController.tabindex(0);
                  //Get.to(() => ShoppingPage());
                  //MainPage());

                  //Todo if you want to go with any page in nav bar

                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => NavBar()));
                }, //PersonalDetails
              ),

              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                dense: true,
                visualDensity: VisualDensity(horizontal: 0, vertical: 3),
                leading: Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Icon(Icons.policy),
                ),
                title: Text(
                  'Refund Policy',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 9.sp,
                  color: Colors.black,
                ),
                onTap: () {
                  Get.to(() => RefundPolicy());
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //         //ProductScreen()));
                  //         AllProduct()));
                }, //PersonalDetails
              ),

              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                dense: true,
                visualDensity: VisualDensity(horizontal: 0, vertical: 3),
                leading: Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Icon(Icons.local_shipping_rounded),
                ),
                title: Text(
                  'Shipping Policy',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 9.sp,
                  color: Colors.black,
                ),
                onTap: () {
                  Get.to(() => ShippingPolicy());
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //         //ProductScreen()));
                  //         AllProduct()));
                }, //PersonalDetails
              ),

              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                dense: true,
                visualDensity: VisualDensity(horizontal: 0, vertical: 3),
                leading: Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Icon(Icons.privacy_tip_rounded),
                ),
                title: Text(
                  'Privacy Policy',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 9.sp,
                  color: Colors.black,
                ),
                onTap: () {
                  Get.to(() => PrivecyPolicy());
                  //Get.to(() => CartPageView());
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ShopingBagsEmpty()));
                }, //PersonalDetails
              ),

              // ListTile(
              //   contentPadding:
              //       EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              //   dense: true,
              //   visualDensity: VisualDensity(horizontal: 0, vertical: -3),
              //   leading: Image.asset('lib/assets/icons8-box-64.png').p(9),
              //   title: Text(
              //     'Orders',
              //     style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 9.sp,
              //         fontWeight: FontWeight.w500),
              //   ),
              //   trailing: Icon(
              //     Icons.arrow_forward_ios_sharp,
              //     size: 10,
              //     color: Colors.black,
              //   ),
              //   onTap: () {
              //     //Navigator.push(context,MaterialPageRoute(builder: (context) => OrderPage()));
              //   }, //PersonalDetails
              // ),
              //
              // ListTile(
              //   contentPadding:
              //       EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              //   dense: true,
              //   visualDensity: VisualDensity(horizontal: 0, vertical: -3),
              //   leading: Image.asset('lib/assets/user.png').p(9),
              //   title: Text(
              //     'Account',
              //     style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 9.sp,
              //         fontWeight: FontWeight.w500),
              //   ),
              //   trailing: Icon(
              //     Icons.arrow_forward_ios_sharp,
              //     size: 10,
              //     color: Colors.black,
              //   ),
              //   onTap: () {
              //     _bottomController.tabindex(3);
              //     Get.to(() => NavBar());
              //     // Navigator.push(
              //     //     context,
              //     //     MaterialPageRoute(
              //     //         builder: (context) => ProfileDetails()));
              //   }, //PersonalDetails
              // ),
              //
              // ListTile(
              //   contentPadding:
              //       EdgeInsets.symmetric(vertical: 0.5, horizontal: 10),
              //   dense: true,
              //   visualDensity: VisualDensity(horizontal: 0, vertical: -3),
              //   leading: Image.asset('lib/assets/love.png').p(9),
              //   title: Text(
              //     'Wishlist',
              //     style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 9.sp,
              //         fontWeight: FontWeight.w500),
              //   ),
              //   trailing: Icon(
              //     Icons.arrow_forward_ios_sharp,
              //     size: 10,
              //     color: Colors.black,
              //   ),
              //   onTap: () {
              //     _bottomController.tabindex(2);
              //     Get.to(() => NavBar());
              //
              //     // Navigator.push(context,
              //     //     MaterialPageRoute(builder: (context) => WishListPage()));
              //   }, //PersonalDetails
              // ),

              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0.5, horizontal: 10),
                dense: true,
                visualDensity: VisualDensity(horizontal: 0, vertical: 3),
                leading: Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Icon(Icons.person),
                ),
                // Icon(
                //   Icons.chat,
                //   size: 12.sp,
                //   color: Colors.black,
                // ),
                title: Text(
                  'Contact Us',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 9.sp,
                  color: Colors.black,
                ),
                onTap: () {
                  Get.to(() => HelpSuport());
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => HelpSuport()));
                }, //PersonalDetails
              ),

              // ListTile(
              //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              //   dense: true,
              //   visualDensity: VisualDensity(horizontal: 0, vertical: -3),
              //   leading: Icon(
              //     Icons.sell,
              //     size: 12.sp,
              //     color: Colors.black,
              //   ),
              //   title: Text(
              //     'Order History',
              //     style: GoogleFonts.raleway(
              //         color: Colors.black,
              //         fontSize: 9.sp,
              //         fontWeight: FontWeight.bold),
              //   ),
              //   trailing: Icon(
              //     Icons.arrow_forward_ios_sharp,
              //     size: 10,
              //     color: Colors.black,
              //   ),
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => OrderHistory()));
              //   }, //PersonalDetails
              // ),

              // ListTile(
              //   contentPadding:
              //       EdgeInsets.symmetric(vertical: 0.5, horizontal: 10),
              //   dense: true,
              //   visualDensity: VisualDensity(horizontal: 0, vertical: 3),
              //   leading: Padding(
              //     padding: EdgeInsets.all(9.0),
              //     child: Icon(Icons.map_rounded),
              //   ),
              //   title: Text(
              //     'Start Selling',
              //     style: GoogleFonts.raleway(
              //         color: Colors.black,
              //         fontSize: 10.sp,
              //         fontWeight: FontWeight.bold),
              //   ),
              //   trailing: Icon(
              //     Icons.arrow_forward_ios_sharp,
              //     size: 9.sp,
              //     color: Colors.black,
              //   ),
              //   onTap: () {
              //     // Navigator.push(context,
              //     //     MaterialPageRoute(builder: (context) => Wollet()));
              //   }, //PersonalDetails
              // ),

              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0.5, horizontal: 10),
                dense: true,
                visualDensity: VisualDensity(horizontal: 0, vertical: 3),
                leading: Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Icon(Icons.border_inner_sharp),
                ),
                title: Text(
                  'Orders',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 9.sp,
                  color: Colors.black,
                ),
                onTap: () {
                  Get.to(() => OrderConfirmationPage());
                  //OrderPage());
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Wollet()));
                }, //PersonalDetails
              ),

              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0.5, horizontal: 10),
                dense: true,
                visualDensity: VisualDensity(horizontal: 0, vertical: 3),
                leading: Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Icon(Icons.delete),
                ),
                title: Text(
                  'Delete Account',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 9.sp,
                  color: Colors.black,
                ),
                onTap: () {
                  Get.defaultDialog(
                    title: "Welcome To Gyros",
                    middleText: "You content goes here...",
                    content: getContent(),
                    barrierDismissible: true,
                    radius: 20.0,
                    confirm: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: confirmBtn(),
                    ),
                    cancel: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: cancelBtn(),
                    ),
                  );

                  //Get.to(() => CupponsPage());
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Wollet()));
                }, //PersonalDetails
              ),

              ///TODO: cuppon.......

              // ListTile(
              //   contentPadding:
              //       EdgeInsets.symmetric(vertical: 0.5, horizontal: 10),
              //   dense: true,
              //   visualDensity: VisualDensity(horizontal: 0, vertical: 3),
              //   leading: Padding(
              //     padding: EdgeInsets.all(9.0),
              //     child: Icon(Icons.local_offer_rounded),
              //   ),
              //   title: Text(
              //     'Cuppons',
              //     style: GoogleFonts.raleway(
              //         color: Colors.black,
              //         fontSize: 10.sp,
              //         fontWeight: FontWeight.bold),
              //   ),
              //   trailing: Icon(
              //     Icons.arrow_forward_ios_sharp,
              //     size: 9.sp,
              //     color: Colors.black,
              //   ),
              //   onTap: () {
              //     Get.to(() => CupponsPage());
              //     // Navigator.push(context,
              //     //     MaterialPageRoute(builder: (context) => Wollet()));
              //   }, //PersonalDetails
              // ),

              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0.5, horizontal: 10),
                dense: true,
                visualDensity: VisualDensity(horizontal: 0, vertical: 3),
                leading: Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Icon(Icons.logout),
                ),
                title: Text(
                  'Logout',
                  style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 9.sp,
                  color: Colors.black,
                ),
                onTap: () {
                  print(Get.currentRoute);

                  GetStorage prefs = GetStorage();
                  prefs.erase();
                  //prefs.remove('email');

                  Get.to(() => LoginPage());
                  Get.offNamed('/LoginPage');
                  // Get.to(() => LoginPage());
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Wollet()));
                }, //PersonalDetails
              ),

              SizedBox(
                height: 1.h,
              ),

              // Text(
              //   'OTHERS',
              //   style: GoogleFonts.raleway(
              //     fontSize: 10.sp,
              //     fontWeight: FontWeight.bold,
              //     color: Color(0xff4d4e50),
              //   ),
              // ).pSymmetric(h: 2.w, v: 0.2.h),
              //
              // //'OTHER LINK'.text.gray900.make().pSymmetric(h: 2.w,v: 0.1.h),
              //
              // ListTile(
              //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              //   dense: true,
              //   visualDensity: VisualDensity(horizontal: 0, vertical: -3),
              //   title: Text(
              //     'FAQs',
              //     style: GoogleFonts.raleway(
              //         color: Colors.black,
              //         fontWeight: FontWeight.w400,
              //         fontSize: 8.sp),
              //   ),
              //   trailing: Icon(
              //     Icons.arrow_forward_ios_sharp,
              //     size: 10,
              //     color: Colors.black,
              //   ),
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => FaqPage()));
              //     //okpage()
              //   },
              // ),
              // ListTile(
              //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              //   dense: true,
              //   visualDensity: VisualDensity(horizontal: 0, vertical: -3),
              //   title: Text(
              //     'CONTACT US',
              //     style: GoogleFonts.raleway(
              //         color: Colors.black,
              //         fontWeight: FontWeight.w400,
              //         fontSize: 8.sp),
              //   ),
              //   trailing: Icon(
              //     Icons.arrow_forward_ios_sharp,
              //     size: 10,
              //     color: Colors.black,
              //   ),
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => HelpSuport()));
              //     //okpage()
              //   },
              // ),
              // ListTile(
              //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              //   dense: true,
              //   visualDensity: VisualDensity(horizontal: 0, vertical: -3),
              //   title: Text(
              //     'LEGAL',
              //     style: GoogleFonts.raleway(
              //         color: Colors.black,
              //         fontWeight: FontWeight.w400,
              //         fontSize: 8.sp),
              //   ),
              //   trailing: Icon(
              //     Icons.arrow_forward_ios_sharp,
              //     size: 10,
              //     color: Colors.black,
              //   ),
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => LegalPage()));
              //     //okpage()
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget confirmBtn() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        child: Text("Confirm"));
  }

  Widget cancelBtn() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        child: Text("Cancel"));
  }

  Widget getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "If Yow want to remove your account,",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        Text(
          "Then you please click confirm button",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        Text(
          "Your data will erase if you press confirm.",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        Text(
          "If you don't want to delete press cancel",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
      ],
    );
  }
}
