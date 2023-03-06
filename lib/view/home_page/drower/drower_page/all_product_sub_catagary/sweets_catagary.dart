import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:sizer/sizer.dart';

class Sweets extends StatelessWidget {
  const Sweets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> Text1 = [
      'Sweet 1',
      'Sweet 2',
      'Sweet 3',
      'Sweet 4',
      'Sweet 5',
      'Sweet 6',
      'Sweet 7',
      'Sweet 8'
    ];
    final List<String> text3 = [
      'Sweet 1',
      'Sweet 2',
      'Sweet 3',
      'Sweet 4',
      'Sweet 5',
      'Sweet 6',
      'Sweet 7',
      'Sweet 8'
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Sweets',
          style: TextStyle(
              color: AppColors.themecolors, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.themecolors,
            )),
      ),
      body: Container(
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      mainAxisExtent: 200,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0),
                  itemCount: Text1.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(2.0),
                      child: InkWell(
                        onTap: () {
                          // _homePageController.toggle(index);
                          //Get.to(() => WalkTracking());
                        },
                        child: PhysicalModel(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.yellow,
                          //color: Color(0xffeff8f5),
                          elevation: 0.1,
                          child: Container(
                            height: 55.h,
                            width: size.width * 0.98,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff5e071a),
                            ),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 3.h,
                                ),
                                // Align(
                                //   alignment: Alignment.centerLeft,
                                //   child: Container(
                                //     height: 3.5.h,
                                //     width: 22.w,
                                //     decoration: BoxDecoration(
                                //         color: Colors.yellow,
                                //         borderRadius: BorderRadius.only(
                                //           topLeft: Radius.circular(5),
                                //           bottomRight: Radius.circular(20),
                                //         )),
                                //     child: Center(
                                //       child: Text(
                                //         'Best Saller',
                                //         style: TextStyle(
                                //           color: Colors.white,
                                //           fontWeight: FontWeight.w500,
                                //           fontSize: 9.sp,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Image.network(
                                  'https://www.mapsofindia.com/ci-moi-images/my-india/Gulab-Jamun.jpg',
                                  width: 30.w,
                                  //'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhrfScAJM3MU-f7T5SOMJ1muAuEqOZ-LEc9SVJDA3QFWKRq7AHJwtT1Xl081tBqoMJeDE&usqp=CAU',
                                  height: size.height * 0.15,
                                  //color: Colors.transparent
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        text3[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Icon(
                                        Icons.add_shopping_cart_outlined,
                                        size: 15.sp,
                                        color: Colors.redAccent,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '₹ 50',
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 7.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 25.w,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        child: Row(
                                          children: [
                                            Text(
                                              '₹ 30',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 8.sp,
                                                color: MyTheme.loginbuttonColor,
                                              ),
                                            ),
                                            Text(
                                              ' /500 gm',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 5.sp,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 3.5.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                          color: MyTheme.loginbuttonColor,
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                          )),
                                      child: Center(
                                        child: Text(
                                          'Save 3%',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
