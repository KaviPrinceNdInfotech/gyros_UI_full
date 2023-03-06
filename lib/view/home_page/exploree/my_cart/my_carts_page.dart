import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/view/home_page/home_page_controller.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:sizer/sizer.dart';

class MyCartPage extends StatelessWidget {
  MyCartPage({Key? key}) : super(key: key);
  HomePageController _homePageController = Get.put(HomePageController());

  final List<String> image2 = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZFWvbpHgQ52duSVJbtvK3C2T2OfrCv8TN3g&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDrYFTzUD-kkj18aNDkGKzt-ZVXWVusHViOQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjkQ7OvBH1-S-hFZGbc_kxXwgBjkrzDt7vHg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP1Ukf5MU84Wpni0y1-NIrKGOm-GXOBvqwjg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZFWvbpHgQ52duSVJbtvK3C2T2OfrCv8TN3g&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDrYFTzUD-kkj18aNDkGKzt-ZVXWVusHViOQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjkQ7OvBH1-S-hFZGbc_kxXwgBjkrzDt7vHg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP1Ukf5MU84Wpni0y1-NIrKGOm-GXOBvqwjg&usqp=CAU',
  ];

  final List<String> text2 = [
    'Mangoes',
    'Oil',
    "Cabage",
    'Honey',
    'Mangoes',
    'Oil',
    "cabage",
    'Honey',
  ];
  final List<String> text3 = [
    'Fruits',
    'Oil',
    "Vegetables",
    'Ghee',
    'Fruits',
    'Oil',
    "Vegetables",
    'Ghee',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('My Cart',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: MyTheme.ThemeColors,
                          fontSize: 14.sp,
                        )),
                  ),
                ),
                SizedBox(
                    height: size.height * 0.45,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: text2.length,
                        // scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(4.0),
                            child: PhysicalModel(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffeff8f5),
                              elevation: 0.1,
                              child: Container(
                                height: size.height * 0.12,
                                // width: size.width * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: MyTheme.ContainerUnSelectedColor,
                                ),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: size.height * 0.10,
                                      width: size.width * 0.30,
                                      child: Image.network(
                                        image2[index],
                                        height: size.height * 0.15,
                                        width: 26.w,
                                        //color: Colors.transparent
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      child: SizedBox(
                                        width: size.width * 0.18,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              text2[index],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '₹ 30',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 8.sp,
                                                    color: MyTheme
                                                        .loginbuttonColor,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.2,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        width: size.width * 0.020,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.delete_forever,
                                                color: Colors.redAccent,
                                              ),
                                              PhysicalModel(
                                                color: Colors.white70,
                                                elevation: 2,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Container(
                                                  height: size.height * 0.05,
                                                  width: size.width * 0.20,
                                                  decoration: BoxDecoration(
                                                      gradient:
                                                          MyTheme.gradient2,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: size.height *
                                                              0.02,
                                                          height: size.height *
                                                              0.02,
                                                          child: NeoPopButton(
                                                            color: Colors
                                                                .greenAccent,
                                                            bottomShadowColor:
                                                                ColorUtils.getVerticalShadow(
                                                                        Colors
                                                                            .white70)
                                                                    .toColor(),
                                                            rightShadowColor:
                                                                ColorUtils.getHorizontalShadow(
                                                                        Colors
                                                                            .yellow)
                                                                    .toColor(),
                                                            animationDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        300),
                                                            depth: kButtonDepth,
                                                            onTapUp: () {
                                                              print('press');
                                                            },
                                                            // border: Border.all(
                                                            //   color: Colors
                                                            //       .greenAccent,
                                                            //   width: 2.w,
                                                            // ),
                                                            child: Center(
                                                              child: Icon(
                                                                Icons.remove,
                                                                size: 10.sp,
                                                                color: Colors
                                                                    .deepOrange,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            '1',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 12.sp,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: size.height *
                                                              0.02,
                                                          height: size.height *
                                                              0.02,
                                                          child: NeoPopButton(
                                                            color: Colors
                                                                .greenAccent,
                                                            bottomShadowColor:
                                                                ColorUtils.getVerticalShadow(
                                                                        Colors
                                                                            .white70)
                                                                    .toColor(),
                                                            rightShadowColor:
                                                                ColorUtils.getHorizontalShadow(
                                                                        Colors
                                                                            .yellow)
                                                                    .toColor(),
                                                            animationDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        300),
                                                            depth: kButtonDepth,
                                                            onTapUp: () {
                                                              if (kDebugMode) {
                                                                print('press');
                                                              }
                                                            },
                                                            // border: Border.all(
                                                            //   color: Colors
                                                            //       .greenAccent,
                                                            //   width: 2.w,
                                                            // ),
                                                            child: Center(
                                                              child: Icon(
                                                                Icons.add,
                                                                size: 10.sp,
                                                                color: Colors
                                                                    .deepOrange,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
                SizedBox(
                  height: 00.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: size.height * 0.056,
                    width: double.infinity,
                    color: Colors.grey.shade100,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: PhysicalModel(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(10),
                                elevation: 5,
                                child: Container(
                                  height: 4.4.h,
                                  width: 22.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: MyTheme.gradient1),
                                  child: Center(
                                    child: Text(
                                      'Buy Product',
                                      style: TextStyle(
                                        color: Colors.white,
                                        //color: Theme.of(context).colorScheme.onPrimary,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 9.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Total Item = 4',
                              style: TextStyle(
                                color: Colors.redAccent.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 003,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: size.height * 0.036,
                    width: double.infinity,
                    color: MyTheme.ContainerUnSelectedColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 0.4.h),
                      child: Text(
                        'Recommended For You',
                        style: TextStyle(
                          //color: MyTheme.ThemeColors,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 9.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: size.height * 0.29,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: text3.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(4.0),
                            child: PhysicalModel(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffeff8f5),
                              elevation: 0.1,
                              child: Container(
                                height: 55.h,
                                width: size.width * 0.48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  // color:
                                  //     _homePageController.selectedIndex.value ==
                                  //             index
                                  //         ? MyTheme.ThemeColors
                                  //         : Colors.white12,
                                  color: MyTheme.ContainerUnSelectedColor,
                                ),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        height: 3.5.h,
                                        width: 22.w,
                                        decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(20),
                                            )),
                                        child: Center(
                                          child: Text(
                                            'Best Saller',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 9.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Image.network(
                                      image2[index],
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
                                            decoration:
                                                TextDecoration.lineThrough,
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
                                                    color: MyTheme
                                                        .loginbuttonColor,
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
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
