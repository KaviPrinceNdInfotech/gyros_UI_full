import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/gift_box_controller.dart';
import 'package:gyros_app/controllers/rozar_pay_controller/rozar_pay_controller.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_navbar.dart';
import 'package:gyros_app/view/model_cart_practice/controllers/cart_controllersss.dart';
import 'package:gyros_app/view/model_cart_practice/widgets/gradient_button.dart';
import 'package:sizer/sizer.dart';

import '../../../../controllers/flash_sale_product_by_id_controllers/flash_product_by_id_controller.dart';
import '../../../botttom_nav_bar/bottom_nav_bar_controller.dart';

class GiftBox extends StatelessWidget {
  GiftBox({Key? key}) : super(key: key);

  final RozarPayController _rozarPayController = Get.find();
  NavController _navController = Get.put(NavController());
  final CartController controller = Get.put(CartController());

  GiftBoxController _giftBoxController = Get.put(GiftBoxController());
  final CartController cartController = Get.put(CartController());
  FlashProductByIdController _flashProductByIdController =
      Get.put(FlashProductByIdController());

  var height, width;

  @override
  Widget build(BuildContext context) {
    final List<String> text1 = [
      'New',
      'New',
      'BestSeller',
      'BestSeller',
      'New',
      'New',
      'BestSeller',
      'BestSeller',
    ];
    final List<String> text2 = [
      'Gift 1',
      'Gift 2',
      "Gift 3",
      'Gift 4',
      'Gift 5',
      'Gift 6',
      "Gift 7",
      'Gift 8',
    ];

    final List<String> image1 = [
      'lib/assets/asset/gft11.jpeg',
      'lib/assets/asset/gft33.jpeg',
      'lib/assets/asset/gft44.jpeg',
      'lib/assets/asset/gft66.jpeg',
      'lib/assets/asset/gft11.jpeg',
      'lib/assets/asset/gft33.jpeg',
      'lib/assets/asset/gft44.jpeg',
      'lib/assets/asset/gft66.jpeg',
    ];
    Size size = MediaQuery.of(context).size;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    var base = 'https://api.gyros.farm/Images/';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Gift Box',
          style: TextStyle(
              color: AppColors.themecolors, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
            onTap: () {
              _navController.tabindex(0);
              Get.to(() => NavBar());
              //Get.back();
              // _homePageController.toggle(index);
              //Get.to(() => WalkTracking());
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.themecolors,
            )),
      ),
      body: Obx(
        () => (_giftBoxController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            //: _allProductController.allProductModel!.result != null
            : _giftBoxController.giftcardModel!.result == null
                //: _giftBoxController.giftcardModel!.result!.isEmpty
                ? Center(
                    child: Text('No data'),
                  )
                : SizedBox(
                    height: size.height * 0.93,
                    width: size.width,
                    // color: Colors.red,
                    child: ListView.builder(
                        // shrinkWrap: true,
                        itemCount:
                            _giftBoxController.giftcardModel!.result!.length,
                        itemBuilder: (BuildContext contextr, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.003),
                            child: Column(
                              children: [
                                Container(
                                  height: size.height * 0.520,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blueGrey,
                                      border: Border.all(
                                          color: Colors.green, width: 0)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(6.5),
                                        child: PhysicalModel(
                                          color: Colors.transparent,
                                          elevation: 10,
                                          child: InkWell(
                                            onTap: () {
                                              _flashProductByIdController
                                                      .productid =
                                                  _giftBoxController
                                                      .giftcardModel!
                                                      .result![index]
                                                      .id
                                                      .toString();
                                              _flashProductByIdController
                                                  .flashproductbyIdApi();
                                              // _flashProductByIdController
                                              //     .productid =
                                              //     _allProductController
                                              //         .allProductModel!
                                              //         .result![index]
                                              //         .id
                                              //         .toString();
                                              // _flashProductByIdController
                                              //     .flashproductbyIdApi();
                                            },
                                            child: Container(
                                              height: size.height * 0.38,
                                              //color: Colors.red,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey,
                                                image: DecorationImage(
                                                    image: NetworkImage(base +
                                                        '${_giftBoxController.giftcardModel!.result![index].imageName.toString()}'),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: size.height * 0.12,
                                        //color: Color(0xff023020),
                                        decoration: BoxDecoration(
                                            color: Color(0xff023020),
                                            border: Border.all(
                                                color: Colors.blueGrey,
                                                width: 2)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.02),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // Text(
                                                  //   '${_giftBoxController.giftcardModel!.result![index]..toString()} gm',
                                                  //   style: TextStyle(
                                                  //     fontWeight:
                                                  //     FontWeight.w700,
                                                  //     fontSize: 10.sp,
                                                  //     color: Colors.white,
                                                  //   ),
                                                  // ),
                                                  SizedBox(
                                                    height: size.height * 0.007,
                                                  ),

                                                  // SizedBox(
                                                  //   width: size
                                                  //       .width *
                                                  //       0.18,
                                                  //   height: size
                                                  //       .height *
                                                  //       0.02,
                                                  //   child: Text(
                                                  //     _homePageController
                                                  //         .getflashsellproduct!
                                                  //         .result![
                                                  //     index]
                                                  //         .productName
                                                  //         .toString(),
                                                  //     overflow:
                                                  //     TextOverflow
                                                  //         .ellipsis,
                                                  //     maxLines:
                                                  //     1,
                                                  //     style:
                                                  //     TextStyle(
                                                  //       fontWeight:
                                                  //       FontWeight.w700,
                                                  //       fontSize:
                                                  //       9.sp,
                                                  //       color: Colors
                                                  //           .black,
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  SizedBox(
                                                    width: size.width * 0.48,
                                                    height: size.height * 0.03,
                                                    child: Text(
                                                      _giftBoxController
                                                          .giftcardModel!
                                                          .result![index]
                                                          .name
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 15.sp,
                                                        color: Colors.yellow,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.01,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '₹${_giftBoxController.giftcardModel!.result![index].price.toString()}',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 13.sp,
                                                          color: Colors
                                                              .yellowAccent,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.009,
                                                      ),
                                                      // Text(
                                                      //   '₹${_allProductController.allProductModel!.result![index].price.toString()}',
                                                      //   style: TextStyle(
                                                      //     decoration:
                                                      //     TextDecoration
                                                      //         .lineThrough,
                                                      //     // decorationStyle:
                                                      //     //     TextDecorationStyle.wavy,
                                                      //     decorationColor:
                                                      //     Colors
                                                      //         .red.shade900,
                                                      //     decorationThickness:
                                                      //     2.85,
                                                      //     fontWeight:
                                                      //     FontWeight.w700,
                                                      //     fontSize: 10.sp,
                                                      //     color: Colors.white,
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),

                                                  // Padding(
                                                  //   padding: EdgeInsets.symmetric(
                                                  //       horizontal: 0.5.w),
                                                  //   child: Row(
                                                  //     mainAxisAlignment:
                                                  //         MainAxisAlignment
                                                  //             .spaceBetween,
                                                  //     children: [
                                                  //       SizedBox(
                                                  //         width: size.width * 0.50,
                                                  //         height:
                                                  //             size.height * 0.025,
                                                  //         child: Text(
                                                  //           _catByIdController
                                                  //               .getcatbyid!
                                                  //               .result![index]
                                                  //               .productName
                                                  //               .toString(),
                                                  //           overflow: TextOverflow
                                                  //               .ellipsis,
                                                  //           maxLines: 3,
                                                  //           style: TextStyle(
                                                  //             fontWeight:
                                                  //                 FontWeight.w700,
                                                  //             fontSize: 15.sp,
                                                  //             color: Colors.yellow,
                                                  //           ),
                                                  //         ),
                                                  //       ),
                                                  //       Text(
                                                  //         'Save 30%',
                                                  //         style: TextStyle(
                                                  //           fontWeight:
                                                  //               FontWeight.w500,
                                                  //           fontSize: 13.sp,
                                                  //           color: Colors.white,
                                                  //         ),
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                  // Padding(
                                                  //   padding: EdgeInsets.symmetric(
                                                  //       horizontal: 0.5.w),
                                                  //   child: Row(
                                                  //     children: [
                                                  //       SizedBox(
                                                  //         width: size.width,
                                                  //         //width: 23.w,
                                                  //         child: Padding(
                                                  //           padding: EdgeInsets
                                                  //               .symmetric(
                                                  //                   horizontal:
                                                  //                       size.width *
                                                  //                           0.00),
                                                  //           child: Row(
                                                  //             // mainAxisAlignment:
                                                  //             //     MainAxisAlignment
                                                  //             //         .spaceBetween,
                                                  //             children: [
                                                  //               Text(
                                                  //                 '₹${_catByIdController.getcatbyid!.result![index].price.toString()}',
                                                  //                 style: TextStyle(
                                                  //                   fontWeight:
                                                  //                       FontWeight
                                                  //                           .w900,
                                                  //                   fontSize: 13.sp,
                                                  //                   color: Colors
                                                  //                       .yellowAccent,
                                                  //                 ),
                                                  //               ),
                                                  //               Text(
                                                  //                 '/500 gm',
                                                  //                 style: TextStyle(
                                                  //                   fontWeight:
                                                  //                       FontWeight
                                                  //                           .w700,
                                                  //                   fontSize: 10.sp,
                                                  //                   color: Colors
                                                  //                       .white,
                                                  //                 ),
                                                  //               ),
                                                  //
                                                  //               // Spacer(),
                                                  //               // SizedBox(
                                                  //               //   width: 4.w,
                                                  //               // ),
                                                  //               Container(
                                                  //                 height: 4.5.h,
                                                  //                 width: 33.5.w,
                                                  //                 decoration:
                                                  //                     BoxDecoration(
                                                  //                   borderRadius:
                                                  //                       BorderRadius
                                                  //                           .circular(
                                                  //                               20),
                                                  //                 ),
                                                  //                 child: InkWell(
                                                  //                   onTap: () {
                                                  //                     cartController
                                                  //                         .addProduct(
                                                  //                             Productss
                                                  //                                 .products[index]);
                                                  //                   },
                                                  //                   child:
                                                  //                       RaisedGradientButton(
                                                  //                     //height: 3.3.h,
                                                  //                     //width: 23.9.w,
                                                  //                     child: Text(
                                                  //                       'Add To Cart',
                                                  //                       style: TextStyle(
                                                  //                           color: Colors
                                                  //                               .white,
                                                  //                           fontWeight:
                                                  //                               FontWeight
                                                  //                                   .w600,
                                                  //                           fontSize:
                                                  //                               10.sp),
                                                  //                     ),
                                                  //                     gradient:
                                                  //                         LinearGradient(
                                                  //                       colors: <
                                                  //                           Color>[
                                                  //                         Colors
                                                  //                             .green,
                                                  //                         Colors
                                                  //                             .cyan
                                                  //                             .shade400
                                                  //                       ],
                                                  //                     ),
                                                  //                     onPressed:
                                                  //                         () {
                                                  //                       cartController
                                                  //                           .addProduct(
                                                  //                               Productss.products[index]);
                                                  //                       print(
                                                  //                           'Add To cart');
                                                  //                     },
                                                  //                   ),
                                                  //                 ),
                                                  //               ),
                                                  //             ],
                                                  //           ),
                                                  //         ),
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Obx(
                                                    () => (_giftBoxController
                                                            .isLoading.value)
                                                        ? Center(
                                                            child:
                                                                CircularProgressIndicator())
                                                        : _giftBoxController
                                                                    .giftcardModel!
                                                                    .result ==
                                                                null
                                                            //: _allProductController.allProductModel!.result!.isEmpty
                                                            //_bestSellerController.bestsellermodel!.result!.isEmpty
                                                            ? Center(
                                                                child: Text(
                                                                  'Save:'
                                                                  'No data'
                                                                  "%",
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        10.sp,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              )
                                                            : Text(
                                                                'Save ${_giftBoxController.giftcardModel!.result![index].discount}%',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      10.sp,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                  ),

                                                  // Spacer(),
                                                  // SizedBox(
                                                  //   width: 4.w,
                                                  // ),
                                                  SizedBox(
                                                    height: size.height * 0.02,
                                                  ),
                                                  Container(
                                                    height: 4.5.h,
                                                    width: 33.5.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: InkWell(
                                                      onTap: () {
                                                        controller.addtocartApi(
                                                            _giftBoxController
                                                                .giftcardModel!
                                                                .result![index]
                                                                .id);
                                                        // cartController
                                                        //     .addProduct(Productss
                                                        //             .products[
                                                        //         index]);
                                                      },
                                                      child:
                                                          RaisedGradientButton(
                                                        //height: 3.3.h,
                                                        //width: 23.9.w,
                                                        child: Text(
                                                          'Add To Cart',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 10.sp),
                                                        ),
                                                        gradient:
                                                            LinearGradient(
                                                          colors: <Color>[
                                                            Color(0xff3a923b),
                                                            Color(0xffb5d047),
                                                            // Colors.green,
                                                            // Colors.cyan.shade400
                                                          ],
                                                        ),
                                                        onPressed: () {
                                                          // cartController
                                                          //     .addProduct(Productss
                                                          //             .products[
                                                          //         index]);
                                                          print('Add To cart');
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );

                          //   Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       vertical: size.height * 0.003),
                          //   child: Container(
                          //     height: size.height * 0.520,
                          //     width: size.width,
                          //     decoration: BoxDecoration(
                          //         color: Colors.blueGrey,
                          //         border: Border.all(
                          //             color: Colors.green, width: 0)),
                          //     child: Column(
                          //       children: [
                          //         Padding(
                          //           padding: EdgeInsets.all(6.5),
                          //           child: PhysicalModel(
                          //             color: Colors.red,
                          //             elevation: 10,
                          //             child: InkWell(
                          //               onTap: () {
                          //                 _flashProductByIdController
                          //                         .productid =
                          //                     _giftBoxController.giftcardModel!
                          //                         .result![index].id
                          //                         .toString();
                          //                 _flashProductByIdController
                          //                     .flashproductbyIdApi();
                          //               },
                          //               child: Container(
                          //                 height: size.height * 0.38,
                          //                 //color: Colors.red,
                          //                 decoration: BoxDecoration(
                          //                   color: Colors.grey,
                          //                   image: DecorationImage(
                          //                       image: NetworkImage(base +
                          //                           '${_giftBoxController.giftcardModel!.result![index].imageName.toString()}'),
                          //                       fit: BoxFit.fill),
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //         Container(
                          //           height: size.height * 0.12,
                          //           //color: Color(0xff023020),
                          //           decoration: BoxDecoration(
                          //               color: Color(0xff023020),
                          //               border: Border.all(
                          //                   color: Colors.blueGrey, width: 2)),
                          //           child: Padding(
                          //             padding: EdgeInsets.symmetric(
                          //                 horizontal: size.width * 0.02),
                          //             child: Row(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.spaceBetween,
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.center,
                          //               children: [
                          //                 Column(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.center,
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.start,
                          //                   children: [
                          //                     Text(
                          //                       _giftBoxController
                          //                           .giftcardModel!
                          //                           .result![index]
                          //                           .name
                          //                           .toString(),
                          //                       overflow: TextOverflow.ellipsis,
                          //                       maxLines: 3,
                          //                       style: TextStyle(
                          //                         fontWeight: FontWeight.w700,
                          //                         fontSize: 13.sp,
                          //                         color: Colors.yellow,
                          //                       ),
                          //                     ),
                          //                     SizedBox(
                          //                       height: size.height * 0.02,
                          //                     ),
                          //                     Row(
                          //                       children: [
                          //                         Text(
                          //                           '₹${_giftBoxController.giftcardModel!.result![index].price.toString()}',
                          //                           style: TextStyle(
                          //                             fontWeight:
                          //                                 FontWeight.w900,
                          //                             fontSize: 12.sp,
                          //                             color:
                          //                                 Colors.yellowAccent,
                          //                           ),
                          //                         ),
                          //                         Text(
                          //                           '/500 gm',
                          //                           style: TextStyle(
                          //                             fontWeight:
                          //                                 FontWeight.w700,
                          //                             fontSize: 9.sp,
                          //                             color: Colors.white,
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ],
                          //                 ),
                          //                 Column(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.center,
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.end,
                          //                   children: [
                          //                     Text(
                          //                       'Save 30%',
                          //                       style: TextStyle(
                          //                         fontWeight: FontWeight.w700,
                          //                         fontSize: 9.sp,
                          //                         color: Colors.white,
                          //                       ),
                          //                     ),
                          //
                          //                     // Spacer(),
                          //                     // SizedBox(
                          //                     //   width: 4.w,
                          //                     // ),
                          //                     SizedBox(
                          //                       height: size.height * 0.02,
                          //                     ),
                          //                     Container(
                          //                       height: 4.5.h,
                          //                       width: 33.5.w,
                          //                       decoration: BoxDecoration(
                          //                         borderRadius:
                          //                             BorderRadius.circular(20),
                          //                       ),
                          //                       child: InkWell(
                          //                         onTap: () {
                          //                           controller.addtocartApi(
                          //                               _giftBoxController
                          //                                   .giftcardModel!
                          //                                   .result![index]
                          //                                   .id);
                          //                           // cartController
                          //                           //     .addProduct(
                          //                           //         Productss
                          //                           //                 .products[
                          //                           //             index]);
                          //                         },
                          //                         child: RaisedGradientButton(
                          //                           //height: 3.3.h,
                          //                           //width: 23.9.w,
                          //                           child: Text(
                          //                             'Add To Cart',
                          //                             style: TextStyle(
                          //                                 color: Colors.white,
                          //                                 fontWeight:
                          //                                     FontWeight.w600,
                          //                                 fontSize: 10.sp),
                          //                           ),
                          //                           gradient: LinearGradient(
                          //                             colors: <Color>[
                          //                               Color(0xff3a923b),
                          //                               Color(0xffb5d047),
                          //                               // Colors.green,
                          //                               // Colors.cyan
                          //                               //     .shade400
                          //                             ],
                          //                           ),
                          //                           onPressed: () {
                          //                             cartController.addProduct(
                          //                                 Productss
                          //                                     .products[index]);
                          //                             print('Add To cart');
                          //                           },
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // );
                        }),
                  ),

        // Container(
        //             height: size.height,
        //             width: size.width,
        //             child: Column(
        //               children: [
        //                 Container(
        //                   height: size.height * 0.03,
        //                   width: size.width,
        //                   color: Colors.green,
        //                   child: Center(
        //                     child: Text(
        //                       'Buy from range of premium and healthy gift Box',
        //                       style: TextStyle(
        //                           fontSize: 10.sp, color: Colors.white),
        //                     ),
        //                   ),
        //                 ),
        //                 Expanded(
        //                   child: GridView.builder(
        //                       shrinkWrap: true,
        //                       //physics: NeverScrollableScrollPhysics(),
        //                       gridDelegate:
        //                           SliverGridDelegateWithFixedCrossAxisCount(
        //                               crossAxisCount: 2,
        //                               childAspectRatio: width / height * 0.35,
        //                               mainAxisExtent: size.height * 0.25,
        //                               crossAxisSpacing: 0,
        //                               mainAxisSpacing: 0),
        //                       itemCount: _giftBoxController
        //                           .giftcardModel!.result!.length,
        //                       itemBuilder: (BuildContext context, int index) {
        //                         return Padding(
        //                           padding: EdgeInsets.all(4.0),
        //                           child: InkWell(
        //                             onTap: () {
        //                               // _homePageController.toggle(index);
        //                               if (index == 0) {
        //                                 //Get.to(() => ManPage());
        //                                 //Get.to(() => BestSeller());
        //                                 //Get.to(() => WaterTracking());
        //                               } else if (index == 1) {
        //                                 //Get.to(() => ManPage());
        //                               } else if (index == 2) {
        //                                 //Get.to(() => BestSeller());
        //                                 //Get.to(() => WalkTracking());
        //                               } else if (index == 3) {
        //                                 //Get.to(() => WalkTracking());
        //                               }
        //                             },
        //                             child: PhysicalModel(
        //                               borderRadius: BorderRadius.circular(5),
        //                               color: MyTheme.ThemeColors,
        //                               elevation: 0.1,
        //                               child: Container(
        //                                 height: size.height * 3,
        //                                 width: size.width * 0.4,
        //                                 decoration: BoxDecoration(
        //                                   image: DecorationImage(
        //                                       image: AssetImage(
        //                                         'lib/assets/asset/background1.jpeg',
        //                                       ),
        //                                       fit: BoxFit.fill),
        //                                   borderRadius:
        //                                       BorderRadius.circular(5),
        //                                   color:
        //                                       MyTheme.ContainerUnSelectedColor,
        //                                 ),
        //                                 child: Column(
        //                                   //mainAxisAlignment: MainAxisAlignment.center,
        //                                   children: [
        //                                     Align(
        //                                       alignment: Alignment.centerLeft,
        //                                       child: Container(
        //                                         height: 3.5.h,
        //                                         width: 22.w,
        //                                         decoration: BoxDecoration(
        //                                             color: Colors.red,
        //                                             borderRadius:
        //                                                 BorderRadius.only(
        //                                               topLeft:
        //                                                   Radius.circular(5),
        //                                               bottomRight:
        //                                                   Radius.circular(20),
        //                                             )),
        //                                         child: Center(
        //                                           child: Text(
        //                                             _giftBoxController
        //                                                 .giftcardModel!
        //                                                 .result![index]
        //                                                 .title
        //                                                 .toString(),
        //                                             style: TextStyle(
        //                                               color: Colors.white,
        //                                               fontWeight:
        //                                                   FontWeight.w500,
        //                                               fontSize: 9.sp,
        //                                             ),
        //                                           ),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                     SizedBox(
        //                                       height: 0.9.h,
        //                                     ),
        //                                     PhysicalModel(
        //                                       shadowColor: Colors.green,
        //                                       color: Colors.green,
        //                                       borderRadius:
        //                                           BorderRadius.circular(5),
        //                                       elevation: 5,
        //                                       child: Container(
        //                                         height: size.height * 0.12,
        //                                         width: size.width * 0.3,
        //                                         decoration: BoxDecoration(
        //                                           borderRadius:
        //                                               BorderRadius.circular(5),
        //                                           // border: Border.all(
        //                                           //     color: AppColors.themecolors),
        //                                           image: DecorationImage(
        //                                               image: NetworkImage(base +
        //                                                   '${_giftBoxController.giftcardModel!.result![index].imageName.toString()}'),
        //                                               fit: BoxFit.cover),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                     SizedBox(
        //                                       height: 1.1.h,
        //                                     ),
        //                                     Padding(
        //                                       padding: EdgeInsets.symmetric(
        //                                           horizontal: 1.7.w),
        //                                       child: Row(
        //                                         mainAxisAlignment:
        //                                             MainAxisAlignment
        //                                                 .spaceBetween,
        //                                         children: [
        //                                           Text(
        //                                             _giftBoxController
        //                                                 .giftcardModel!
        //                                                 .result![index]
        //                                                 .name
        //                                                 .toString(),
        //                                             style: TextStyle(
        //                                               fontWeight:
        //                                                   FontWeight.w400,
        //                                               fontSize: 11.sp,
        //                                               color: Colors.yellow,
        //                                             ),
        //                                           ),
        //                                           Text(
        //                                             'Save ${_giftBoxController.giftcardModel!.result![index].discount}%',
        //                                             style: TextStyle(
        //                                               fontWeight:
        //                                                   FontWeight.w400,
        //                                               fontSize: 10.sp,
        //                                               color: Colors.white,
        //                                             ),
        //                                           ),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                     // Padding(
        //                                     //   padding:
        //                                     //       EdgeInsets.symmetric(horizontal: 2.w),
        //                                     //   child: Align(
        //                                     //     alignment: Alignment.centerLeft,
        //                                     //     child: Text(
        //                                     //       '',
        //                                     //       style: TextStyle(
        //                                     //         decoration: TextDecoration.lineThrough,
        //                                     //         fontWeight: FontWeight.w400,
        //                                     //         fontSize: 7.sp,
        //                                     //         color: Colors.white,
        //                                     //       ),
        //                                     //     ),
        //                                     //   ),
        //                                     // ),
        //                                     SizedBox(
        //                                       height: 0.5.h,
        //                                     ),
        //                                     Row(
        //                                       children: [
        //                                         SizedBox(
        //                                           width: 23.w,
        //                                           child: Padding(
        //                                             padding:
        //                                                 EdgeInsets.symmetric(
        //                                                     horizontal: 2.w),
        //                                             child: Row(
        //                                               crossAxisAlignment:
        //                                                   CrossAxisAlignment
        //                                                       .end,
        //                                               children: [
        //                                                 SizedBox(
        //                                                   height: 1.h,
        //                                                 ),
        //                                                 Text(
        //                                                   '₹ ${_giftBoxController.giftcardModel!.result![index].price}',
        //                                                   style: TextStyle(
        //                                                     fontWeight:
        //                                                         FontWeight.w800,
        //                                                     fontSize: 9.sp,
        //                                                     color: MyTheme
        //                                                         .loginbuttonColor,
        //                                                   ),
        //                                                 ),
        //                                                 // Text(
        //                                                 //   ' /500 gm',
        //                                                 //   style: TextStyle(
        //                                                 //     fontWeight: FontWeight.w800,
        //                                                 //     fontSize: 6.sp,
        //                                                 //     color: Colors.white,
        //                                                 //   ),
        //                                                 // ),
        //                                               ],
        //                                             ),
        //                                           ),
        //                                         ),
        //                                         InkWell(
        //                                           onTap: () {
        //                                             _rozarPayController
        //                                                 .openCheckout();
        //                                           },
        //                                           child: Container(
        //                                             height: 3.h,
        //                                             width: 22.9.w,
        //                                             decoration: BoxDecoration(
        //                                                 color: MyTheme
        //                                                     .loginbuttonColor,
        //                                                 borderRadius:
        //                                                     BorderRadius.only(
        //                                                   bottomRight:
        //                                                       Radius.circular(
        //                                                           5),
        //                                                   bottomLeft:
        //                                                       Radius.circular(
        //                                                           5),
        //                                                 )),
        //                                             child: Center(
        //                                               child: Row(
        //                                                 mainAxisAlignment:
        //                                                     MainAxisAlignment
        //                                                         .center,
        //                                                 children: [
        //                                                   Text(
        //                                                     'Buy Now',
        //                                                     style: TextStyle(
        //                                                       color:
        //                                                           Colors.white,
        //                                                       fontWeight:
        //                                                           FontWeight
        //                                                               .w500,
        //                                                       fontSize: 8.sp,
        //                                                     ),
        //                                                   ),
        //                                                   // SizedBox(
        //                                                   //   width: 1.w,
        //                                                   // ),
        //                                                   // Icon(
        //                                                   //   Icons
        //                                                   //       .add_shopping_cart_outlined,
        //                                                   //   size: 13.sp,
        //                                                   //   color: Colors.redAccent,
        //                                                   // ),
        //                                                 ],
        //                                               ),
        //                                             ),
        //                                           ),
        //                                         ),
        //                                       ],
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //                         );
        //                       }),
        //                 ),
        //               ],
        //             ),
        //           ),
      ),
    );
  }
}
