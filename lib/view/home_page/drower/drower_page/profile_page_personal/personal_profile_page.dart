import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/get_profile/get_profile_controller.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:sizer/sizer.dart';

class PersonalProfile extends StatelessWidget {
  PersonalProfile({Key? key}) : super(key: key);
  GetProfileController _getProfileController = Get.put(GetProfileController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Personal Detail',
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
      body: Obx(
        () => (_getProfileController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            // : _getProfileController.getprofileModel?.result?.name == null
            //     ? Center(
            //         child: Text('No List'),
            //       )
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          // height: 20.h,
                          // width: 20.w,
                          height: 15.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                            // image: DecorationImage(
                            //     image: AssetImage(
                            //         'lib/assets/asset/guser_logo.png',
                            //     ),
                            //     fit: BoxFit.cover),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'icons/gyrosfarmfinallogo.png',
                                //'lib/assets/asset/guser_logo.png',
                                // color: AppColors.themecolors,
                                height: 12.h,
                                width: 23.w,
                              ),
                            ],
                          )
                          // Image.asset(
                          //   'icons/gyrosfarmfinallogo.png',
                          //   //'lib/assets/asset/guser_logo.png',
                          //   // color: AppColors.themecolors,
                          //   height: 10.h,
                          //   width: 16.w,
                          // ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          height: 4.5.h,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade300,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.account_circle,
                                  size: 15.sp,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("${_getProfileController.getprofileModel?.result?.name}",
                                  // 'Vineet Mishra',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 4.5.h,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade300,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.email_rounded,
                                  size: 15.sp,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("${_getProfileController.getprofileModel?.result?.emailId}",
                                  style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 4.5.h,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade300,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: 15.sp,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  '+91 ${_getProfileController.getprofileModel?.result?.mobileNo.toString()}',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        // Container(
                        //   height: 10.5.h,
                        //   width: size.width,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(5),
                        //     color: Colors.grey.shade300,
                        //   ),
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(horizontal: 3.w),
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         SizedBox(
                        //           width: 2.w,
                        //         ),
                        //         Text(
                        //           'New Ashok Nagar',
                        //           style: GoogleFonts.fanwoodText(
                        //             color: Colors.black,
                        //             fontSize: 12.sp,
                        //           ),
                        //         ),
                        //         Text(
                        //           'Delhi',
                        //           style: GoogleFonts.fanwoodText(
                        //             color: Colors.black,
                        //             fontSize: 12.sp,
                        //           ),
                        //         ),
                        //         Text(
                        //           'India 110096',
                        //           style: GoogleFonts.fanwoodText(
                        //             color: Colors.black,
                        //             fontSize: 12.sp,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 8.h,
                        ),
                        InkWell(
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
                            //Get.to(() => EditProfiless());
                          },
                          child: Container(
                            height: 4.5.h,
                            width: size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: MyTheme.containercolor18
                                //gradient: MyTheme.gradient3,
                                ),
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: Center(
                                  child: Text(
                                    'DELETE PROFILE',
                                    style: GoogleFonts.fanwoodText(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                          ),
                        ),
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
