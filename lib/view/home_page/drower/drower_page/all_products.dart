import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/all_products/all_products_controllers.dart';
import 'package:gyros_app/controllers/sub_catagary_controllers/sub_cat_id_controllers.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_navbar.dart';
//import 'package:gyros_app/view/home_page/drower/drower_page/search_list/search_data.dart';
import 'package:gyros_app/view/home_page/home_page_controller.dart';
import 'package:gyros_app/view/model_cart_practice/widgets/cart_product2.dart';
import 'package:gyros_app/view/model_cart_practice/widgets/gradient_button.dart';
import 'package:sizer/sizer.dart';

import '../../../../controllers/flash_sale_product_by_id_controllers/flash_product_by_id_controller.dart';
import '../../../../controllers/new_detail_controller.dart';
import '../../../model_cart_practice/controllers/cart_controllersss.dart';

class AllProducts extends StatelessWidget {
  AllProducts({Key? key}) : super(key: key);
  NavController _navController = Get.put(NavController());
  final CartController controller = Get.put(CartController());
  HomePageController _homePageController = Get.find();
  SubCatByIdController _subCatByIdController = Get.find();
  final CartController cartController = Get.put(CartController());
  AllProductController _allProductController = Get.put(AllProductController());
  NewController _newProductByIdController = Get.put(NewController());
  FlashProductByIdController _flashProductByIdController =
      Get.put(FlashProductByIdController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var base = 'https://api.gyros.farm/Images/';
    final List<String> text = [
      ' Cow Ghee ',
      ' Oil ',
      ' Honey ',
      ' Jaggery ',
      ' Spices ',
      ' Sattu ',
      ' Sweets ',
    ];

    final List<String> images = [
      'https://images.unsplash.com/photo-1573812461383-e5f8b759d12e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
      'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2036&q=80',
      'https://images.unsplash.com/photo-1555211652-5c6222f971bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aG9uZXl8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
      'https://images.unsplash.com/photo-1610508500445-a4592435e27e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8amFnZ2VyeXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60',
      'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3BpY2VzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
      'https://pureecoindia.in/wp-content/uploads/2019/11/Sattu-1024x614.png',
      'https://www.mapsofindia.com/ci-moi-images/my-india/Gulab-Jamun.jpg'
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'All Products',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.themecolors,
          ),
        ),
        leading: InkWell(
            onTap: () {
              _navController.tabindex(0);
              Get.to(() => NavBar());
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.themecolors,
            )),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              ///////Richa
              child: Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) =>  IndexPage()),
                        // );
                      },
                      child: Icon(
                        Icons.search,
                        size: size.height * 0.035,
                        color: Colors.green,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => Cartproducts());
                        //Get.to(() => ShopingBagsEmpty());
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: InkWell(
                            onTap: () {
                              Get.to(() => Cartproducts());
                              //Get.to(() => ShopingBagsEmpty());
                            },
                            child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.shopping_cart,
                                size: size.height * 0.035,
                                color: Colors.green,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),

      body: Obx(
        () => (_allProductController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : _allProductController.allProductModel!.result == null
            ? Center(
                    child: Text('No data'),
                  )
                : SizedBox(
                    height: size.height,
                    width: size.width,
                    // color: Colors.red,
                    child: ListView.builder(
                        itemCount: _allProductController
                            .allProductModel!.result!.length,
                        itemBuilder: (BuildContext contextr, int index) {
                          print(_allProductController
                                  .allProductModel!.result![index].productName
                                  .toString() +
                              "kjfdkljldksldsk");
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
                                          ///navigate to new detail page
                                          child: InkWell(
                                            onTap: () {
                                              _newProductByIdController
                                                  .productid =
                                                  _homePageController
                                                      .getflashsellproduct!
                                                      .result![
                                                  index]
                                                      .id
                                                      .toString();
                                              _newProductByIdController
                                                  .newproductbyIdApi();
                                              // _flashProductByIdController
                                              //         .productid =
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
                                                color: Colors.white,
                                                image: DecorationImage(
                                                    image: NetworkImage(base +
                                                        '${_allProductController.allProductModel!.result![index].productImage.toString()}'),
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
                                                  Row(
                                                    children: [
                                                      Text(_allProductController.allProductModel!.result![index].weight1 == null ? '1 litre'
                                                          :
                                                        '${_allProductController.allProductModel!.result![index].weight1.toString()} '
                                                        ,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 10.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(_allProductController.allProductModel!.result![index].pkt1 == null ? '1 litre'
                                                          :
                                                      '${_allProductController.allProductModel!.result![index].pkt1.toString()} '
                                                        ,
                                                        style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontSize: 10.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.007,
                                                  ),

                                                  SizedBox(
                                                    width: size.width * 0.48,
                                                    height: size.height * 0.05,
                                                    child: Text(
                                                      _allProductController
                                                          .allProductModel!
                                                          .result![index]
                                                          .productName
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 12.sp,
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
                                                        '₹${_allProductController.allProductModel!.result![index].finalPrice.toString()}',
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
                                                        '₹${_allProductController.allProductModel!.result![index].price.toString()}',
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          // decorationStyle:
                                                          //     TextDecorationStyle.wavy,
                                                          decorationColor:
                                                              Colors
                                                                  .red.shade900,
                                                          decorationThickness:
                                                              2.85,
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
                                                  Obx(
                                                    () => (_allProductController
                                                            .isLoading.value)
                                                        ? Center(
                                                            child:
                                                                CircularProgressIndicator())
                                                        : _allProductController
                                                                    .allProductModel!
                                                                    .result ==
                                                                null
                                                            //: _allProductController.allProductModel!.result!.isEmpty
                                                            //_bestSellerController.bestsellermodel!.result!.isEmpty
                                                            ? Row(
                                                              children: [
                                                                Center(
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
                                                                  ),
                                                              ],
                                                            )
                                                            : Row(

                                                              children: [
                                                                Text(
                                                                    'Save ${_allProductController.allProductModel!.result[index].discountPercentage}%',
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
                                                                SizedBox(width: size.width*0.02,),
                                                                Text(
                                                                  ' ${_allProductController.allProductModel!.result[index].rating}',
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
                                                                Icon(Icons.star , color: Colors.amber, size: 12,)
                                                              ],
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
                                                            _allProductController
                                                                .allProductModel!
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
                        }),
                  ),
      ),

      // Obx(() => (_allProductController.isLoading.value == false)
      //     ? Container(
      //         //height: size.height,
      //         width: double.infinity,
      //         color: Colors.white,
      //         child: SizedBox(
      //           //height: size.height,
      //           width: size.width,
      //           // color: Colors.red,
      //           child: SingleChildScrollView(
      //             child: Column(
      //               children: [
      //                 Container(
      //                   height: size.height * 0.03,
      //                   width: size.width,
      //                   color: Colors.green,
      //                   child: Center(
      //                     child: Text(
      //                       'See your All Product',
      //                       style:
      //                           TextStyle(fontSize: 10.sp, color: Colors.white),
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: size.height * 93,
      //                   child: ListView.builder(
      //                       shrinkWrap: true,
      //                       itemCount: _allProductController
      //                           .allProductModel!.result!.length,
      //                       itemBuilder: (BuildContext contextr, int index) {
      //                         return Padding(
      //                           padding: EdgeInsets.symmetric(
      //                               vertical: size.height * 0.003),
      //                           child: Column(
      //                             children: [
      //                               Container(
      //                                 height: size.height * 0.520,
      //                                 width: size.width,
      //                                 decoration: BoxDecoration(
      //                                     color: Colors.blueGrey,
      //                                     border: Border.all(
      //                                         color: Colors.green, width: 0)),
      //                                 child: Column(
      //                                   children: [
      //                                     Padding(
      //                                       padding: EdgeInsets.all(6.5),
      //                                       child: PhysicalModel(
      //                                         color: Colors.red,
      //                                         elevation: 10,
      //                                         child: Container(
      //                                           height: size.height * 0.38,
      //                                           //color: Colors.red,
      //                                           decoration: BoxDecoration(
      //                                             color: Colors.grey,
      //                                             image: DecorationImage(
      //                                                 image: NetworkImage(base +
      //                                                     '${_allProductController.allProductModel!.result![index].productImage.toString()}'),
      //                                                 fit: BoxFit.fill),
      //                                           ),
      //                                         ),
      //                                       ),
      //                                     ),
      //                                     Container(
      //                                       height: size.height * 0.12,
      //                                       //color: Color(0xff023020),
      //                                       decoration: BoxDecoration(
      //                                           color: Color(0xff023020),
      //                                           border: Border.all(
      //                                               color: Colors.blueGrey,
      //                                               width: 2)),
      //                                       child: Padding(
      //                                         padding: EdgeInsets.symmetric(
      //                                             horizontal:
      //                                                 size.width * 0.02),
      //                                         child: Row(
      //                                           mainAxisAlignment:
      //                                               MainAxisAlignment
      //                                                   .spaceBetween,
      //                                           crossAxisAlignment:
      //                                               CrossAxisAlignment.center,
      //                                           children: [
      //                                             Column(
      //                                               mainAxisAlignment:
      //                                                   MainAxisAlignment
      //                                                       .center,
      //                                               crossAxisAlignment:
      //                                                   CrossAxisAlignment
      //                                                       .start,
      //                                               children: [
      //                                                 Text(
      //                                                   _allProductController
      //                                                       .allProductModel!
      //                                                       .result![index]
      //                                                       .productName
      //                                                       .toString(),
      //                                                   overflow: TextOverflow
      //                                                       .ellipsis,
      //                                                   maxLines: 3,
      //                                                   style: TextStyle(
      //                                                     fontWeight:
      //                                                         FontWeight.w700,
      //                                                     fontSize: 15.sp,
      //                                                     color: Colors.yellow,
      //                                                   ),
      //                                                 ),
      //                                                 SizedBox(
      //                                                   height:
      //                                                       size.height * 0.02,
      //                                                 ),
      //                                                 Row(
      //                                                   children: [
      //                                                     Text(
      //                                                       '₹${_allProductController.allProductModel!.result![index].price.toString()}',
      //                                                       style: TextStyle(
      //                                                         fontWeight:
      //                                                             FontWeight
      //                                                                 .w900,
      //                                                         fontSize: 13.sp,
      //                                                         color: Colors
      //                                                             .yellowAccent,
      //                                                       ),
      //                                                     ),
      //                                                     Text(
      //                                                       '/500 gm',
      //                                                       style: TextStyle(
      //                                                         fontWeight:
      //                                                             FontWeight
      //                                                                 .w700,
      //                                                         fontSize: 10.sp,
      //                                                         color:
      //                                                             Colors.white,
      //                                                       ),
      //                                                     ),
      //                                                   ],
      //                                                 ),
      //                                               ],
      //                                             ),
      //                                             Column(
      //                                               mainAxisAlignment:
      //                                                   MainAxisAlignment
      //                                                       .center,
      //                                               crossAxisAlignment:
      //                                                   CrossAxisAlignment.end,
      //                                               children: [
      //                                                 Text(
      //                                                   'Save 30%',
      //                                                   style: TextStyle(
      //                                                     fontWeight:
      //                                                         FontWeight.w700,
      //                                                     fontSize: 10.sp,
      //                                                     color: Colors.white,
      //                                                   ),
      //                                                 ),
      //
      //                                                 // Spacer(),
      //                                                 // SizedBox(
      //                                                 //   width: 4.w,
      //                                                 // ),
      //                                                 SizedBox(
      //                                                   height:
      //                                                       size.height * 0.02,
      //                                                 ),
      //                                                 Container(
      //                                                   height: 4.5.h,
      //                                                   width: 33.5.w,
      //                                                   decoration:
      //                                                       BoxDecoration(
      //                                                     borderRadius:
      //                                                         BorderRadius
      //                                                             .circular(20),
      //                                                   ),
      //                                                   child: InkWell(
      //                                                     onTap: () {
      //                                                       cartController
      //                                                           .addProduct(
      //                                                               Productss
      //                                                                       .products[
      //                                                                   index]);
      //                                                     },
      //                                                     child:
      //                                                         RaisedGradientButton(
      //                                                       //height: 3.3.h,
      //                                                       //width: 23.9.w,
      //                                                       child: Text(
      //                                                         'Add To Cart',
      //                                                         style: TextStyle(
      //                                                             color: Colors
      //                                                                 .white,
      //                                                             fontWeight:
      //                                                                 FontWeight
      //                                                                     .w600,
      //                                                             fontSize:
      //                                                                 10.sp),
      //                                                       ),
      //                                                       gradient:
      //                                                           LinearGradient(
      //                                                         colors: <Color>[
      //                                                           Colors.green,
      //                                                           Colors.cyan
      //                                                               .shade400
      //                                                         ],
      //                                                       ),
      //                                                       onPressed: () {
      //                                                         cartController
      //                                                             .addProduct(
      //                                                                 Productss
      //                                                                         .products[
      //                                                                     index]);
      //                                                         print(
      //                                                             'Add To cart');
      //                                                       },
      //                                                     ),
      //                                                   ),
      //                                                 ),
      //                                               ],
      //                                             ),
      //                                           ],
      //                                         ),
      //                                       ),
      //                                     )
      //                                   ],
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         );
      //                       }),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //
      //         ///here all product api..............
      //         // ListView.builder(
      //         //     shrinkWrap: true,
      //         //     itemCount:
      //         //         _homePageController.getcatagartlist!.result!.length,
      //         //     itemBuilder: (BuildContext context, int index) {
      //         //       return Padding(
      //         //         padding: const EdgeInsets.all(1.0),
      //         //         child: InkWell(
      //         //           onTap: () {
      //         //             _subCatByIdController.catid = _homePageController
      //         //                 .getcatagartlist!.result![index].id
      //         //                 .toString();
      //         //             _subCatByIdController.subcatidApi();
      //         //
      //         //             // if (index == 0) {
      //         //             //   Get.to(() => CowGhee());
      //         //             // } else if (index == 1) {
      //         //             //   Get.to(() => Oil());
      //         //             // } else if (index == 2) {
      //         //             //   Get.to(() => Honey());
      //         //             // } else if (index == 3) {
      //         //             //   Get.to(() => Jeggary());
      //         //             // } else if (index == 4) {
      //         //             //   Get.to(() => Spices());
      //         //             // } else if (index == 5) {
      //         //             //   Get.to(() => Sattu());
      //         //             // } else if (index == 6) {
      //         //             //   Get.to(() => Sweets());
      //         //             // }
      //         //           },
      //         //           child: Container(
      //         //             height: size.height * 0.25,
      //         //             width: double.infinity,
      //         //             decoration: BoxDecoration(
      //         //                 border: Border.all(
      //         //                     color: AppColors.themecolors, width: 2),
      //         //                 image: DecorationImage(
      //         //                   image: NetworkImage(base +
      //         //                       '${_homePageController.getcatagartlist!.result![index].imageName.toString()}'),
      //         //                   fit: BoxFit.cover,
      //         //                   // centerSlice: Rect.fromCenter(
      //         //                   //     center: Offset(200, 200),
      //         //                   //     width: 1,
      //         //                   //     height: 1),
      //         //                   onError:
      //         //                       (Object exception, StackTrace? stackTrace) {
      //         //                     Text('No Image');
      //         //                     // Icon(
      //         //                     //   Icons.error,
      //         //                     //   color: Colors.red,
      //         //                     // );
      //         //                     print('onError');
      //         //                     print('Exception: $exception');
      //         //                     print('Stack Trace:\n$stackTrace');
      //         //                   },
      //         //                 )),
      //         //             child: Padding(
      //         //               padding: EdgeInsets.all(8.0),
      //         //               child: Text(
      //         //                 _homePageController
      //         //                     .getcatagartlist!.result![index].categoryName
      //         //                     .toString(),
      //         //                 style: GoogleFonts.abhayaLibre(
      //         //                   backgroundColor: Colors.white70,
      //         //                   fontStyle: FontStyle.italic,
      //         //                   color: AppColors.themecolors,
      //         //                   fontSize: 20.sp,
      //         //                   fontWeight: FontWeight.bold,
      //         //                 ),
      //         //               ),
      //         //             ),
      //         //           ),
      //         //         ),
      //         //       );
      //         //     }),
      //       )
      //     : Center(child: CircularProgressIndicator())),
    );
  }
}
