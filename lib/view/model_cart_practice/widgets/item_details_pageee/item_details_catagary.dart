import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/rozar_pay_controller/rozar_pay_controller.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/view/model_cart_practice/controllers/cart_controllersss.dart';
import 'package:gyros_app/view/model_cart_practice/widgets/cart_product2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:rating_dialog/rating_dialog.dart';
import '../../../../controllers/about_the_product/about_the_product_controller.dart';
import '../../../../controllers/flash_sale_product_by_id_controllers/flash_product_by_id_controller.dart';
import '../../../../controllers/productDetailController.dart';
import '../../../../controllers/standOut/stand_out_controller.dart';
import '../../../../controllers/tried_these_controller/tried_these_controller.dart';
import '../gradient_button.dart';
//import '../../../../review/review.dart';
import 'package:auto_size_text/auto_size_text.dart';
class ItemDetailss extends StatelessWidget {
  final _sliderKey1 = GlobalKey();
  final CartController controller = Get.put(CartController());
  final RozarPayController _rozarPayController = Get.find();

  String textHolder = '268 ';
  RxInt selectedimg = 0.obs;
  void clickFunction() {
    // setState(() {
    //   textHolder = '260';
    //
    // });

    print('260');
  }
  StandOutController _standOutController = Get.put(StandOutController());
  AboutProductController _aboutProductController = Get.put(AboutProductController());
  ProductDetailController _controller = Get.put(ProductDetailController());
  FlashProductByIdController _flashProductByIdController =
      Get.put(FlashProductByIdController());
  TriedProductController _allTriedProductController = Get.put(TriedProductController());
  final cartController = Get.put(CartController());
  //bool enableAutoSlider = false;
  //final int index;
  ItemDetailss({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
List a = [
  "https://gyros.farm/static/media/have1.7d7befee.jpg",
  "https://gyros.farm/static/media/have2.e85fe481.jpg",
  "https://gyros.farm/static/media/have3.d5c47493.jpg",
  "https://gyros.farm/static/media/have4.754eed44.jpg"
];

    Size size = MediaQuery.of(context).size;
    var base = 'https://api.gyros.farm/Images/';
    return Scaffold(
      backgroundColor: Color(0xffffdb61),
      // backgroundColor:
      //     Color(int.parse(Productss.products[index].color.toString())),
      appBar: AppBar(
        centerTitle: true,
        //Productss.products[index].weight
        backgroundColor: AppColors.themecolors,
        //Color(0xffffdb61),
        //     Color(int.parse(Productss.products[index].color.toString())),
        elevation: 0,
        title: Text(
          'Items Detail',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
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

                      Icon(
                    Icons.shopping_cart,
                    size: size.height * 0.035,
                    color: Colors.white,
                  ),
                )


                ),
          ),

        ],
        leading: InkWell(
            onTap: () {
              Get.back();
              // _homePageController.toggle(index);
              //Get.to(() => WalkTracking());
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            )),
      ),
      body: Obx(
        () => (_flashProductByIdController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : _flashProductByIdController.flashproductbyid!.result!.isEmpty
                ? Center(
                    child: Text('No data'),
                  )

                ///TODO: here we can use layout builder and we can use stack under list view in flutter............
                : LayoutBuilder(
                    builder: (context, constraints) => SizedBox(
                      height: size.height,
                      child: ListView.builder(
                          //physics: NeverScrollableScrollPhysics(),
                          itemCount: _flashProductByIdController
                              .flashproductbyid!.result!.length,
                          itemBuilder: (BuildContext context, int mainIndex) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                   // color: Colors.red,
                                    height: constraints.maxHeight,
                                    width: double.infinity,
                                    // width: constraints.maxWidth,
                                    child:
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [

                                        Positioned(
                                            top: size.height * 0.30,
                                            bottom: 2,
                                            //right: -1,
                                            //left: -1,
                                            child: Container(
                                              height: size.height * 5,
                                              width: size.width,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        height: 4.h,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        // mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          ///Small images code
                                                      // Container(
                                                      // height: size.height*0.09,
                                                      //   width: size.height*0.95,
                                                      // //_aboutProductController.getabouttheproduct?.result?[0].result!.length
                                                      //   child: ListView.builder(
                                                      //       scrollDirection: Axis.horizontal,
                                                      //       //itemCount: _flashProductByIdController.flashproductbyid?.result?.length,
                                                      //       itemCount: _flashProductByIdController.flashproductbyid!.result![0].multipleImage!.length,
                                                      //       itemBuilder: (context, index) {
                                                      //         return Row(
                                                      //           children: [
                                                      //             SizedBox(
                                                      //               // width: 10,
                                                      //               width: size.width*0.02,
                                                      //             ),
                                                      //             //hello
                                                      //             InkWell(
                                                      //               onTap: () {
                                                      //                 _flashProductByIdController.selectedimg.value =
                                                      //                     index;
                                                      //               },
                                                      //               child: PhysicalModel(
                                                      //                 shape: BoxShape.rectangle,
                                                      //                 elevation: 1,
                                                      //                 color: Colors.white12,
                                                      //                 child: Container(
                                                      //                   height: size.height*0.06,
                                                      //                   width: size.width*0.15,
                                                      //                   // height: 160,
                                                      //                   // width: 300,
                                                      //                   decoration: BoxDecoration(
                                                      //                     image: DecorationImage(
                                                      //                         fit: BoxFit.cover,
                                                      //                         image: NetworkImage(base +
                                                      //                             _flashProductByIdController
                                                      //                                 .flashproductbyid!
                                                      //                             //[0]
                                                      //                                 .result![0]
                                                      //                                 .multipleImage![
                                                      //                             index])
                                                      //                       // image: NetworkImage(base +
                                                      //                       //     _flashProductByIdController
                                                      //                       //         .flashProductDescriptionsModel!
                                                      //                       //         .result[0]
                                                      //                       //         .multipleImage[
                                                      //                       //     index])
                                                      //                     ),
                                                      //                     border: Border.all(
                                                      //                         color: Colors.green
                                                      //                     ),
                                                      //                     borderRadius: BorderRadius.circular(5),
                                                      //                     boxShadow: [
                                                      //                       BoxShadow(
                                                      //                           color: Colors.grey,
                                                      //                           // offset: Offset(0.0, 1.0), //(x,y)
                                                      //                           blurRadius: 5,
                                                      //                           spreadRadius: 2
                                                      //                         //spare radius
                                                      //                       ),
                                                      //                     ],
                                                      //                   ),
                                                      //                 ),
                                                      //               ),
                                                      //             )
                                                      //           ],
                                                      //         );
                                                      //       }),
                                                      // ),








//                                                     Container(
//                                                       height: size.height*0.09,
//                                                       width: size.height*0.95,
// color: Colors.red,
//                                                       child: ListView.builder(
//                                                           scrollDirection: Axis.horizontal,
//                                                           shrinkWrap: true,
//                                                           // physics: NeverScrollableScrollPhysics(),
//                                                           itemCount: _flashProductByIdController
//                                                               .flashproductbyid!
//                                                               .result!.length,
//                                                           itemBuilder: (context, index) {
//                                                             return Container(
//                                                               height: size.height*0.09,
//                                                               width: size.height*0.95,
//                                                               ////[0]
//                                                               child: ListView.builder(
//                                                                   scrollDirection: Axis.horizontal,
//                                                                   itemCount: _flashProductByIdController
//                                                                       .flashproductbyid!
//                                                                       .result![0].multipleImage!.length,
//                                                                       // .result!.length,
//                                                                   itemBuilder: (context, index) {
//                                                                     return Row(
//                                                                       children: [
//                                                                         SizedBox(
//                                                                           // width: 10,
//                                                                           width: size.width*0.02,
//                                                                         ),
//                                                                         //hello
//                                                                         InkWell(
//                                                                           onTap: () {
//                                                                             _flashProductByIdController.selectedimg.value =
//                                                                                 index;
//                                                                           },
//                                                                           child: PhysicalModel(
//                                                                             shape: BoxShape.rectangle,
//                                                                             elevation: 1,
//                                                                             color: Colors.white12,
//                                                                             child: Container(
//                                                                               height: size.height*0.06,
//                                                                               width: size.width*0.15,
//                                                                               // height: 160,
//                                                                               // width: 300,
//                                                                               decoration: BoxDecoration(
//                                                                                 image: DecorationImage(
//                                                                                     fit: BoxFit.cover,
//                                                                                     image: NetworkImage(base +
//                                                                                         _flashProductByIdController
//                                                                                             .flashproductbyid!
//                                                                                         //[0]
//                                                                                             .result![0]
//                                                                                             .multipleImage![
//                                                                                         index])
//                                                                                     // image: NetworkImage(base +
//                                                                                     //     _flashProductByIdController
//                                                                                     //         .flashProductDescriptionsModel!
//                                                                                     //         .result[0]
//                                                                                     //         .multipleImage[
//                                                                                     //     index])
//                                                                                 ),
//                                                                                 border: Border.all(
//                                                                                     color: Colors.green
//                                                                                 ),
//                                                                                 borderRadius: BorderRadius.circular(5),
//                                                                                 boxShadow: [
//                                                                                   BoxShadow(
//                                                                                       color: Colors.grey,
//                                                                                       // offset: Offset(0.0, 1.0), //(x,y)
//                                                                                       blurRadius: 5,
//                                                                                       spreadRadius: 2
//                                                                                     //spare radius
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                             ),
//                                                                           ),
//                                                                         )
//                                                                       ],
//                                                                     );
//                                                                   }),
//                                                             );
//                                                           }),
//                                                     ),
                                                          ///todo: product name.........
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                    vertical: 0.h,
                                                                    horizontal: 0.w),
                                                            child:
                                                            Text(
                                                              //'ghee',
                                                              _flashProductByIdController
                                                                  .flashproductbyid!
                                                                  .result![mainIndex]
                                                                  .productName
                                                                  .toString(),
                                                              style: TextStyle(
                                                                color: AppColors
                                                                    .themecolors,
                                                                //Colors.yellow,
                                                                fontWeight:
                                                                    FontWeight.bold,
                                                                fontSize: 19.sp,
                                                              ),
                                                            ),
                                                          ),

                                                          ///price..............
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                    vertical: 0.5.h,
                                                                    horizontal: 0.w),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Price:',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            11.sp,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5.w,
                                                                    ),
                                                                    Text(
                                                                      //textHolder,

                                                                      '₹ ${_flashProductByIdController.flashproductbyid!.result![mainIndex].finalPrice.toString()}',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            13.sp,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 2.w,
                                                                    ),
                                                                    Text(
                                                                      '₹ ${_flashProductByIdController.flashproductbyid!.result![mainIndex].price.toString()}',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,

                                                                        fontSize:
                                                                            13.sp,
                                                                        decoration:
                                                                            TextDecoration
                                                                                .lineThrough,

                                                                        decorationColor:
                                                                            Colors
                                                                                .black,
                                                                        decorationThickness:
                                                                            2.85,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 50,
                                                                    ),
                                                                   /// Review section here
                                                                    GestureDetector(
                                                                      onTap: (){
                                                                        addReview();
                                                                      },
                                                                      child:
                                                                      Container(
                                                                        height: size.height * 0.050,
                                                                        width: 30.w,
                                                                        decoration:
                                                                        BoxDecoration(
                                                                          borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                              20),
                                                                        ),
                                                                        child: RaisedGradientButton(
                                                                          //height: 3.3.h,
                                                                          //width: 23.9.w,
                                                                          child: Text(
                                                                            'Review',
                                                                            style: TextStyle(
                                                                                color: Colors
                                                                                    .white,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .w800,
                                                                                fontSize:
                                                                                15.sp),
                                                                          ),
                                                                          gradient:
                                                                          LinearGradient(
                                                                            colors: <
                                                                                Color>[
                                                                              Color(
                                                                                  0xff3a923b),
                                                                              Color(
                                                                                  0xffb5d047),
                                                                            ],
                                                                          ),
                                                                          onPressed: () {
                                                                            // cartController.addProduct(
                                                                            //     Productss
                                                                            //         .products[index]);
                                                                            // controller.addtocartApi(_homePageController
                                                                            //     .getflashsellproduct!
                                                                            //     .result![
                                                                            //         index]
                                                                            //     .id);
                                                                            print(
                                                                                'Add To cart');
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),

                                                          ///weight...............
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            0.5.h,
                                                                        horizontal:
                                                                            0.w),
                                                                child: Text(
                                                                  'Weight:',
                                                                  style: TextStyle(
                                                                    fontSize: 11.sp,
                                                                    color:
                                                                        Colors.black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 0.0.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      clickFunction;

                                                                      print(Text);
                                                                    },
                                                                    child: Container(
                                                                      height:
                                                                          size.height *
                                                                              0.04,
                                                                      width:
                                                                          size.width *
                                                                              0.26,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        // color:
                                                                        //     Colors.green,
                                                                        gradient: MyTheme
                                                                            .gradient12,
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .circular(
                                                                                    10),
                                                                      ),
                                                                      child: Center(
                                                                        child: Text(
                                                                          '${_flashProductByIdController.flashproductbyid!.result![mainIndex].weight2}${_flashProductByIdController.flashproductbyid!.result![mainIndex].pkt2}',
                                                                          style:
                                                                              TextStyle(
                                                                            overflow:
                                                                                TextOverflow
                                                                                    .ellipsis,
                                                                            fontSize:
                                                                                8.sp,
                                                                            color: Colors
                                                                                .white,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        size.width *
                                                                            0.02,
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        size.height *
                                                                            0.04,
                                                                    width:
                                                                        size.width *
                                                                            0.26,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      // color:
                                                                      //     Colors.green,
                                                                      gradient: MyTheme
                                                                          .gradient12,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  10),
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        '${_flashProductByIdController.flashproductbyid!.result![mainIndex].weight2}${_flashProductByIdController.flashproductbyid!.result![mainIndex].pkt2}',
                                                                        style:
                                                                            TextStyle(
                                                                          overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                          fontSize:
                                                                              8.sp,
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        size.width *
                                                                            0.02,
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        size.height *
                                                                            0.04,
                                                                    width:
                                                                        size.width *
                                                                            0.26,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      // color:
                                                                      //     Colors.green,
                                                                      gradient: MyTheme
                                                                          .gradient12,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  10),
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        '${_flashProductByIdController.flashproductbyid!.result![mainIndex].weight3}${_flashProductByIdController.flashproductbyid!.result![mainIndex].pkt3}',
                                                                        style:
                                                                            TextStyle(
                                                                          overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                          fontSize:
                                                                              8.sp,
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: size.height *
                                                                    0.01,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                        size.height *
                                                                            0.04,
                                                                    width:
                                                                        size.width *
                                                                            0.26,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      // color:
                                                                      //     Colors.green,
                                                                      gradient: MyTheme
                                                                          .gradient12,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  10),
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        '${_flashProductByIdController.flashproductbyid!.result![mainIndex].weight4}${_flashProductByIdController.flashproductbyid!.result![mainIndex].pkt4}',
                                                                        style:
                                                                            TextStyle(
                                                                          overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                          fontSize:
                                                                              8.sp,
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        size.width *
                                                                            0.02,
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        size.height *
                                                                            0.04,
                                                                    width:
                                                                        size.width *
                                                                            0.26,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      // color:
                                                                      //     Colors.green,
                                                                      gradient: MyTheme
                                                                          .gradient12,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  10),
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        '${_flashProductByIdController.flashproductbyid!.result![mainIndex].weight5}${_flashProductByIdController.flashproductbyid!.result![mainIndex].pkt5}',
                                                                        style:
                                                                            TextStyle(
                                                                          overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                          fontSize:
                                                                              8.sp,
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),

                                                      SizedBox(
                                                        height: 0.1.h,

                                                        ///TODO: here we have rating view............
                                                        // child: Row(
                                                        //   mainAxisAlignment:
                                                        //       MainAxisAlignment.start,
                                                        //   crossAxisAlignment:
                                                        //       CrossAxisAlignment.center,
                                                        //   children: [
                                                        //     Padding(
                                                        //       padding:
                                                        //           const EdgeInsets.all(
                                                        //               2.0),
                                                        //       child: Text(
                                                        //         'Rating:',
                                                        //         style: TextStyle(
                                                        //           fontSize: 13.sp,
                                                        //           fontWeight:
                                                        //               FontWeight.bold,
                                                        //         ),
                                                        //       ),
                                                        //     ),
                                                        //     Padding(
                                                        //       padding:
                                                        //           EdgeInsets.symmetric(
                                                        //               vertical: 5,
                                                        //               horizontal: 2),
                                                        //       child: Text(
                                                        //         '5',
                                                        //         style: TextStyle(
                                                        //             color: Color(int
                                                        //                 .parse(Productss
                                                        //                     .products[
                                                        //                         index]
                                                        //                     .color
                                                        //                     .toString())),
                                                        //             fontSize: 13.sp,
                                                        //             fontWeight:
                                                        //                 FontWeight
                                                        //                     .w700),
                                                        //       ),
                                                        //     ),
                                                        //     Padding(
                                                        //       padding:
                                                        //           EdgeInsets.symmetric(
                                                        //               vertical: 5,
                                                        //               horizontal: 0),
                                                        //       child: Text(
                                                        //         '/',
                                                        //         style: TextStyle(
                                                        //             color: Color(int
                                                        //                 .parse(Productss
                                                        //                     .products[
                                                        //                         index]
                                                        //                     .color
                                                        //                     .toString())),
                                                        //             fontSize: 13.sp,
                                                        //             fontWeight:
                                                        //                 FontWeight
                                                        //                     .w400),
                                                        //       ),
                                                        //     ),
                                                        //     Padding(
                                                        //       padding:
                                                        //           EdgeInsets.symmetric(
                                                        //               vertical: 5,
                                                        //               horizontal: 2),
                                                        //       child: Text(
                                                        //         '4.1',
                                                        //         style: TextStyle(
                                                        //             color: Color(int
                                                        //                 .parse(Productss
                                                        //                     .products[
                                                        //                         index]
                                                        //                     .color
                                                        //                     .toString())),
                                                        //             fontSize: 13.sp,
                                                        //             fontWeight:
                                                        //                 FontWeight
                                                        //                     .w700),
                                                        //       ),
                                                        //     ),
                                                        //     Icon(
                                                        //       Icons.star,
                                                        //       color: Colors
                                                        //           .yellow.shade700,
                                                        //       size: 20,
                                                        //     )
                                                        //   ],
                                                        // ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.3.h,
                                                      ),

                                                      ///details.................
                                                      Text(
                                                        'Details:',
                                                        style: TextStyle(
                                                          fontSize: 11.sp,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.1.h,
                                                      ),
                                                      SizedBox(
                                                        height: size.height * 0.14,
                                                        child: Text(
                                                          _flashProductByIdController
                                                              .flashproductbyid!
                                                              .result![mainIndex]
                                                              .productDescription
                                                              .toString(),
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                          maxLines: 8,

                                                          //'This is the Gyros product it will be fine for you if you want to purchase food through online mood and it is so fresh product and you can try it once. This is the Gyros product it will be fine for you if you want to purchase food through online mood and it is so fresh product and you can try it once.This is the Gyros product it will be fine for you if you want to purchase food through online mood and it is so fresh product and you can try it once.This is the Gyros product it will be fine for you if you want to purchase food through online mood and it is so fresh product and you can try it once.',
                                                          style: TextStyle(
                                                            fontSize: 9.sp,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),

                                        ///image.........................

                                        Positioned(
                                          top: 0.h,
                                          //left: size.width * 0.0,
                                          child: Material(
                                            borderRadius: BorderRadius.circular(4),
                                            elevation: 0,
                                            child:
                                            Container(
                                              height: size.height * 0.35,
                                              width: size.width,
                                              child: ListView.builder(

                                                  // _flashProductByIdController
                                                  //     .flashproductbyid!
                                                  //     .result!.length,
                                                  itemCount:   _flashProductByIdController
                                                      .flashproductbyid!
                                                      .result!.length,
                                                  // _controller
                                                  //     .getProductDetailModel!.result.length,
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: ((context, index) {
                                                    return Obx(
                                                          () => Container(
                                                        height: size.height * 0.35,
                                                        width: size.width * 0.99,
                                                        color: Colors.red,
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: NetworkImage(
                                                              base +
                                                                  _flashProductByIdController
                                                                      .flashproductbyid!
                                                                    .result![index]
                                                                    .multipleImage![
                                                                  _flashProductByIdController
                                                                    .selectedimg.value] ,
                                                            ),
                                                            fit: BoxFit.fill,
                                                          ),
                                                          color: Colors.transparent,
                                                          // borderRadius: BorderRadius.all(
                                                          //   Radius.circular(40),
                                                          // ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                blurRadius: 4,
                                                                color: Colors.blueGrey)
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  })),
                                              // CarouselSlider.builder(
                                              //   key: _sliderKey1,
                                              //   autoSliderTransitionTime:
                                              //       Duration(seconds: 2),
                                              //   autoSliderDelay: Duration(seconds: 5),
                                              //   //Duration autoSliderTransitionTime = const Duration(seconds: 2),
                                              //   slideBuilder: (index) {
                                              //     return Container(
                                              //       alignment: Alignment.center,
                                              //       decoration: BoxDecoration(
                                              //           // image: DecorationImage(
                                              //           //     image: NetworkImage(base +
                                              //           //         '${_flashProductByIdController.flashproductbyid!.result![mainIndex].multipleImage![index].toString()}'),
                                              //           //     fit: BoxFit.fill),
                                              //           ),
                                              //       child: Container(
                                              //         height: size.height * 0.38,
                                              //         width: size.width,
                                              //         child: Image.network(
                                              //           base +
                                              //               '${_flashProductByIdController.flashproductbyid!.result![mainIndex].multipleImage![index].toString()}',
                                              //           fit: BoxFit.fill,
                                              //           errorBuilder: (context, error,
                                              //               stackTrace) {
                                              //             //if image not comming in catagary then we have to purchase
                                              //
                                              //             return Image.network(base +
                                              //                 '${_flashProductByIdController.flashproductbyid!.result![mainIndex].productImage.toString()}');
                                              //           },
                                              //         ),
                                              //       ),
                                              //     );
                                              //   },
                                              //   slideTransform:
                                              //       ZoomOutSlideTransform(),
                                              //   slideIndicator:
                                              //       CircularSlideIndicator(
                                              //     indicatorBorderWidth: 2,
                                              //     indicatorRadius: 4,
                                              //     itemSpacing: 15,
                                              //     currentIndicatorColor: Colors.white,
                                              //     padding: EdgeInsets.only(bottom: 6),
                                              //   ),
                                              //   itemCount: _flashProductByIdController
                                              //       .flashproductbyid!
                                              //       .result![mainIndex]
                                              //       .multipleImage!
                                              //       .length,
                                              //   enableAutoSlider: false,
                                              // ),
                                            ),
                                          ),
                                        ),

                                       //About the product





                                        // ///add product.................
                                        // Positioned(
                                        //   bottom: 2.h,
                                        //   child: Padding(
                                        //     padding:
                                        //         EdgeInsets.symmetric(horizontal: 5.w),
                                        //     child: Row(
                                        //       children: [
                                        //         InkWell(
                                        //           onTap: () {
                                        //             controller.addtocartApi(
                                        //                 _flashProductByIdController
                                        //                     .flashproductbyid!
                                        //                     .result![mainIndex]
                                        //                     .id);
                                        //             // cartController.addProduct(
                                        //             //     Productss
                                        //             //         .products[mainIndex]);
                                        //             //_cartNewController.addItemInCart(product);
                                        //             //_cartNewController.numOfItems.(product);
                                        //           },
                                        //           child: Container(
                                        //             margin: EdgeInsets.only(
                                        //                 right: MyTheme.defaultPading),
                                        //             height: 50,
                                        //             width: 50,
                                        //             decoration: BoxDecoration(
                                        //               color: AppColors.themecolors,
                                        //               // Color(int.parse(Productss
                                        //               //     .products[mainIndex].color
                                        //               //     .toString())),
                                        //               borderRadius:
                                        //                   BorderRadius.circular(20),
                                        //               border: Border.all(
                                        //                 color: AppColors.themecolors,
                                        //                 //Colors.blueAccent,
                                        //                 // Color(int.parse(
                                        //                 //     Productss
                                        //                 //         .products[mainIndex]
                                        //                 //         .color
                                        //                 //         .toString())),
                                        //               ),
                                        //             ),
                                        //             child: Padding(
                                        //               padding:
                                        //                   const EdgeInsets.all(8.0),
                                        //               child: Icon(
                                        //                 Icons.add_shopping_cart_sharp,
                                        //                 color: Colors.white,
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         SizedBox(
                                        //           height: 50,
                                        //           width: size.width * 0.7,
                                        //           child: ElevatedButton(
                                        //             onPressed: () {
                                        //               _rozarPayController
                                        //                   .openCheckout();
                                        //
                                        //               print('click');
                                        //             },
                                        //             style: ButtonStyle(
                                        //                 shape:
                                        //                     MaterialStateProperty.all(
                                        //                   RoundedRectangleBorder(
                                        //                     borderRadius:
                                        //                         BorderRadius.circular(
                                        //                             30),
                                        //                   ),
                                        //                 ),
                                        //                 backgroundColor:
                                        //                     MaterialStateProperty.all(
                                        //                         AppColors.themecolors
                                        //                         // Color(
                                        //                         //   int.parse(Colors.green).toString()
                                        //                         //     // int.parse(Productss
                                        //                         //     // .products[mainIndex]
                                        //                         //     // .color
                                        //                         //     // .toString())
                                        //                         // ),
                                        //                         )),
                                        //             child: Text(
                                        //               'Buy Now'.toUpperCase(),
                                        //               style: TextStyle(
                                        //                   fontSize: 12,
                                        //                   fontWeight: FontWeight.bold,
                                        //                   color: Colors.white),
                                        //             ),
                                        //           ),
                                        //         )
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),


                                      ],
                                    ),
                                  ),
                                  Container(

                                    // height: 1200,
                                    width: constraints.maxWidth,

                                    child: Column(

                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: size.height * 0.038,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              //color: Color(0xffF6F7DD),
                                              color: MyTheme.containergradient,
                                              //gradient: MyTheme.gradient2,
                                            ),
                                            //color: MyTheme.loginPageBoxColor,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.w, vertical: 0.4.h),
                                              child: Center(
                                                child: Text(
                                                  'About the Product',
                                                  style: TextStyle(
                                                    color: Colors.black,

                                                    //color: Theme.of(context).colorScheme.onPrimary,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: size.height * 0.495,
                                            width: size.width,
                                            decoration: BoxDecoration(
                                              // color: Color(0xffE8F9FD)
                                            ),
                                            //////////////////////////////
                                            // itemCount: _flashProductByIdController
                                            //     .flashproductbyid!
                                            //     .result![0].multipleImage!.length,

                                            /////////////////////////


                                            child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: _aboutProductController.getabouttheproduct?.result?.length,
                                               // itemCount: _aboutProductController.getabouttheproduct?.result?.length,,
                                                itemBuilder: (BuildContext context, int indexx) {

                                                  return
                                                     Obx(
                                                         ()=>(_aboutProductController.isLoading.value)
                                                             ? Center(child: CircularProgressIndicator())
                                                             : _aboutProductController.getabouttheproduct!.result!.isEmpty
                                                     ? Center(
                                                         child: Text('No data'),
                                                  )


                                                             :Column(
                                                          children:<Widget> [
                                                            Padding(
                                                              padding: const EdgeInsets.all(15.0),
                                                              child:
                                                              PhysicalModel(
                                                                borderRadius:
                                                                BorderRadius.circular(5),
                                                                color: MyTheme.ThemeColors,
                                                                elevation: 1,
                                                                child: Container(
                                                                  height: 26.h,
                                                                  width: size.width * 0.5,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(5),
                                                                    color: Colors.white,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors.grey.withOpacity(1.0),
                                                                        spreadRadius: 5,
                                                                        blurRadius: 7,
                                                                        //offset: Offset(0, 3), // changes position of shadow
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(5),
                                                                      child:
                                                                    Image.network(
                                                                      base +
                                                                          '${_aboutProductController.getabouttheproduct!.result![indexx].image.toString()}',
                                                                      fit: BoxFit.cover,),
                                                                  )
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              // height: 200,
                                                              // width: 200,
                                                              child: Text(_aboutProductController.getabouttheproduct!.result![indexx].title.toString(),
                                                                style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.w700,
                                                                  fontSize: 11.sp,
                                                                ),
                                                              )

                                                            ),
                                                            SizedBox(
                                                              height: 0.1.h,
                                                            ),
                                                            ///description
                                                            Container(
                                                              height: size.height*0.15,
                                                              width: size.width * 0.5,
                                                              child: Text(_aboutProductController.getabouttheproduct!.result![indexx].description.toString(),

                                                                overflow: TextOverflow.ellipsis,
                                                                maxLines: 8,


                                                                style: TextStyle(
                                                                  fontSize: 9.sp,
                                                                  color: Colors.black,
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                     );

                                                })
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: size.height * 0.038,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              //color: Color(0xffF6F7DD),
                                              color: MyTheme.containergradient,
                                              //gradient: MyTheme.gradient2,
                                            ),
                                            //color: MyTheme.loginPageBoxColor,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.w, vertical: 0.4.h),
                                              child: Center(
                                                child: Text(
                                                  'Stand Out Points',
                                                  style: TextStyle(
                                                    color: Colors.black,

                                                    //color: Theme.of(context).colorScheme.onPrimary,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: size.height * 0.495,
                                            // height: size.height * 0.580,
                                            decoration: BoxDecoration(

                                              // color: Color(0xffE8F9FD)

                                            ),
                                            //null error

                                            child: ListView.builder(
                                                scrollDirection: Axis.horizontal,

                                                itemCount: _standOutController.getstandoutpoints?.result?.length,
                                                itemBuilder: (BuildContext context, int indexx) {

                                                  return
                                                    Obx(
                                                          ()=>(_standOutController.isLoading.value)
                                                          ? Center(child: CircularProgressIndicator())
                                                          : _standOutController.getstandoutpoints!.result!.isEmpty
                                                          ? Center(
                                                        child: Text('No data'),
                                                      )

                                                      //     ? Center(
                                                      //   child: Text('No data'),
                                                      // )
                                                          :Column(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.all(15.0),
                                                            child:
                                                            PhysicalModel(
                                                              borderRadius:
                                                              BorderRadius.circular(5),
                                                              color: MyTheme.ThemeColors,
                                                              elevation: 1,
                                                              child: Container(
                                                                  height: 26.h,
                                                                  width: size.width * 0.5,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(5),
                                                                    color: Colors.white,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors.grey.withOpacity(1.0),
                                                                        spreadRadius: 5,
                                                                        blurRadius: 7,
                                                                        //offset: Offset(0, 3), // changes position of shadow
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: ClipRRect(
                                                                    borderRadius: BorderRadius.circular(5),
                                                                    child:
                                                                    Image.network(
                                                                      base +
                                                                          '${_standOutController.getstandoutpoints!.result![indexx].image.toString()}',
                                                                      fit: BoxFit.cover,),
                                                                  )
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            // height: 200,
                                                            // width: 200,
                                                              child: Text(_standOutController.getstandoutpoints!.result![indexx].title.toString(),
                                                                style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.w700,
                                                                  fontSize: 11.sp,
                                                                ),
                                                              )

                                                          ),
                                                          SizedBox(
                                                            height: 0.1.h,
                                                          ),
                                                          ///description
                                                          Container(
                                                            height: size.height*0.15,
                                                            width: size.width * 0.5,
                                                            child: Text(_standOutController.getstandoutpoints!.result![indexx].description.toString(),

                                                              overflow: TextOverflow.ellipsis,
                                                              maxLines: 8,


                                                              style: TextStyle(
                                                                fontSize: 9.sp,
                                                                color: Colors.black,
                                                                fontWeight:
                                                                FontWeight.w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );

                                                })
                                        ),
                                        ///
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: size.height * 0.038,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              //color: Color(0xffF6F7DD),
                                              color: MyTheme.containergradient,
                                              //gradient: MyTheme.gradient2,
                                            ),
                                            //color: MyTheme.loginPageBoxColor,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.w, vertical: 0.4.h),
                                              child: Center(
                                                child: Text(
                                                  'Have You Tried These?',
                                                  style: TextStyle(
                                                    color: Colors.black,

                                                    //color: Theme.of(context).colorScheme.onPrimary,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ///Hello
                                        Container(
                                            height: size.height * 0.325,
                                            // height: size.height * 0.495,
                                            decoration: BoxDecoration(

                                              // color: Color(0xffE8F9FD)

                                            ),
                                            //null error

                                            child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                //itemCount: 5,
                                                 itemCount: _allTriedProductController.allProductModel?.result?.length,
                                                itemBuilder: (BuildContext context, int indexx) {

                                                  return
                                                    Obx(
                                                          ()=>(_allTriedProductController.isLoading.value)
                                                          ? Center(child: CircularProgressIndicator())
                                                          : _allTriedProductController.allProductModel!.result!.isEmpty
                                                          ? Center(
                                                        child: Text('No data'),
                                                      )

                                                      //     ? Center(
                                                      //   child: Text('No data'),
                                                      // )
                                                          :Column(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.all(15.0),
                                                            child:
                                                            PhysicalModel(
                                                              borderRadius:
                                                              BorderRadius.circular(5),
                                                              color: MyTheme.ThemeColors,
                                                              elevation: 1,
                                                              child: Container(
                                                                  height: 26.h,
                                                                  width: size.width * 0.5,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(5),
                                                                    color: Colors.white,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors.grey.withOpacity(1.0),
                                                                        spreadRadius: 5,
                                                                        blurRadius: 7,
                                                                        //offset: Offset(0, 3), // changes position of shadow
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: ClipRRect(
                                                                    borderRadius: BorderRadius.circular(5),
                                                                    child:
                                                                    Image.network(
                                                                      base +
                                                                          '${_allTriedProductController.allProductModel!.result![indexx].productImage.toString()}',
                                                                      fit: BoxFit.cover,),
                                                                  )
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:  EdgeInsets.only(left: size.width*0.04),
                                                            child: Container(
                                                              height: size.height*0.02,
                                                                width: size.width*0.6,
                                                                child: AutoSizeText(_allTriedProductController.allProductModel!.result![indexx].productName.toString(),
                                                                  style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.w700,
                                                                    fontSize: 11.sp,
                                                                  ),
                                                                )

                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                    );

                                                })
                                        ),

                                        SizedBox(height: 20,),
                                        ///add product.................
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  controller.addtocartApi(
                                                      _flashProductByIdController
                                                          .flashproductbyid!
                                                          .result![mainIndex]
                                                          .id);

                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: MyTheme.defaultPading),
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.themecolors,

                                                    borderRadius:
                                                    BorderRadius.circular(20),
                                                    border: Border.all(
                                                      color: AppColors.themecolors,
                                                      //Colors.blueAccent,
                                                      // Color(int.parse(
                                                      //     Productss
                                                      //         .products[mainIndex]
                                                      //         .color
                                                      //         .toString())),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Icon(
                                                      Icons.add_shopping_cart_sharp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50,
                                                width: size.width * 0.7,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    _rozarPayController
                                                        .openCheckout();

                                                    print('click hello');
                                                  },
                                                  style: ButtonStyle(
                                                      shape:
                                                      MaterialStateProperty.all(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                      MaterialStateProperty.all(
                                                          AppColors.themecolors
                                                        // Color(
                                                        //   int.parse(Colors.green).toString()
                                                        //     // int.parse(Productss
                                                        //     // .products[mainIndex]
                                                        //     // .color
                                                        //     // .toString())
                                                        // ),
                                                      )),
                                                  child: Text(
                                                    'Buy Now'.toUpperCase(),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
      ),
    );
  }

  addReview() {
    Get.dialog(
      RatingDialog(
        starSize: 30,
          title: Text(""),
          starColor: Colors.amber,
          submitButtonText: "Post Review",
          image: Container(
            //color: Colors.green,
            child: Column(
              children: [
                Container(
                  height: 5.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: 8),
                    child: TextFormField(
                      controller: _controller.name,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                          hintText: "Name"
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 5.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: 8),
                    child: TextFormField(
                      controller: _controller.email,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email"),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                    height: 5.h,
                    width: 220.w,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: 8),
                    child: TextFormField(
                      controller: _controller.title,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Title"),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 5.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: _controller.description,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                          hintText: "Description"),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 5.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      inputFormatters: [
                         LengthLimitingTextInputFormatter(10),
                      ],
                      controller: _controller.mobile,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                          hintText: "Mobile Number"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Obx(
                      // () => _controller.selectedPath.value != ''
                      () => _controller.selectedPath.value != ''
                      ? Image.file(File(_controller.selectedPath.value))
                      :
                      Center(
                    child: InkWell(
                      onTap: (() {
                        optionsImage();
                      }),
                      child: Container(
                        height: 16.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12)),
                            border: Border.all(
                                width: 0.5.w,
                                color:
                                Color.fromARGB(255, 58, 141, 208))),
                        child: Center(
                          child: Icon(
                            Icons.add_box,
                            color: Color.fromARGB(255, 58, 141, 208),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          enableComment: false,
          onSubmitted: (response) {
            _controller.ratings.value = response.rating;
            if (_controller.ratings.value == 1) {
              _controller.rating1.value = true;
            } else if (_controller.ratings.value == 2) {
              _controller.rating1.value = true;
              _controller.rating2.value = true;
            } else if (_controller.ratings.value == 3) {
              _controller.rating1.value = true;
              _controller.rating2.value = true;
              _controller.rating3.value = true;
            } else if (_controller.ratings.value == 4) {
              _controller.rating1.value = true;
              _controller.rating2.value = true;
              _controller.rating3.value = true;
              _controller.rating4.value = true;
            } else if (_controller.ratings.value == 4) {
              _controller.rating1.value = true;
              _controller.rating2.value = true;
              _controller.rating3.value = true;
              _controller.rating4.value = true;
              _controller.rating5.value = true;
            }

            _controller.addProductReviewApi();
          }),
    );
  }

  void optionsImage() {
    Get.defaultDialog(
      title: "Selcet an option",
      titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
      content: SizedBox(
        width: 78.h,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                _controller.getImage(ImageSource.camera);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_enhance,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 6.w,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 6.w,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 34, 126, 201),
              endIndent: 12.w,
              indent: 12.w,
            ),
            InkWell(
              onTap: () {
                _controller.getImage(ImageSource.gallery);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo,
                    color: Color.fromARGB(255, 34, 126, 201),
                    size: 6.w,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                      color: Color.fromARGB(255, 34, 126, 201),
                      fontSize: 6.w,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// static signUpApi(var Name,
//     var Mobile_No,
//     var Email_Id,
//     var PassWord,
//     var ConfirmPassWord,) async {
//   try {
//     var url = baseUrl + 'api/AdminApi/Registration';
//
//     var body = {
//       "Name": Name,
//       "Mobile_No": Mobile_No,
//       "Email_Id": Email_Id,
//       "PassWord": PassWord,
//       "ConfirmPassWord": ConfirmPassWord,
//     };
//     print(body);
//     http.Response r = await http.post(
//       Uri.parse(url),
//       body: body,
//     );
//     print(r.body);
//     if (r.statusCode == 200) {
//       return r;
//     } else {
//       Get.snackbar('Error', 'SignUp Fail');
//       return r;
//     }
//   } catch (e) {
//     print('Error');
//     print(e.toString());
//   }
// }












