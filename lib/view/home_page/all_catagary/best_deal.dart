import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/best_seller_controller.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_navbar.dart';
import 'package:gyros_app/view/model_cart_practice/controllers/cart_controllersss.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/flash_sale_product_by_id_controllers/flash_product_by_id_controller.dart';
import '../../model_cart_practice/widgets/cart_product2.dart';
import '../../model_cart_practice/widgets/gradient_button.dart';

class BestDeal extends StatelessWidget {
  BestDeal({Key? key}) : super(key: key);
  NavController _navController = Get.put(NavController());
  final CartController controller = Get.put(CartController());
  BestSellerController _bestSellerController = Get.put(BestSellerController());
  final CartController cartController = Get.put(CartController());
  FlashProductByIdController _flashProductByIdController =
      Get.put(FlashProductByIdController());

  ///rahul old api api best deal oldd

  // Future<List<CategoryResult>> getSubCategoryData() async {
  //   List<CategoryResult> list;
  //   var url = 'https://api.gyros.farm/api/AdminApi/SubcategoryList/4';
  //   var res = await http.get(Uri.parse(url));
  //   if (res.statusCode == 200) {
  //     var data = json.decode(res.body);
  //     var rest = data["result"] as List;
  //     list = rest
  //         .map<CategoryResult>((json) => CategoryResult.fromJson(json))
  //         .toList();
  //     print("List Size&&&&&&&&&&&&&&&Rahul: ${list}");
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  //   return list;
  // }

  @override
  Widget build(BuildContext context) {
    final List<String> text1 = [
      'BestSeller',
      'BestSeller',
      'BestSeller',
      'BestSeller',
      'BestSeller',
      'BestSeller',
      'BestSeller',
      'BestSeller',
    ];

    final List<String> text2 = [
      'Sweets',
      'Ghee',
      "Spices",
      'Gaggery',
      'Honey',
      'Pulses',
      "Ghee",
      'Sweets',
    ];

    final List<String> image1 = [
      'lib/assets/asset/sweet4.png',
      'lib/assets/asset/gheee1.webp',
      'lib/assets/asset/spices3.jpeg',
      'lib/assets/asset/gaggery2.jpeg',
      'lib/assets/asset/honey2.jpeg',
      'lib/assets/asset/dal7.webp',
      'lib/assets/asset/sweet4.png',
      'lib/assets/asset/gheee1.webp',
    ];
    Size size = MediaQuery.of(context).size;

    var base = 'https://api.gyros.farm/Images/';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Best Deals',
          style: TextStyle(
              color: AppColors.themecolors, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
            onTap: () {
              //Get.back();
              _navController.tabindex(0);
              Get.to(() => NavBar());
              // _homePageController.toggle(index);
              //Get.to(() => WalkTracking());
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.themecolors,
            )),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: InkWell(
                onTap: () {
                  Get.to(() => Cartproducts());
                  //Get.to(() => ShopingBagsEmpty());
                },
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child:
                      // Badge(
                      //   toAnimate: true,
                      //   badgeColor: AppColors.themecolors,
                      //   badgeContent: Obx(
                      //     () => (controller.isLoading.value)
                      //         ? Center(child: CircularProgressIndicator())
                      //         : controller.cartListModel!.result! == null
                      //             // ? Center(
                      //             //     child: Text('0'),
                      //             //   )
                      //             // :
                      //             ? Center(
                      //                 child: CircularProgressIndicator(
                      //                 color: Colors.lightGreenAccent,
                      //                 backgroundColor: Colors.white,
                      //                 valueColor:
                      //                     AlwaysStoppedAnimation(Colors.yellow),
                      //                 strokeWidth: 3,
                      //               ))
                      //             : Text(
                      //                 controller.cartListModel!.totalItem
                      //                     .toString(),
                      //                 style: GoogleFonts.alatsi(
                      //                   color: Colors.white,
                      //                   fontSize: 10.sp,
                      //                 ),
                      //               ),
                      //   ),
                      //   child: Icon(
                      //     Icons.shopping_cart,
                      //     color: Colors.green,
                      //   ),
                      // ),
                      Icon(
                    Icons.shopping_cart,
                    size: size.height * 0.035,
                    color: Colors.green,
                  ),
                )

                // Padding(
                //   padding: EdgeInsets.all(6.0),
                //   child: Badge(
                //     toAnimate: false,
                //     badgeColor: AppColors.themecolors,
                //     badgeContent: Obx(
                //       () => (controller.isLoading.value)
                //           ? Center(
                //               child: CircularProgressIndicator(
                //               color: Colors.lightGreenAccent,
                //               backgroundColor: Colors.white,
                //               valueColor: AlwaysStoppedAnimation(Colors.yellow),
                //               strokeWidth: 3,
                //             ))
                //           : controller.cartListModel!.totalItem == null
                //               //: controller.cartListModel!.totalItem == null
                //               //: _allProductController.allProductModel!.result!.isEmpty
                //               //_bestSellerController.bestsellermodel!.result!.isEmpty
                //               ? Center(
                //                   child: Text('0'),
                //                 )
                //               : Text(
                //                   controller.cartListModel!.totalItem
                //                       .toString(),
                //                   style: GoogleFonts.alatsi(
                //                     color: Colors.white,
                //                     fontSize: 10.sp,
                //                   ),
                //                 ),
                //     ),
                //     child: Icon(
                //       Icons.shopping_cart,
                //       color: Colors.green,
                //     ),
                //   ),
                // )
                ),
          ),
        ],
      ),
      body:
          // FutureBuilder<List<CategoryResult>>(
          //   future: getSubCategoryData(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       var itemslist = snapshot.data;
          //       var base = 'https://api.gyros.farm/Images/';
          //       return

          Obx(
        () => (_bestSellerController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            //: _bestSellerController.bestsellermodel!.result!.isEmpty
            : _bestSellerController.bestsellermodel!.result == null
                ? Center(
                    child: Text('No data'),
                  )
                : SizedBox(
                    height: size.height,
                    width: size.width,
                    // color: Colors.red,
                    child: ListView.builder(
                        itemCount: _bestSellerController
                            .bestsellermodel!.result!.length,
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
                                                  _bestSellerController
                                                      .bestsellermodel!
                                                      .result![index]
                                                      .id
                                                      .toString();
                                              _flashProductByIdController
                                                  .flashproductbyIdApi();
                                            },
                                            child: Container(
                                              height: size.height * 0.38,
                                              //color: Colors.red,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                                image: DecorationImage(
                                                    image: NetworkImage(base +
                                                        '${_bestSellerController.bestsellermodel!.result![index].productImage.toString()}'),
                                                    fit: BoxFit.fitHeight),
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
                                                  Text(
                                                    '${_bestSellerController.bestsellermodel!.result![index].quentity.toString()} gm',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 10.sp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
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
                                                    height: size.height * 0.04,
                                                    child: Text(
                                                      _bestSellerController
                                                          .bestsellermodel!
                                                          .result![index]
                                                          .productName
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 11.sp,
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
                                                        '₹${_bestSellerController.bestsellermodel!.result![index].finalPrice.toString()}',
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
                                                      Text(
                                                        '₹${_bestSellerController.bestsellermodel!.result![index].price.toString()}',
                                                        style:
                                                        TextStyle(
                                                          decoration:
                                                          TextDecoration
                                                              .lineThrough,

                                                          decorationStyle:
                                                          TextDecorationStyle
                                                              .solid,

                                                          decorationColor: Colors
                                                              .yellow
                                                              .shade700,
                                                          decorationThickness:
                                                          1.2,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          fontSize:
                                                          13.sp,
                                                          color: Colors
                                                              .white

                                                        ),
                                                      ),
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
                                                    () => (_bestSellerController
                                                            .isLoading.value)
                                                        ? Center(
                                                            child:
                                                                CircularProgressIndicator())
                                                        : _bestSellerController
                                                                    .bestsellermodel!
                                                                    .result! ==
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
                                                            : Row(
                                                      children: [
                                                        Text(
                                                          'Save ${_bestSellerController.bestsellermodel!.result![index].discountPercentage}%',
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
                                                        SizedBox(width: size.width*0.04,),
                                                        Text('${_bestSellerController.bestsellermodel!.result[index].review.toDouble()}',
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
                                                        Icon(Icons.star , size: 10, color: Colors.amber,)
                                                      ],
                                                    )
                                                    // Text(
                                                    //             'Save ${_bestSellerController.bestsellermodel!.result![index].discountPercentage}%',
                                                    //             style:
                                                    //                 TextStyle(
                                                    //               fontWeight:
                                                    //                   FontWeight
                                                    //                       .w700,
                                                    //               fontSize:
                                                    //                   10.sp,
                                                    //               color: Colors
                                                    //                   .white,
                                                    //             ),
                                                    //           ),
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
                                                            _bestSellerController
                                                                .bestsellermodel!
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

                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.003),
                            child: Column(
                              children: [
                                Container(
                                  height: size.height * 0.520,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      border: Border.all(
                                          color: Colors.green, width: 0)),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(6.5),
                                        child: PhysicalModel(
                                          color: Colors.red,
                                          elevation: 10,
                                          child: InkWell(
                                            onTap: () {
                                              _flashProductByIdController
                                                      .productid =
                                                  _bestSellerController
                                                      .bestsellermodel!
                                                      .result![index]
                                                      .id
                                                      .toString();
                                              _flashProductByIdController
                                                  .flashproductbyIdApi();
                                            },
                                            child: Container(
                                              height: size.height * 0.38,
                                              //color: Colors.red,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                image: DecorationImage(
                                                    image: NetworkImage(base +
                                                        '${_bestSellerController.bestsellermodel!.result![index].productImage.toString()}'),
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
                                                  Text(
                                                    _bestSellerController
                                                        .bestsellermodel!
                                                        .result![index]
                                                        .productName
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
                                                  SizedBox(
                                                    height: size.height * 0.02,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '₹${_bestSellerController.bestsellermodel!.result![index].price.toString()}',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 13.sp,
                                                          color: Colors
                                                              .yellowAccent,
                                                        ),
                                                      ),
                                                      Text(
                                                        '/500 gm',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 10.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
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
                                                  Text(
                                                    'Save ${_bestSellerController.bestsellermodel!.result![index].discountPercentage}%',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 10.sp,
                                                      color: Colors.white,
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
                                                            _bestSellerController
                                                                .bestsellermodel!
                                                                .result![index]
                                                                .id);
                                                        // cartController
                                                        //     .addProduct(Productss
                                                        //             .products[
                                                        //         index]
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
                        }),
                  ),

        // Container(
        //             height: size.height,
        //             child: GridView.builder(
        //                 shrinkWrap: true,
        //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                     crossAxisCount: 2,
        //                     childAspectRatio: 4 / 3,
        //                     mainAxisExtent: size.height * 0.24,
        //                     crossAxisSpacing: 0,
        //                     mainAxisSpacing: 0),
        //                 itemCount: _bestSellerController
        //                     .bestsellermodel!.result!.length,
        //                 itemBuilder: (BuildContext context, int index) {
        //                   return Padding(
        //                     padding: EdgeInsets.all(4.0),
        //                     child: InkWell(
        //                       onTap: () {
        //                         // _homePageController.toggle(index);
        //                         /* if (index == 0) {
        //                         //Get.to(() => ManPage());
        //                         //Get.to(() => BestSeller());
        //                         //Get.to(() => WaterTracking());
        //                       } else if (index == 1) {
        //                         //Get.to(() => ManPage());
        //                       } else if (index == 2) {
        //                         //Get.to(() => BestSeller());
        //                         //Get.to(() => WalkTracking());
        //                       } else if (index == 3) {
        //                         //Get.to(() => WalkTracking());
        //                       }*/
        //                       },
        //                       child: PhysicalModel(
        //                         borderRadius: BorderRadius.circular(5),
        //                         color: MyTheme.ThemeColors,
        //                         elevation: 0.1,
        //                         child: Container(
        //                           height: size.height * 55,
        //                           width: size.width * 0.48,
        //                           decoration: BoxDecoration(
        //                             image: DecorationImage(
        //                                 image: AssetImage(
        //                                   'lib/assets/asset/background4.jpeg',
        //                                 ),
        //                                 fit: BoxFit.fill),
        //                             borderRadius: BorderRadius.circular(5),
        //                             color: MyTheme.ContainerUnSelectedColor,
        //                           ),
        //                           child: Column(
        //                             //mainAxisAlignment: MainAxisAlignment.center,
        //                             children: [
        //                               Align(
        //                                 alignment: Alignment.centerLeft,
        //                                 child: Container(
        //                                   height: size.height * 0.03,
        //                                   width: size.width * 0.22,
        //                                   decoration: BoxDecoration(
        //                                       color: Colors.red,
        //                                       borderRadius: BorderRadius.only(
        //                                         topLeft: Radius.circular(5),
        //                                         bottomRight:
        //                                             Radius.circular(20),
        //                                       )),
        //                                   child: Center(
        //                                     child: Text(
        //                                       'BEST DEAL',
        //                                       //text1[index],
        //                                       style: TextStyle(
        //                                         color: Colors.white,
        //                                         fontWeight: FontWeight.w500,
        //                                         fontSize: 9.sp,
        //                                       ),
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ),
        //                               Spacer(),
        //                               // SizedBox(
        //                               //   height: 0.6.h,
        //                               // ),
        //                               PhysicalModel(
        //                                 shadowColor: Colors.green,
        //                                 color: Colors.green,
        //                                 borderRadius: BorderRadius.circular(5),
        //                                 elevation: 5,
        //                                 child: Container(
        //                                   height: size.height * 0.11,
        //                                   width: size.width * 0.26,
        //                                   decoration: BoxDecoration(
        //                                     borderRadius:
        //                                         BorderRadius.circular(5),
        //                                     //border: Border.all(
        //                                     //   color: AppColors.themecolors),
        //                                     image: DecorationImage(
        //                                         image: NetworkImage(base +
        //                                             '${_bestSellerController.bestsellermodel!.result![index].productImage.toString()}'),
        //                                         fit: BoxFit.cover),
        //                                   ),
        //                                 ),
        //                               ),
        //                               Spacer(),
        //                               Padding(
        //                                 padding: EdgeInsets.symmetric(
        //                                     horizontal: 1.7.w),
        //                                 child: Row(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.spaceBetween,
        //                                   children: [
        //                                     SizedBox(
        //                                       width: size.width * 0.27,
        //                                       height: size.height * 0.032,
        //                                       child: Text(
        //                                         _bestSellerController
        //                                             .bestsellermodel!
        //                                             .result![index]
        //                                             .productName
        //                                             .toString(),
        //                                         style: TextStyle(
        //                                           fontWeight: FontWeight.w400,
        //                                           fontSize: size.height * 0.015,
        //                                           color: Colors.yellow,
        //                                         ),
        //                                       ),
        //                                     ),
        //                                     Text(
        //                                       'Save ${_bestSellerController.bestsellermodel!.result![index].discount}%',
        //                                       style: TextStyle(
        //                                         fontWeight: FontWeight.w400,
        //                                         fontSize: 10.sp,
        //                                         color: Colors.white,
        //                                       ),
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ),
        //                               Padding(
        //                                 padding: EdgeInsets.symmetric(
        //                                     horizontal: 2.w),
        //                                 child: Align(
        //                                   alignment: Alignment.centerLeft,
        //                                   child: Text(
        //                                     '',
        //                                     style: TextStyle(
        //                                       decoration:
        //                                           TextDecoration.lineThrough,
        //                                       fontWeight: FontWeight.w400,
        //                                       fontSize: 7.sp,
        //                                       color: Colors.white,
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ),
        //                               Row(
        //                                 children: [
        //                                   SizedBox(
        //                                     width: size.width * 0.48,
        //                                     child: Padding(
        //                                       padding: EdgeInsets.symmetric(
        //                                           horizontal: 2.w),
        //                                       child: Row(
        //                                         children: [
        //                                           Text(
        //                                             _bestSellerController
        //                                                 .bestsellermodel!
        //                                                 .result![index]
        //                                                 .price
        //                                                 .toString(),
        //                                             style: TextStyle(
        //                                               fontWeight:
        //                                                   FontWeight.w900,
        //                                               fontSize: 8.sp,
        //                                               color:
        //                                                   Colors.yellowAccent,
        //                                             ),
        //                                           ),
        //                                           Text(
        //                                             ' /500 gm',
        //                                             style: TextStyle(
        //                                               fontWeight:
        //                                                   FontWeight.w600,
        //                                               fontSize: 7.sp,
        //                                               color: Colors.white70,
        //                                             ),
        //                                           ),
        //                                           Spacer(),
        //                                           // SizedBox(
        //                                           //   width: 4.w,
        //                                           // ),
        //                                           Container(
        //                                             height: 3.1.h,
        //                                             width: 21.5.w,
        //                                             decoration: BoxDecoration(
        //                                               borderRadius:
        //                                                   BorderRadius.circular(
        //                                                       20),
        //                                             ),
        //                                             child: InkWell(
        //                                               onTap: () {
        //                                                 cartController
        //                                                     .addProduct(Productss
        //                                                             .products[
        //                                                         index]);
        //                                               },
        //                                               child:
        //                                                   RaisedGradientButton(
        //                                                 //height: 3.3.h,
        //                                                 //width: 23.9.w,
        //                                                 child: Text(
        //                                                   'Add To Cart',
        //                                                   style: TextStyle(
        //                                                       color:
        //                                                           Colors.white,
        //                                                       fontWeight:
        //                                                           FontWeight
        //                                                               .w600,
        //                                                       fontSize: 7.sp),
        //                                                 ),
        //                                                 gradient:
        //                                                     LinearGradient(
        //                                                   colors: <Color>[
        //                                                     Colors.green,
        //                                                     Colors.cyan.shade400
        //                                                   ],
        //                                                 ),
        //                                                 onPressed: () {
        //                                                   cartController
        //                                                       .addProduct(Productss
        //                                                               .products[
        //                                                           index]);
        //                                                   print('Add To cart');
        //                                                 },
        //                                               ),
        //                                             ),
        //                                           ),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                   ),
        //                                 ],
        //                               ),
        //                               SizedBox(
        //                                 height: 1.h,
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   );
        //                 }),
        //           ),
      ),
    );
  }
}

// model
class category {
  List<CategoryResult>? result;
  int? status;
  String? message;
  category({this.result, this.status, this.message});
  category.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <CategoryResult>[];
      json['result'].forEach((v) {
        result!.add(new CategoryResult.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class CategoryResult {
  int? id;
  String? productName;
  String? productImage;
  int? price;
  Null? quentity;

  CategoryResult(
      {this.id,
      this.productName,
      this.productImage,
      this.price,
      this.quentity});

  CategoryResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['ProductName'];
    productImage = json['Product_Image'];
    price = json['Price'];
    quentity = json['Quentity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ProductName'] = this.productName;
    data['Product_Image'] = this.productImage;
    data['Price'] = this.price;
    data['Quentity'] = this.quentity;
    return data;
  }
}
