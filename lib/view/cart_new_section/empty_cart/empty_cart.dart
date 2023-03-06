import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_navbar.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:sizer/sizer.dart';

class ShopingBagsEmpty extends StatelessWidget {
  var size, height, width;
  ShopingBagsEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Empty Cart',
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
          height: height / 1,
          //height: 100.h,
          decoration: BoxDecoration(
            gradient: MyTheme.gradient2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Spacer(),
              Container(
                height: height / 3,
                width: width / 1,
                //color: Colors.white70,
                decoration: BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  //borderRadius: BorderRadius.circular(20)
                ),
                child: Image.asset(
                  'lib/assets/asset/guser_logo.png' , scale: 10,
                  //'lib/assets/asset/guser_logo.png',
                  // color: AppColors.themecolors,
                  height: 10.h,
                  width: 16.w,
                ),
                // decoration: BoxDecoration(
                //   color: Colors.white70,
                //   shape: BoxShape.circle,
                //   image: DecorationImage(
                //       image: AssetImage('lib/assets/asset/guser_logo.png' )
                //           // 'lib/assets/asset/guser_logo.png', scale: 28,
                //   ),
                // ),
              ),
              SizedBox(
                height: 7.h,
              ),
              //5.h.heightBox,
              Text(
                'You have no item in your Cart',
                style: GoogleFonts.alegreyaSc(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => NavBar());
                },
                child: Container(
                  height: 5.h,
                  width: width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      'Shop Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              //     .onTap(() {
              //   Get.to(() => LoginPage());
              // }
              // ),
              //Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
