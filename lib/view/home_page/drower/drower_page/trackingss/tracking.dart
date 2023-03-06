import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_navbar.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Tracking extends StatelessWidget {
  const Tracking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Order Status',
          style: TextStyle(
              color: AppColors.themecolors, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
            onTap: () {
              Get.back();
              // _homePageController.toggle(index);
              //Get.to(() => WalkTracking());
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.themecolors,
            )),
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1530880508858-fafe6b871ce8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=662&q=80'),
                fit: BoxFit.fill),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 0.w),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'See Your order Status',
                  style: GoogleFonts.play(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 23.w),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 45.h,
                        child: StepProgressIndicator(
                          selectedSize: 7.w,
                          unselectedSize: 7.w,
                          direction: Axis.vertical,
                          totalSteps: 5,
                          currentStep: 2,
                          size: 20,
                          selectedColor: Colors.green,
                          unselectedColor: Colors.grey.shade200,
                          customStep: (index, color, _) => color == Colors.green
                              ? Container(
                                  height: 4.h,
                                  width: 8.w,
                                  color: color,
                                  child: Center(
                                      child: Image.network(
                                    'https://img.icons8.com/external-others-inmotus-design/2x/external-Approved-approve-others-inmotus-design-2.png',
                                    fit: BoxFit.cover,
                                    height: 5.h,
                                    width: 10.w,
                                    //color: Colors.green,
                                  )),
                                )
                              : Container(
                                  height: 4.h,
                                  color: color,
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 45.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    'https://img.icons8.com/ios-filled/2x/planet.png',
                                    height: 5.w,
                                    width: 10.w,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Order Placed',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    'https://img.icons8.com/external-xnimrodx-lineal-xnimrodx/2x/external-confirm-data-xnimrodx-lineal-xnimrodx.png',
                                    height: 5.w,
                                    width: 10.w,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Order Confirm',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    'https://img.icons8.com/ios-filled/2x/process.png',
                                    height: 5.w,
                                    width: 10.w,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Order Proccesed',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    'https://img.icons8.com/external-smashingstocks-mixed-smashing-stocks/2x/external-delivery-time-customer-services-help-support-smashingstocks-mixed-smashing-stocks.png',
                                    height: 5.w,
                                    width: 10.w,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Ready to order Pickup',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    'https://img.icons8.com/ios-filled/2x/checked-truck.png',
                                    height: 5.w,
                                    width: 10.w,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Order Deliverd',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Thank You for order with Us!',
                  style: GoogleFonts.play(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Container(
                  height: 5.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                    gradient: MyTheme.gradient2,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FloatingActionButton(
                    highlightElevation: 5,
                    //heroTag: 'Continue Shopping',
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    splashColor: Colors.lightGreenAccent,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    onPressed: () {
                      Get.to(() => NavBar());
                    },
                    child: Text(
                      'Continue Shopping',
                      style: GoogleFonts.poppins(
                        color: Colors.yellow.shade200,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
