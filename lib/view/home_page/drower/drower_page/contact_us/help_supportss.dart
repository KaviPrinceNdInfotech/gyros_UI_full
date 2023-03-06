import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/contact_us_controller/contact_us_controller.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/view/home_page/drower/drower_page/contact_us/help_ask_qn.dart';
import 'package:sizer/sizer.dart';

class HelpSuport extends StatelessWidget {
  var height, width, size;
  HelpSuport({Key? key}) : super(key: key);

  ContactUsController _contactUsController = Get.put(ContactUsController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Ask Question',
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
        () => (_contactUsController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : _contactUsController.contactUsModel!.result == null
                //_contactUsController.contactUsModel.toString().isEmpty
                ? Center(
                    child: Text('No data'),
                  )
                : Container(
                    height: size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1506818144585-74b29c980d4b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGJhY2tncm91bmQlMjBibHVyJTIwaW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=1400&q=60'),
                          fit: BoxFit.fill),
                      // gradient: gradient3,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 30.w,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Help Center',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          """Please get in touch  and we will be 
happy to help you.""",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 8.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 15.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black38),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'lib/assets/asset/71482-support-man.gif',
                                          ),
                                          opacity: 10,
                                          fit: BoxFit.cover,
                                        ),
                                        color: Colors.green,
                                      ),
                                      //color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.red,
                              thickness: 1,
                            ),
                            Container(
                              height: 30.w,
                              width: width / 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Contact Us',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Text(
                                          'Phone:',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          'Email:',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          '+91 ${_contactUsController.contactUsModel!.result!.phone.toString()}',
                                          style: TextStyle(
                                            color: Colors.blueGrey.shade100,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          _contactUsController
                                              .contactUsModel!.result!.email!
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.blueGrey.shade100,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.red,
                              thickness: 1,
                            ),
                            Container(
                              height: 30.w,
                              width: width / 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Address',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      _contactUsController
                                          .contactUsModel!.result!.address!
                                          .toString()
                                      // 'New Ashok Nagar Delhi , B6 Delhi India - 110096\n'
                                      // 'Near Noida sector 15 Metro Station.'
                                      ,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 9.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.red,
                              thickness: 1,
                            ),
                            Container(
                              // height: 30.w,
                              width: width / 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hours Open',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      'You have Support 24*7.',
                                      style: GoogleFonts.abel(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => HelpQuestion());
          // Add your onPressed code here!
        },
        backgroundColor: MyTheme.signUpButtonColor,
        child: Icon(Icons.message),
      ),
    );
  }
}
