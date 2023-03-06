import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/view/botttom_nav_bar/whats_app_tracking_page.dart';
import 'package:gyros_app/view/home_page/all_catagary/best_deal.dart';
import 'package:gyros_app/view/home_page/drower/drower_page/all_products.dart';
import 'package:gyros_app/view/home_page/profile/home_page_practice.dart';
import 'package:gyros_app/view/home_page/profile/profile_page.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../search_screen.dart';
import 'bottom_nav_bar_controller.dart';

class NavBar extends StatelessWidget {
  var size, height, width;
  NavBar({Key? key}) : super(key: key);

  NavController _navController = Get.put(NavController());
  //final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    print(height);
    print(width);
    return Scaffold(
      bottomNavigationBar: Obx(() => SizedBox(
        height: 8.h,
        child: Container(
          //height: 7.h,
          decoration: BoxDecoration(
            //gradient: gradient4,
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _navController.changeTabIndex(0);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 3.8.h,
                          width: 6.w,
                          child: Icon(
                            Icons.home,
                            size: 20.sp,
                            color: _navController.tabindex.value == 0
                                ? AppColors.themecolors
                                : Colors.grey.shade600,
                          ),

                          // Image.asset(
                          //   'lib/assets/home2.png',
                          //   color: _bottomController.tabindex.value == 0
                          //       ? Colors.black
                          //       : Colors.grey.shade600,
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                        // Icon(
                        //   Icons.home,
                        //   color: _bottomController.tabindex.value == 0
                        //       ? Colors.black
                        //       : Colors.grey.shade600,
                        //   size: 25,
                        // ),
                        Text("Home",
                            style: GoogleFonts.poppins(
                                color: _navController.tabindex.value == 0
                                    ? AppColors.themecolors
                                    : Colors.grey.shade600,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600)
                          //style: TextStyle(color:_bottomController.tabindex.value==0?Colors.orange:Color(0xFF110d39),fontSize: 13)
                          // TextStyles(12.sp, FontWeight.w400, TextDecoration.none,
                          //     textcolor
                          // ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('call');
                      _navController.changeTabIndex(1);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 3.8.h,
                          width: 6.w,
                          child: Icon(
                            Icons.shopping_bag,
                            size: 20.sp,
                            color: _navController.tabindex.value == 1
                                ? AppColors.themecolors
                                : Colors.grey.shade600,
                          ),

                          // Image.asset(
                          //   'lib/assets/home2.png',
                          //   color: _bottomController.tabindex.value == 0
                          //       ? Colors.black
                          //       : Colors.grey.shade600,
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                        Text("Shop",
                            style: GoogleFonts.poppins(
                                color: _navController.tabindex.value == 1
                                    ? AppColors.themecolors
                                    : Colors.grey.shade600,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600)
                          //style: TextStyle(color:_bottomController.tabindex.value==0?Colors.orange:Color(0xFF110d39),fontSize: 13)
                          // TextStyles(12.sp, FontWeight.w400, TextDecoration.none,
                          //     textcolor
                          // ),
                        ),
                      ],
                    ),
                  ),

                  //.
                  // ..............................................................

                  ///TODO: explore Icon and text.........but we have to now set cart  page......
//search Icon Text
                  InkWell(
                    onTap: () {
                      print('call');
                      _navController.changeTabIndex(2);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 3.8.h,
                          width: 6.w,
                          child: Icon(
                            Icons.search,
                            size: 20.sp,
                            color: _navController.tabindex.value == 2
                                ? AppColors.themecolors
                                : Colors.grey.shade600,
                          ),
                          // Icon(
                          //   Icons.explore,
                          //   size: 20.sp,
                          //   color: _navController.tabindex.value == 2
                          //       ? AppColors.themecolors
                          //       : Colors.grey.shade600,
                          // ),
                        ),
                        Text("Search",
                            style: GoogleFonts.poppins(
                                color: _navController.tabindex.value == 2
                                    ? AppColors.themecolors
                                    : Colors.grey.shade600,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600)),
                        // Text("Explore",
                        //     style: GoogleFonts.poppins(
                        //         color: _navController.tabindex.value == 2
                        //             ? AppColors.themecolors
                        //             : Colors.grey.shade600,
                        //         fontSize: 9.sp,
                        //         fontWeight: FontWeight.w600)
                        // ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('call');
                      _navController.changeTabIndex(3);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 3.8.h,
                          width: 6.w,
                          child: Icon(
                            Icons.local_offer,
                            size: 20.sp,
                            color: _navController.tabindex.value == 3
                                ? AppColors.themecolors
                                : Colors.grey.shade600,
                          ),

                          // Image.asset(
                          //   'lib/assets/home2.png',
                          //   color: _bottomController.tabindex.value == 0
                          //       ? Colors.black
                          //       : Colors.grey.shade600,
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                        Text("Deals",
                            style: GoogleFonts.poppins(
                                color: _navController.tabindex.value == 3
                                    ? AppColors.themecolors
                                    : Colors.grey.shade600,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600)
                          //style: TextStyle(color:_bottomController.tabindex.value==0?Colors.orange:Color(0xFF110d39),fontSize: 13)
                          // TextStyles(12.sp, FontWeight.w400, TextDecoration.none,
                          //     textcolor
                          // ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('call');
                      _navController.changeTabIndex(4);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 3.8.h,
                          width: 6.w,
                          child: Icon(
                            Icons.read_more_rounded,
                            size: 20.sp,
                            color: _navController.tabindex.value == 4
                                ? AppColors.themecolors
                                : Colors.grey.shade600,
                          ),


                        ),
                        Text("More",
                            style: GoogleFonts.poppins(
                                color: _navController.tabindex.value == 4
                                    ? AppColors.themecolors
                                    : Colors.grey.shade600,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600)
                          //style: TextStyle(color:_bottomController.tabindex.value==0?Colors.orange:Color(0xFF110d39),fontSize: 13)
                          // TextStyles(12.sp, FontWeight.w400, TextDecoration.none,
                          //     textcolor
                          // ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      )),
      body: Obx(
            () => SafeArea(
          child: Center(
            child: IndexedStack(
              index: _navController.tabindex.value,
              children: [
                //HomePage(),
                HomePagePractice(),

                AllProducts(),
                // ExploreView(),
//     //StudioPage(),
//     //const Page4(),
                //WishListPage(),
                //MyCartPage(),
                ///Todo this kis explore page......call...cartpageview......
                //CartPageView(),
                //Explorepage(),
                SearchScreen(), //Name of the screen is login_screen(1).dart
                // GiftBox(),
                //Cartproducts(),
                //PaymentPage(),
                BestDeal(),
                ProfilePages(),
                //Profile(),
                //WithdrowPage(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 6.h,
        width: 12.w,
        child: FloatingActionButton(
          onPressed: () {
            print('whats app me');
            Navigator.of(context).push(_createRoute());

            //_launchWhatsapp();
            // Add your onPressed code here!
          },
          backgroundColor: AppColors.themecolors,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Image.asset(
              'lib/assets/asset/whatsapp3.png',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
    // drawer: DrawerWidget(),
  }

  ///todo from here whats app launch in flutter

  _launchWhatsapp() async {
    var whatsapp = "+919716412565";
    var whatsappAndroid =
    Uri.parse("whatsapp://send?phone=$whatsapp&text=hello Prince");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      Get.snackbar(
        "Whats App not installed ",
        "Please install the what's app Prince",
        colorText: Colors.red.shade400,
        backgroundColor: Colors.white10,
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.TOP,
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text("WhatsApp is not installed on the device"),
      //   ),
      // );
    }
  }

  ///todo from here you have to animated in rout in flutter,

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
      //_launchWhatsapp(),

      WhatsAppTrackOrder(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

// import 'package:e_commerce_apps/view/nav_bar/nav_bar_controller.dart';
// import 'package:e_commerce_apps/view/nav_bar/profiles/profile.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// import 'cartegory/category_page.dart';
// import 'explores/explore_page.dart';
// import 'home_page/home_pagee.dart';
//
// class NavBar extends StatefulWidget {
//   NavBar({Key? key}) : super(key: key);
//
//   BottomController _bottomController =
//       Get.put(BottomController(), permanent: true);
//
//   @override
//   _NavBarState createState() => _NavBarState();
// }
//
// class _NavBarState extends State<NavBar> {
//   int pageIndex = 0;
//   GlobalKey<ScaffoldState> _key = GlobalKey();
//   //static ExampleViewModel exampleViewModel = ExampleViewModel(pageColors: [Colors.orange], appearance: CircularSliderAppearance());
//   final pages = [
//     HomePage(),
//     //const Page1(),
//     CategoryPage(),
//     //StudioPage(),
//     //const Page4(),
//     Explorepage(),
//     Profile(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _key,
//       backgroundColor: const Color(0xffC4DFCB),
//       body: pages[pageIndex],
//       bottomNavigationBar: buildMyNavBar(context),
//     );
//   }
//
//   Container buildMyNavBar(BuildContext context) {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//         color: Color(0xffebeced),
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(1),
//           topRight: Radius.circular(1),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               pageIndex == 0
//                   ? const Icon(
//                       Icons.home_filled,
//                       color: Colors.pink,
//                       size: 25,
//                     )
//                   : const Icon(
//                       Icons.home_outlined,
//                       color: Colors.grey,
//                       size: 27,
//                     ),
//               pageIndex == 0
//                   ? 'Home'.text.size(12).pink500.make()
//                   : 'Home'.text.gray700.size(13).make(),
//             ],
//           ).onInkTap(() {
//             //_bottomController.changeTabIndex(0);
//             setState(() {
//               pageIndex = 0;
//             });
//           }),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               pageIndex == 1
//                   ? const Icon(
//                       Icons.dashboard,
//                       color: Colors.pink,
//                       size: 25,
//                     )
//                   : const Icon(
//                       Icons.dashboard,
//                       color: Colors.grey,
//                       size: 27,
//                     ),
//               pageIndex == 1
//                   ? 'Category'.text.pink500.size(12).make()
//                   : 'Category'.text.gray700.size(13).make(),
//             ],
//           ).onInkTap(() {
//             setState(() {
//               pageIndex = 1;
//             });
//           }),
//           // Column(
//           //   children: [
//           //     pageIndex == 2
//           //         ? const Icon(
//           //             Icons.live_tv,
//           //             color: Colors.pink,
//           //             size: 35,
//           //           )
//           //         : const Icon(
//           //             Icons.live_tv,
//           //             color: Colors.grey,
//           //             size: 35,
//           //           ),
//           //     pageIndex == 2
//           //         ? 'Studio'.text.pink500.make()
//           //         : 'Studio'.text.gray700.make(),
//           //   ],
//           // ).onInkTap(() {
//           //   setState(() {
//           //     pageIndex = 2;
//           //   });
//           // }),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               pageIndex == 2
//                   ? const Icon(
//                       FontAwesomeIcons.star,
//                       color: Colors.pink,
//                       size: 25,
//                     )
//                   : const Icon(
//                       FontAwesomeIcons.star,
//                       color: Colors.grey,
//                       size: 27,
//                     ),
//               pageIndex == 2
//                   ? 'Explore'.text.pink500.size(12).make()
//                   : 'Explore'.text.gray700.size(13).make(),
//             ],
//           ).onInkTap(() {
//             setState(() {
//               pageIndex = 2;
//             });
//           }),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               pageIndex == 3
//                   ? const Icon(
//                       Icons.person,
//                       color: Colors.pink,
//                       size: 25,
//                     )
//                   : const Icon(
//                       Icons.person_outline,
//                       color: Colors.grey,
//                       size: 27,
//                     ),
//               pageIndex == 3
//                   ? 'Profile'.text.pink500.size(12).make()
//                   : 'Profile'.text.gray700.size(13).make(),
//             ],
//           ).onInkTap(() {
//             setState(() {
//               pageIndex = 3;
//             });
//           }),
//         ],
//       ),
//     );
//   }
// }
//
// class Page1 extends StatelessWidget {
//   const Page1({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 1",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Page2 extends StatelessWidget {
//   const Page2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 2",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Page4 extends StatelessWidget {
//   const Page4({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 4",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Page5 extends StatelessWidget {
//   const Page5({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xffC4DFCB),
//       child: Center(
//         child: Text(
//           "Page Number 5",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontSize: 45,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }

///todo from here whats app launch in flutter

_launchWhatsapp() async {
  var whatsapp = "+919810015975";
  var whatsappAndroid =
  Uri.parse("whatsapp://send?phone=$whatsapp&text=Welcome To Gyros.");
  if (await canLaunchUrl(whatsappAndroid)) {
    await launchUrl(whatsappAndroid);
  } else {
    Get.snackbar(
      "Whats App not installed ",
      "Please install the what's app Prince",
      colorText: Colors.red.shade400,
      backgroundColor: Colors.white10,
      icon: Icon(Icons.person, color: Colors.red),
      snackPosition: SnackPosition.TOP,
    );
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text("WhatsApp is not installed on the device"),
    //   ),
    // );
  }
}