// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:gyros_app/constants/app_colors.dart';
// import 'package:gyros_app/view/custom_widgets/my_theme.dart';
// import 'package:gyros_app/view/model_cart_practice/controllers/cart_controllersss.dart';
// import 'package:gyros_app/view/model_cart_practice/procucts_cart_modelss.dart';
// import 'package:gyros_app/view/model_cart_practice/widgets/cart_total.dart';
// import 'package:neopop/utils/color_utils.dart';
// import 'package:neopop/utils/constants.dart';
// import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
// import 'package:sizer/sizer.dart';
//
// class Cartproducts extends StatelessWidget {
//   final CartController controller = Get.find();
//   Cartproducts({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       // appBar: AppBar(
//       //   elevation: 0,
//       //   leading: InkWell(
//       //     onTap: () {
//       //       Get.back();
//       //     },
//       //     child: Icon(
//       //       Icons.arrow_back_ios_outlined,
//       //       color: AppColors.themecolors,
//       //     ),
//       //   ),
//       //   backgroundColor: Colors.white,
//       //   title: Text(
//       //     'Cart Item',
//       //     style: TextStyle(
//       //       fontSize: 18.sp,
//       //       fontWeight: FontWeight.bold,
//       //       color: AppColors.themecolors,
//       //     ),
//       //   ),
//       //   centerTitle: true,
//       // ),
//       // backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Obx(
//           () => Container(
//             height: size.height,
//             width: size.width,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: NetworkImage(
//                         'https://images.unsplash.com/photo-1505816805234-97808f0b83e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDd8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=700&q=60'
//                         // 'https://images.unsplash.com/photo-1578922426990-445b9e18e68b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=700&q=60'
//                         //'https://images.unsplash.com/photo-1609473295863-2d9299af71d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=700&q=60'
//                         // 'https://images.unsplash.com/photo-1528901326763-e9bbffd31784?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
//                         //'https://images.unsplash.com/photo-1641806120672-643a30aeda7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
//                         //'https://images.unsplash.com/photo-1633854304077-ebe1af03a5fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80'
//                         // 'https://images.unsplash.com/photo-1586401877159-cd85e3257161?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTJ8MTYyMjMyfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=700&q=60'
//                         //'https://images.unsplash.com/photo-1656164914465-a2b547314dcc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
//                         //'https://images.unsplash.com/photo-1656969881305-188181933deb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OXwxNjIyMzJ8fGVufDB8fHx8&auto=format&fit=crop&w=700&q=60'
//                         //'https://images.unsplash.com/photo-1586683086816-c63476a09d71?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGdyZWVuJTIwdHJlZSUyMGltYWdlJTIwZmFybXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60'
//                         //'https://images.unsplash.com/photo-1613518969875-d2837823e576?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
//                         //'https://images.unsplash.com/photo-1567100160498-848b51e9173f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80'
//                         ),
//                     fit: BoxFit.fill)),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(9.0),
//                     child: Row(
//                       //mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Get.back();
//                           },
//                           child: Icon(
//                             Icons.arrow_back_ios_outlined,
//                             color: AppColors.themecolors,
//                           ),
//                         ),
//                         SizedBox(
//                           width: size.width * 0.28,
//                         ),
//                         Text(
//                           'Cart Item',
//                           style: TextStyle(
//                             fontSize: 18.sp,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.themecolors,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height * 0.65,
//                     child: ListView.builder(
//                         itemCount: controller.products.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 2.w, vertical: 0.8.h),
//                             child: PhysicalModel(
//                               color: Colors.grey,
//                               elevation: 3,
//                               shadowColor: Colors.teal,
//                               child: Container(
//                                 height: 14.h,
//                                 decoration: BoxDecoration(
//                                   //color: Colors.yellow,
//                                   gradient: MyTheme.gradient4,
//                                 ),
//                                 child: CartProductCard(
//                                   controller: controller,
//                                   product:
//                                       controller.products.keys.toList()[index],
//                                   quantity: controller.products.values
//                                       .toList()[index],
//                                   index: index,
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//                   ),
//                   SizedBox(
//                     height: 0.5.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 2.w),
//                     child: Container(
//                       height: size.height * 0.13,
//                       decoration: BoxDecoration(
//                         color: Colors.white70,
//                         //color: Colors.lightGreen.shade200,
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 2.w, vertical: 1.h),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Total Item',
//                                   style: GoogleFonts.poppins(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w700,
//                                       color: Colors.teal),
//                                 ),
//                                 Container(
//                                   height: 4.h,
//                                   width: 8.w,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     gradient: MyTheme.gradient3,
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       controller.count.toString(),
//                                       style: GoogleFonts.poppins(
//                                           color: Colors.white,
//                                           fontSize: 17,
//                                           fontWeight: FontWeight.w700),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 3.w, vertical: 1.h),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Total',
//                                   style: TextStyle(
//                                     color: Colors.teal,
//                                     fontSize: 19,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   '₹${controller.total}',
//                                   style: TextStyle(
//                                     fontSize: 16.sp,
//                                     color: Colors.red.shade400,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 1.h),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 3.w, vertical: 0.5.h),
//                       child: NeoPopButton(
//                         topShadowColor: Colors.green,
//                         leftShadowColor: Colors.green,
//                         color: Colors.black,
//                         bottomShadowColor:
//                             ColorUtils.getVerticalShadow(Colors.green)
//                                 .toColor(),
//                         rightShadowColor:
//                             ColorUtils.getHorizontalShadow(Colors.green)
//                                 .toColor(),
//                         animationDuration: const Duration(milliseconds: 200),
//                         depth: kButtonDepth,
//                         onTapUp: () {
//                           Get.to(() => TotalPrice());
//                         },
//                         border: Border.all(
//                           color: Colors.green,
//                           width: 1,
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 15),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text("CONFIRM",
//                                   style: GoogleFonts.poppins(
//                                     color: MyTheme.ThemeColors,
//                                     fontSize: 13,
//                                     letterSpacing: 2,
//                                     fontWeight: FontWeight.bold,
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 2.h,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CartProductCard extends StatelessWidget {
//   final CartController controller;
//   final Productss product;
//   final int quantity;
//   final int index;
//   const CartProductCard({
//     Key? key,
//     required this.controller,
//     required this.product,
//     required this.quantity,
//     required this.index,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           PhysicalModel(
//             shadowColor: Colors.green,
//             color: Colors.green,
//             borderRadius: BorderRadius.circular(5),
//             elevation: 10,
//             child: Container(
//               height: size.height * 0.18,
//               width: size.width * 0.30,
//               decoration: BoxDecoration(
//                 gradient: MyTheme.gradient3,
//                 borderRadius: BorderRadius.circular(5),
//                 // border: Border.all(
//                 //     color: AppColors.themecolors),
//                 image: DecorationImage(
//                     image: AssetImage(product.imageUrl), fit: BoxFit.cover),
//               ),
//             ),
//           ),
//           // CircleAvatar(
//           //   radius: 40,
//           //   backgroundImage: AssetImage(
//           //     product.imageUrl,
//           //   ),
//           // ),
//           SizedBox(
//             width: 20,
//           ),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   product.name,
//                   style: GoogleFonts.anekBangla(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     letterSpacing: 1,
//                     fontSize: 13.sp,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       "₹${product.price.toString()}",
//                       style: GoogleFonts.anekBangla(
//                         color: Colors.yellowAccent.shade100,
//                         fontSize: 11.sp,
//                         letterSpacing: 1,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       "/${product.weight.toString()}gm",
//                       style: GoogleFonts.anekBangla(
//                         color: Colors.grey.shade800,
//                         letterSpacing: 1,
//                         fontSize: 8.sp,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//
//           Container(
//             height: size.height * 0.045,
//             width: size.height * 0.14,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Row(
//               //mainAxisSize: MainAxisSize.min,
//               children: [
//                 Expanded(
//                   child: NeoPopButton(
//                     color: Colors.grey,
//                     bottomShadowColor: Colors.black12,
//                     //buttonPosition: Position.fullBottom,
//                     depth: 2,
//                     onTapUp: () {
//                       controller.removeProduct(product);
//                     },
//                     border: Border.all(
//                       color: Colors.black12,
//                       width: 2,
//                     ),
//                     child: const Center(
//                       child: Icon(
//                         Icons.remove_circle_outline,
//                         size: 18,
//                         color: Colors.redAccent,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 0.9.w),
//                   child: PhysicalModel(
//                     elevation: 4,
//                     color: Colors.white,
//                     shadowColor: Colors.green,
//                     shape: BoxShape.circle,
//                     child: Container(
//                       height: 4.h,
//                       width: 8.w,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle, color: Colors.white),
//                       child: Center(
//                         child: Text(
//                           '$quantity',
//                           style: GoogleFonts.anekBangla(
//                               color: Colors.black,
//                               fontSize: 11.sp,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: NeoPopButton(
//                     color: Colors.grey,
//                     bottomShadowColor: Colors.green,
//                     rightShadowColor: Colors.green,
//                     //buttonPosition: Position.fullBottom,
//                     depth: 2,
//                     onTapUp: () {
//                       controller.addProduct(product);
//                     },
//                     border: Border.all(
//                       color: Colors.green,
//                       width: 2,
//                     ),
//                     child: const Center(
//                       child: Icon(Icons.add_circle_outline_sharp,
//                           size: 18, color: Colors.greenAccent),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // IconButton(x
//           //   onPressed: () {
//           //     controller.removeProduct(product);
//           //   },
//           //   icon: Icon(Icons.remove_circle),
//           // ),
//           // Text('$quantity'),
//           // IconButton(
//           //     onPressed: () {
//           //       controller.addProduct(product);
//           //     },
//           //     icon: Icon(Icons.add_circle))
//         ],
//       ),
//     );
//   }
// }

///
///
///... Todo: with Api...........................
///
import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/coupan_post_controller/first_user_post_coupan_controller.dart';
import 'package:gyros_app/services/api_provider.dart';
import 'package:gyros_app/view/cart_new_section/empty_cart/empty_cart.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/view/model_cart_practice/controllers/cart_controllersss.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../../controllers/address_list_controller/address_list_controllers.dart';
import '../../../controllers/coupan/get_coupan_controller.dart';
import '../../../controllers/coupan_post_controller/coupan_apply_controller.dart';
import '../../../controllers/coupan_post_controller/coupan_post_controller.dart';
import '../../../controllers/coupan_post_controller/coupan_text_controller.dart';
import '../../../controllers/new_user_coupan_controller/new_user_coupan_controller.dart';
import '../viewss/adress_pagess/address_list/address_listss.dart';

class Cartproducts extends StatelessWidget {

  TextEditingController code = TextEditingController();
  AddressListController _addressListController =
  Get.put(AddressListController());
  final CartController controller = Get.put(CartController());
  CoupanController _coupanController = Get.put(CoupanController());
  CoupanListController _coupanListController = Get.put(CoupanListController());
  CoupanPostController _coupanPostController = Get.put(CoupanPostController());
  FirstCoupanPostController _firstCoupanPostController = Get.put(FirstCoupanPostController());
  CoupanApplyController _coupanApplyController = Get.put(CoupanApplyController());
  CoupanTextController _coupanTextController = Get.put(CoupanTextController());
  Cartproducts({Key? key}) : super(key: key);

  final datacount = GetStorage();

  _loaddata() async {
    await Get.find<CartController>().cartListModel;
  }

  RxBool isLoading = false.obs;
/////////

  // var coupan =  pref.setString('coupan_apply', _coupanListController.getaboutthecoupan!.result[indexx].couponCode);
  // var coupan1 =  pref.getString('coupan_apply');
  // // print("fdsgsdgsdgs: ${coupan.toString()}");
  // print("fdsgsdgsdgs: ${coupan1}");
////////////
//    get_coupan() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     var coupan_apply = pref.getString('coupan_apply');
//     print("kjjkijjjj: ${coupan_apply}");
//   //  return pref.getString('coupan_apply');
//     return coupan_apply;
//   }


  @override
  Widget build(BuildContext context ) {
  // ww= datacount.read('coupan_apply');
  //   print("##########&&&&&&&&&&&&#3: ${ww}");
  //  var coupan1 =  pref.getString('coupan_apply');
   // var a = get_coupan();
   // print("jhfjkshfjkshg: ${a}");
    //SharedPreferences pref =  SharedPreferences.getInstance() ;
  // _loaddata();

   // print("bncnbgebdncjhdbc: ${_coupanListController.Companycoupon.text}");
 //   print("jdfkjsdfkskkldnsdjnm: ${_coupanListController.getaboutthecoupan!.result[0].couponCode}");
    Size size = MediaQuery.of(context).size;
    var coupan1;
   // var coupan1 =  pref.getString('coupan_apply');
    return Scaffold(
      body:
      SafeArea(
        child: Obx(() => (controller.isLoading.value)
              ? Center(child: CircularProgressIndicator())
              : controller.cartListModel?.result == null
                  ? Center(child: Text("You have no item in your Cart"))
           : Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: AppColors.themecolors,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.28,
                        ),
                        Text(
                          'Cart Item',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.themecolors,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.28,
                        ),
                      ],
                    ),
                  ),
                  ///test
                  Container(
                     // height: size.height * 0.65,
                    // color: Colors.green,
                    child: CartProductCard()
                    // GetBuilder<CartController>(
                    //   builder: (controller) {
                    //     return CartProductCard();
                    //   },
                    // ),
                  ),
                  /// original
                  // SizedBox(
                  //   height: size.height * 0.65,
                  //   child: GetBuilder<CartController>(
                  //     builder: (controller) {
                  //       return CartProductCard();
                  //     },
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: 2.w, vertical: 0.8.h),
                  //   child: PhysicalModel(
                  //     color: Colors.grey,
                  //     elevation: 3,
                  //     shadowColor: Colors.teal,
                  //     child: Container(
                  //       height: 14.h,
                  //       decoration: BoxDecoration(
                  //         //color: Colors.yellow,
                  //         gradient: MyTheme.gradient4,
                  //       ),
                  //       child: CartProductCard(
                  //           // controller: controller,
                  //           // product:
                  //           //     controller.products.keys.toList()[index],
                  //           // quantity: controller.products.values
                  //           //     .toList()[index],
                  //           // index: index,
                  //           ),
                  //     ),
                  //   ),
                  // )),
                  SizedBox(
                    height: 0.2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Container(
                      height: size.height * 0.16,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        // color: Colors.lightGreen.shade200,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 0.5.h),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Item',
                                  style: GoogleFonts.poppins(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.teal),
                                ),
                                Container(
                                  height: 4.h,
                                  width: 8.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: MyTheme.gradient3,
                                  ),
                                  child: Center(
                                    child: Text(controller.cartListModel!.totalItem.toString(),
                                     // "${controller.cartListModel?.totalItem.toString()}",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight:
                                          FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 1.h),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(controller.cartListModel!.totalPrice.toString(),
                                  //'₹${controller.cartListModel?.totalPrice}',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.red.shade400,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ///todo: cuppon section start from here.....................................................................................................
                          ///show applied coupan
                          // Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 2.w, vertical: 0.5.h),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Text(ww),
                          //       Text("100"),
                          //      // get_coupan()
                          //       // var coupan6 =  pref.getString('coupan_apply');
                          //      //   Text(get_coupan().toString()),
                          //       // Text("kljglkjgl")
                          //     ]
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  ///coupan code
                  ///
                  Container(
                    // height: 40,
                    // width: 40,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: size.height*0.02,),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child:
                            Container(
                                height: size.height*0.8,
                                width: size.width*0.9,
                                decoration: BoxDecoration(
                                    color: Color(0xffddebdd),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding:  EdgeInsets.only(top: size.height*0.02, left: size.width*0.02),
                                      child: Text('Available Offers' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left: size.width*0.05 , ),
                                      child: Divider(),
                                    ),
////demo
                                    ///first list view builder
                                    SizedBox(
                                      height: size.height*0.13,
                                      // height: size.height*0.37,
                                      width: size.width,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          //itemCount: _coupanListController.getaboutthecoupan!.result.length,
                                          itemCount: 3,
                                          itemBuilder: (BuildContext context, int indexx) {
                                            Size size = MediaQuery.of(context).size;
                                            return Obx(
                                                  () => (_coupanListController.isLoading.value)
                                                  ?
                                                  Center(child: CircularProgressIndicator())
                                                  : Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:  EdgeInsets.only(top: size.height*0.01 , left: size.width*0.05),
                                                        child: DottedBorder(
                                                          dashPattern: [4, 2],
                                                          strokeWidth: 1,
                                                          child: Container(
                                                            height: size.height*0.05,
                                                            width: size.width*0.4,
                                                            color: Color(0xfff7cec8),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: <Widget>[
                                                                /// uneditable text form field
                                                                Padding(
                                                                  padding:  EdgeInsets.only(left: size.width*0.01 , ),
                                                                  child: Text(_coupanListController.getaboutthecoupan!.result[indexx].couponCode.toString(),
                                                                    //'${_coupanListController.getaboutthecoupan?.result[indexx].couponCode.toString()}',
                                                                    style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      ///I have to check this code
                                                      Padding(
                                                        padding:  EdgeInsets.only(right: size.width*0.01 , top: size.height*0.03),
                                                        child:
                                                        InkWell(
                                                          onTap: ()async{
                                                            if(controller.cartListModel!.totalPrice >= 2000){
                                                              SharedPreferences pref =  await SharedPreferences.getInstance() ;
                                                              pref.setString('coupan_apply', _coupanListController.getaboutthecoupan!.result[indexx].couponCode);
                                                              var coupan1 =  pref.getString('coupan_apply');
                                                              _coupanPostController.postcoupanApi();
                                                            }else{
                                                              Get.snackbar("Error", "Amount must be grater than 2000");
                                                            }
                                                          },
                                                          child: Container(
                                                            height: size.height*0.05,
                                                            width: size.width*0.16,
                                                            child: Center(child: Text('Apply' , style: TextStyle(
                                                                fontWeight: FontWeight.bold ,
                                                                color: Colors.green,
                                                                fontSize: 15
                                                            ),
                                                            )),
                                                          ),
                                                        ) ,
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.only( top: size.height*0.03 , left: size.width*0.04 ,),
                                                    child: Text(_coupanListController.getaboutthecoupan!.result[indexx].name.toString(),
                                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.green),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                      ),
                                    ),
//SizedBox(height: size.height*0.02,),
                                    ///Second coupan for new user
                                    SizedBox(
                                      height: size.height*0.2,
                                      width: size.width,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 1,
                                          //itemCount: _coupanController.getcoupanproduct?.result?.length,
                                          itemBuilder: (BuildContext context, int indexx){
//_firstCoupanPostController
                                            return Obx(
                                                  () => (_coupanController.isLoading.value)
                                                  ? Center(child: CircularProgressIndicator())
                                                      : _coupanController.getcoupanproduct!.result!.isEmpty
                                                      ? Center(
                                                    child: Text('No data'),
                                                  )
                                                  : Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:  EdgeInsets.only(top: size.height*0.02 , left: size.width*0.05),
                                                        child: DottedBorder(
                                                          dashPattern: [4, 2],
                                                          strokeWidth: 1,
                                                          child: Container(
                                                            height: size.height*0.05,
                                                            width: size.width*0.4,
                                                            // height: 40,
                                                            // width: 160,
                                                            color: Color(0xfff7cec8),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: <Widget>[
                                                                Padding(
                                                                  padding:  EdgeInsets.only(left: size.width*0.01 , ),
                                                                  child:
                                                                  Text(_coupanController.getcoupanproduct!.result![indexx].coupon.toString(),
                                                                    //'${_coupanController.getcoupanproduct?.result?[indexx].coupon.toString()}%',
                                                                    style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                                                                ),
                                                                Dash(
                                                                  direction: Axis.vertical,
                                                                  length: size.height*0.05,
                                                                  // dashLength: 15,
                                                                ),
                                                                Padding(
                                                                  padding:  EdgeInsets.only(right: size.width*0.02),
                                                                  child: Text(_coupanController.getcoupanproduct!.result![indexx].couponCode.toString(),
                                                                    //"${_coupanController.getcoupanproduct?.result?[indexx].couponCode.toString()}",
                                                                    style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:  EdgeInsets.only(right: size.width*0.01 , top: size.height*0.03),
                                                        //padding:  EdgeInsets.only(right: 10 , top: 30),
                                                        child: InkWell(
                                                          onTap: () async{
                                                         //   print("njkfhnhieewf: ${_coupanController.getcoupanproduct!.result![indexx].couponCode.toString()}");
                                                            SharedPreferences pref =  await SharedPreferences.getInstance() ;
                                                            var coupan =  pref.setString('first_time_coupan',_coupanController.getcoupanproduct!.result![indexx].couponCode.toString());
//_firstCoupanPostController
                                                          //  var coupan =  pref.setString('first_time_coupan',"${_coupanController.getcoupanproduct?.result?[indexx].couponCode.toString()}");
                                                            var coupanfirst =  pref.getString('first_time_coupan');
                                                            // print("fdsgsdgsdgs: ${coupan.toString()}");
                                                            print("ffsgfhsbf: ${coupanfirst}");
                                                            _firstCoupanPostController.postcoupanApi();
                                                            //_coupanPostController.Companycoupon.text;
                                                          },
                                                          child: Container(
                                                            height: size.height*0.05,
                                                            width: size.width*0.16,
                                                            child:
                                                            Center(child: Text('Apply' , style: TextStyle(
                                                                fontWeight: FontWeight.bold ,
                                                                color: Colors.green,
                                                                fontSize: 15
                                                            ),
                                                            )),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.only( top: size.height*0.02 ,left: size.width*0.04 ),
                                                    // padding:  EdgeInsets.only(left: 10 , top: 10),
                                                    child: Text(_coupanController.getcoupanproduct!.result![indexx].name.toString(),
                                                    //  "${_coupanController.getcoupanproduct?.result?[indexx].name.toString()}",
                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                    SizedBox(height: size.height*0.04,),
                                    Padding(
                                      padding:  EdgeInsets.only(left: size.width*0.01 , right: size.width*0.01),
                                      child: DottedLine(
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(top: 8 , left: 10 , bottom: 2),
                                      child: Text('Got a coupan code? Enter it here' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15
                                      ),),
                                    ),
                                    ///get shared prefrences
                                    Padding(
                                      padding:  EdgeInsets.all(10.0),
                                      child: Container(
                                        color: Colors.white,
                                        child: TextFormField(
                                          // initialValue: Text(box.read('key')).toString(),
                                          controller: _coupanPostController.textfieldcoupon,
                                          validator: (value) {
                                            return _coupanPostController.validateCoupan(value!);
                                          },
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              labelText: 'Enter Coupan code'
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left: size.width*0.08, right: size.width*0.08 , top: size.height*0.01),
                                      child: InkWell(
                                        onTap: (){
                                          _coupanPostController.checkcoupontextfield();
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: size.height * 0.065,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [Color(0xff3a923b),
                                                    Color(0xffb5d047),]),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(0, 0),
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  //color: darkShadow,
                                                ),
                                                BoxShadow(
                                                  offset: Offset(-1, -1),
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                ),
                                              ]
                                          ),
                                          child: Center(
                                            child: Text('APPLY', style: TextStyle(
                                                fontSize: size.width * 0.049,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ],

                      ),
                    ),
                  ),
                  ///wrong code of confirm code
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.w, vertical: 0.5.h),
                      child: NeoPopButton(
                        topShadowColor: Color(0xffb5d047),
                        leftShadowColor: Color(0xffb5d047),
                        color: Color(0xff3a923b),
                        bottomShadowColor:
                        ColorUtils.getVerticalShadow(
                            Color(0xffb5d047))
                            .toColor(),
                        rightShadowColor:
                        ColorUtils.getHorizontalShadow(
                            Color(0xffb5d047))
                            .toColor(),
                        animationDuration:
                        Duration(milliseconds: 200),
                        depth: kButtonDepth,
                        onTapUp: () {
                           _addressListController.addresListApi();
                           _addressListController.update();
                          ///.....................................................................
                          Get.to(() => AddressList());
                        },
                        border: Border.all(
                          color: Colors.green,
                          width: 1,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Text("CONFIRM",
                                  style: GoogleFonts.poppins(
                                    // color: MyTheme.ThemeColors,
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
///TODO: CART LIST ITEM ........................CARD

class CartProductCard extends StatelessWidget {
  final CartController controller = Get.find();
  CartProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var base = 'https://api.gyros.farm/Images/';
    return Column(
      children: [
          // controller.cartListModel?.result.length == 0 ? Center(child: Text("Your Cart is empty")) :
          Container(
         // height: size.height*0.3,
           // height: size.height * 0.65,
            child:
            ListView.builder(
                itemCount: controller.cartListModel?.result.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Obx(
                    () => (controller.isLoading.value)
                        ? Center(child: CircularProgressIndicator())
                        // : controller.cartListModel?.result== null
                        //     ? Center(
                        //         child: Text('No List'),
                        //       )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color(0xff3a923b),
                                          Color(0xffb5d047),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        PhysicalModel(
                                          shadowColor: Colors.green,
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(5),
                                          elevation: 10,
                                          child: Container(
                                            height: size.height * 0.13,
                                            width: size.width * 0.30,
                                            decoration: BoxDecoration(
                                              gradient: MyTheme.gradient3,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    base + '${controller.cartListModel?.result[index].image.toString()}',
                                                  ),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: size.width * 0.55,
                                                height: size.height * 0.1,
                                                child: Text("${controller.cartListModel?.result[index].productName.toString()}",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                  style: GoogleFonts.anekBangla(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 11.sp,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.02,
                                              ),
                                              Row(
                                                children: [
                                                  Text("₹${controller.cartListModel?.result[index].price.toString()}",
                                                  style:  TextStyle(
                                                    decoration: TextDecoration.lineThrough,
                                                      decorationStyle: TextDecorationStyle
                                                          .solid,
                                                      decorationColor: Colors
                                                          .red
                                                          .shade700,
                                                      decorationThickness:
                                                      1.2,
                                                      fontWeight:
                                                      FontWeight
                                                          .w600,
                                                      fontSize:
                                                      8.sp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(width: size.width*0.02,),
                                                  Text(
                                                    "₹${controller.cartListModel?.result[index].finalAmount.toString()
                                                    //product.price.toString()
                                                    }",
                                                    style: GoogleFonts.anekBangla(
                                                      fontSize: 10.sp,
                                                      letterSpacing: 1,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: size.height * 0.045,
                                          width: size.height * 0.14,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            //mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                child: NeoPopButton(
                                                  color: Colors.grey,
                                                  bottomShadowColor: Colors.black12,
                                                  //buttonPosition: Position.fullBottom,
                                                  depth: 2,
                                                  onTapUp: () {
                                                    controller.minuscartApi(
                                                        controller.cartListModel?.result[index].id.toString());
                                                  },
                                                  border: Border.all(
                                                    color: Colors.black12,
                                                    width: 2,
                                                  ),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.remove_circle_outline,
                                                      size: 18,
                                                      color: Colors.redAccent,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0.9.w),
                                                child: PhysicalModel(
                                                  elevation: 4,
                                                  color: Colors.white,
                                                  shadowColor: Colors.green,
                                                  shape: BoxShape.circle,
                                                  child: Container(
                                                    height: 4.h,
                                                    width: 8.w,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white),
                                                    child: Center(
                                                      child: Text("${controller.cartListModel?.result[index].count}",
                                                        style: GoogleFonts.anekBangla(color: Colors.black,fontSize: 11.sp,fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: NeoPopButton(
                                                  color: Colors.grey,
                                                  bottomShadowColor: Colors.green,
                                                  rightShadowColor: Colors.green,
                                                  depth: 2,
                                                  onTapUp: () {controller.pluscartApi(controller.cartListModel?.result[index].id.toString());
                                                  },
                                                  border: Border.all(
                                                    color: Colors.green,
                                                    width: 2,
                                                  ),
                                                  child: const Center(
                                                    child: Icon(
                                                        Icons.add_circle_outline_sharp,
                                                        size: 18,
                                                        color: Colors.greenAccent),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                  );
                })),
        ///coupan code
        ///
        ///
//         Container(
//           // height: 40,
//           // width: 40,
//           child: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 SizedBox(height: size.height*0.02,),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child:
//                   Container(
//                       height: size.height*0.8,
//                       width: size.width*0.9,
//                       // height: 550,
//                       // width: 400,
//                       decoration: BoxDecoration(
//                           color: Color(0xffddebdd),
//                           borderRadius: BorderRadius.circular(10)
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Padding(
//                             padding:  EdgeInsets.only(top: size.height*0.02, left: size.width*0.02),
//                             // padding: const EdgeInsets.only(top: 30, left: 20),
//                             child: Text('Available Offers' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
//                           ),
//                           Padding(
//                             padding:  EdgeInsets.only(left: size.width*0.05 , ),
//                             child: Divider(),
//                           ),
// ////demo
//
//                           ///first list view builder
//                           SizedBox(
//                             height: size.height*0.13,
//                             // height: size.height*0.37,
//                             width: size.width,
//                             child: ListView.builder(
//                                 shrinkWrap: true,
//                                 //itemCount: _coupanListController.getaboutthecoupan!.result.length,
//                                 itemCount: 3,
//                                 itemBuilder: (BuildContext context, int indexx) {
//                                   // print("jbvdgbfjhsfuwhf: ${_coupanListController.getaboutthecoupan!.result[indexx].couponCode}");
//                                   //  box.write('key', _coupanListController.getaboutthecoupan!.result[indexx].couponCode);
//                                   Size size = MediaQuery.of(context).size;
//                                   return Obx(
//                                         () => (_coupanListController.isLoading.value)
//                                         ? Center(child: CircularProgressIndicator())
//                                         : _coupanListController.getaboutthecoupan!.result.isEmpty
//                                         ? Center(
//                                       child: Text('No data'),
//                                     )
//                                         : Column(
//                                       children: [
//
//                                         Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//
//                                             Padding(
//                                               padding:  EdgeInsets.only(top: size.height*0.01 , left: size.width*0.05),
//                                               child: DottedBorder(
//                                                 dashPattern: [4, 2],
//                                                 strokeWidth: 1,
//                                                 child: Container(
//                                                   height: size.height*0.05,
//                                                   width: size.width*0.4,
//                                                   // height: 40,
//                                                   // width: 160,
//                                                   color: Color(0xfff7cec8),
//                                                   child: Row(
//                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                     children: <Widget>[
//                                                       /// uneditable text form field
//                                                       Padding(
//                                                         padding:  EdgeInsets.only(left: size.width*0.01 , ),
//                                                         child:
//                                                         // TextFormField(
//                                                         //   readOnly: true,
//                                                         //   controller: _coupanListController.Companycoupon,
//                                                         //   decoration: InputDecoration(
//                                                         //       border: OutlineInputBorder(
//                                                         //           borderRadius: BorderRadius.circular(10)
//                                                         //       ),
//                                                         //       labelText: 'Gyros87110'
//                                                         //   ),
//                                                         // ),
//
//
//                                                         Text('${_coupanListController.getaboutthecoupan!.result[indexx].couponCode.toString()}',
//                                                           style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
//                                                       ),
//
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             ///I have to check this code
//                                             Padding(
//                                               padding:  EdgeInsets.only(right: size.width*0.01 , top: size.height*0.03),
//                                               child:
//                                               // TextButton(
//                                               //   onPressed: (){
//                                               //     },
//                                               //   child: Text("Apply"),
//                                               // )
//
//                                               InkWell(
//                                                 onTap: (){
//                                                   // _coupanPostController.Companycoupon.text = 'Apply' ;
//                                                   // _coupanPostController.Companycoupon.text.toString();
//                                                   //_coupanPostController.postcoupanApi();
//                                                   box.write('key' , 'value');
//
//                                                 },
//                                                 child: Container(
//                                                   height: size.height*0.05,
//                                                   width: size.width*0.16,
//                                                   child:
//                                                   Center(child: Text('Apply' , style: TextStyle(
//                                                       fontWeight: FontWeight.bold ,
//                                                       color: Colors.green,
//                                                       fontSize: 15
//                                                   ),
//                                                   ))
//                                                   ,
//                                                   // decoration: BoxDecoration(
//                                                   //     gradient:
//                                                   //     LinearGradient(
//                                                   //       colors: <
//                                                   //           Color>[
//                                                   //         Color(
//                                                   //             0xff3a923b),
//                                                   //         Color(
//                                                   //             0xffb5d047),
//                                                   //       ],
//                                                   //     ),
//                                                   //     borderRadius: BorderRadius.circular(10)
//                                                   // ),
//                                                 ),
//                                               ) ,
//
//                                             )
//                                           ],
//                                         ),
//                                         Padding(
//                                           padding:  EdgeInsets.only( top: size.height*0.03 , left: size.width*0.04 ,),
//                                           // padding:  EdgeInsets.only(left: 10 , top: 10),
//                                           child: Text('${_coupanListController.getaboutthecoupan!.result[indexx].name.toString()}',
//                                             style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.green),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 }
//                             ),
//                           ),
// //SizedBox(height: size.height*0.02,),
//                           ///Second coupan for new user
//                           SizedBox(
//                             height: size.height*0.2,
//                             width: size.width,
//                             child: ListView.builder(
//                                 shrinkWrap: true,
//                                 itemCount: 1,
//                                 //itemCount: _coupanController.getcoupanproduct?.result?.length,
//                                 itemBuilder: (BuildContext context, int indexx){
//
//                                   return Obx(
//                                         () => (_coupanController.isLoading.value)
//                                         ? Center(child: CircularProgressIndicator())
//                                         : _coupanController.getcoupanproduct!.result!.isEmpty
//                                         ? Center(
//                                       child: Text('No data'),
//                                     )
//
//                                         : Column(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Padding(
//                                               padding:  EdgeInsets.only(top: size.height*0.02 , left: size.width*0.05),
//                                               child: DottedBorder(
//                                                 dashPattern: [4, 2],
//                                                 strokeWidth: 1,
//                                                 child: Container(
//                                                   height: size.height*0.05,
//                                                   width: size.width*0.4,
//                                                   // height: 40,
//                                                   // width: 160,
//                                                   color: Color(0xfff7cec8),
//                                                   child: Row(
//                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                     children: <Widget>[
//                                                       Padding(
//                                                         padding:  EdgeInsets.only(left: size.width*0.01 , ),
//                                                         child:
//                                                         Text('${_coupanController.getcoupanproduct!.result![indexx].coupon.toString()}%',
//                                                           style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
//                                                       ),
//                                                       Dash(
//                                                         direction: Axis.vertical,
//                                                         length: size.height*0.05,
//                                                         // dashLength: 15,
//                                                       ),
//                                                       Padding(
//                                                         padding:  EdgeInsets.only(right: size.width*0.02),
//                                                         child: Text(_coupanController.getcoupanproduct!.result![indexx].couponCode.toString(),
//
//                                                           style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//
//                                             // //////////TextFormField(
//                                             //                                                     controller: _coupanPostController.Companycoupon,
//                                             //
//                                             //                                                     // validator: (value) {
//                                             //                                                     //   return _coupanPostController.validatename(value!);
//                                             //                                                     // },
//                                             //                                                     decoration: InputDecoration(
//                                             //                                                         border: OutlineInputBorder(
//                                             //                                                             borderRadius: BorderRadius.circular(10)
//                                             //                                                         ),
//                                             //                                                         labelText: 'Enter Coupan code'
//                                             //                                                     ),
//                                             //                                                   ),
//                                             //
//                                             //
//
//
//                                             Padding(
//                                               padding:  EdgeInsets.only(right: size.width*0.01 , top: size.height*0.03),
//                                               //padding:  EdgeInsets.only(right: 10 , top: 30),
//                                               child: InkWell(
//                                                 onTap: (){
//                                                   //_coupanPostController.Companycoupon;
//                                                   // _coupanPostController.Companycoupon.text.toString();
//                                                   _coupanPostController.postcoupanApi();
//                                                   _coupanPostController.Companycoupon.text;
//                                                 },
//                                                 child: Container(
//                                                   height: size.height*0.05,
//                                                   width: size.width*0.16,
//                                                   child:
//                                                   Center(child: Text('Apply' , style: TextStyle(
//                                                       fontWeight: FontWeight.bold ,
//                                                       color: Colors.green,
//                                                       fontSize: 15
//                                                   ),
//                                                   ))
//                                                   ,
//                                                   // decoration: BoxDecoration(
//                                                   //     gradient:
//                                                   //     LinearGradient(
//                                                   //       colors: <
//                                                   //           Color>[
//                                                   //         Color(
//                                                   //             0xff3a923b),
//                                                   //         Color(
//                                                   //             0xffb5d047),
//                                                   //       ],
//                                                   //     ),
//                                                   //     borderRadius: BorderRadius.circular(10)
//                                                   // ),
//                                                 ),
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                         Padding(
//                                           padding:  EdgeInsets.only( top: size.height*0.02 ,left: size.width*0.04 ),
//                                           // padding:  EdgeInsets.only(left: 10 , top: 10),
//                                           child: Text(_coupanController.getcoupanproduct!.result![indexx].name.toString(),
//                                             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 }
//                             ),
//                           ),
//
//                           // SizedBox(height: size.height*0.04,),
//                           Padding(
//                             padding:  EdgeInsets.only(left: size.width*0.01 , right: size.width*0.01),
//                             child: DottedLine(
//
//                             ),
//                           ),
//                           Padding(
//                             padding:  EdgeInsets.only(top: 8 , left: 10 , bottom: 2),
//                             child: Text('Got a coupan code? Enter it here' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15
//                             ),),
//                           ),
//
//                           ///get shared prefrences
//                           // Text(box.read('key')),
//                           //api
//                           Padding(
//                             padding:  EdgeInsets.all(10.0),
//                             child: Container(
//                               color: Colors.white,
//                               child: TextFormField(
//                                 // initialValue: Text(box.read('key')).toString(),
//                                 controller: _coupanPostController.Companycoupon,
//
//
//                                 decoration: InputDecoration(
//                                     border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(10)
//                                     ),
//                                     labelText: 'Enter Coupan code'
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding:  EdgeInsets.only(left: size.width*0.08, right: size.width*0.08 , top: size.height*0.01),
//                             child: InkWell(
//                               onTap: (){
//                                 _coupanPostController.Companycoupon.text.toString();
//                                 _coupanPostController.postcoupanApi();
//
//                               },
//                               child: Container(
//                                 width: double.infinity,
//                                 height: size.height * 0.065,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                     gradient: LinearGradient(
//                                         begin: Alignment.topCenter,
//                                         end: Alignment.bottomCenter,
//                                         colors: [
//                                           Color(
//                                               0xff3a923b),
//                                           Color(
//                                               0xffb5d047),
//                                         ]),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         offset: Offset(0, 0),
//                                         spreadRadius: 1,
//                                         blurRadius: 1,
//                                         //color: darkShadow,
//                                       ),
//                                       BoxShadow(
//                                         offset: Offset(-1, -1),
//                                         spreadRadius: 1,
//                                         blurRadius: 1,
//                                         //color: lightShadow,
//                                       ),
//                                     ]
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     'SUBMIT',
//                                     style: TextStyle(
//                                       fontSize: size.width * 0.049,
//                                       fontWeight: FontWeight.w800,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                   ),
//                 ),
//
//
//               ],
//
//             ),
//           ),
//
//         ),
      ],
    );
  }
}
