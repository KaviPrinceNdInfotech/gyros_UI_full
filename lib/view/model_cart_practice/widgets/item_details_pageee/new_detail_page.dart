import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/widgets/circular_loader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/app_colors.dart';
import '../../../../controllers/about_the_product/about_the_product_controller.dart';
import '../../../../controllers/cart_controllers.dart';
import '../../../../controllers/flash_sale_product_by_id_controllers/flash_product_by_id_controller.dart';
import '../../../../controllers/new_add_to_cart_controller.dart';
import '../../../../controllers/new_detail_controller.dart';
import '../../../../controllers/productDetailController.dart';
import '../../../../controllers/rozar_pay_controller/rozar_pay_controller.dart';
import '../../../../controllers/standOut/stand_out_controller.dart';
import '../../../../controllers/tried_these_controller/tried_these_controller.dart';
import '../../../../controllers/weight_button_controller.dart';
import '../../../custom_widgets/my_theme.dart';
import '../../../home_page/home_page_controller.dart';
import '../cart_product2.dart';
import '../gradient_button.dart';

class ItemDetailsss extends StatelessWidget {
  ItemDetailsss({Key? key}) : super(key: key);
  RxInt selectedimg = 0.obs;
  RxInt selectedsingleimg = 0.obs;

  // final CartController controller = Get.put(CartController());
  final RozarPayController _rozarPayController = Get.find();

  String textHolder = '268 ';
  ///demo
final List<String> richa = [
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png',
  'https://www.shutterstock.com/image-photo/surreal-image-african-elephant-wearing-260nw-1365289022.jpg',
  'https://letsenhance.io/static/334225cab5be263aad8e3894809594ce/75c5a/MainAfter.jpg',
  'https://letsenhance.io/static/334225cab5be263aad8e3894809594ce/75c5a/MainAfter.jpg',
  'https://www.shutterstock.com/image-photo/surreal-image-african-elephant-wearing-260nw-1365289022.jpg',
  'https://www.shutterstock.com/image-photo/surreal-image-african-elephant-wearing-260nw-1365289022.jpg',
  'https://www.shutterstock.com/image-photo/surreal-image-african-elephant-wearing-260nw-1365289022.jpg',
  'https://www.shutterstock.com/image-photo/surreal-image-african-elephant-wearing-260nw-1365289022.jpg',
];
  void clickFunction() {
    // setState(() {
    //   textHolder = '260';
    //
    // });

    print('260');
  }
  // final CartController controller = Get.put(CartController());

  NewCartController _newCartController = Get.put(NewCartController());
  StandOutController _standOutController = Get.put(StandOutController());
  AboutProductController _aboutProductController =
  Get.put(AboutProductController());
  TriedProductController _allTriedProductController =
  Get.put(TriedProductController());
  HomePageController _homePageController = Get.put(HomePageController());
  NewController _newProductByIdController = Get.put(NewController());
  WeightButtonController _weightButtonController =
  Get.put(WeightButtonController());
  FlashProductByIdController _flashProductByIdController =
  Get.put(FlashProductByIdController());
  ProductDetailController _controller = Get.put(ProductDetailController());
  // final cartController = Get.put(CartController());
  TextEditingController price = TextEditingController();
  TextEditingController finalprice = TextEditingController();
  TextEditingController discount = TextEditingController();
  var pkt;
  var qty;
  String text = "No Value Entered";
  List a1 = [
    'https://api.gyros.farm/Images/COCO 1_1.jpg',
    'https://api.gyros.farm/Images/coco_500.jpg',
    'https://api.gyros.farm/Images/coco 2L.jpg',
    'https://api.gyros.farm/Images/coco 5L.jpg',
    'https://api.gyros.farm/Images/coco 15L.jpg'
  ];
  //finalprice
  @override
  Widget build(BuildContext context) {
    print(
        "kjfhgjhg: $_newProductByIdController.newModelid!.productModelApi!.productName.toString()");
    Size size = MediaQuery.of(context).size;
    RxBool unfold = true.obs;
    var base = 'https://api.gyros.farm/Images/';
    return Scaffold(
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
                    child: Icon(
                      Icons.shopping_cart,
                      size: size.height * 0.035,
                      color: Colors.white,
                    ),
                  )),
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
        body: Obx(() => _newProductByIdController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Stack(children: <Widget>[
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ///Large image
                  Obx(
                        () => Container(
                      height: size.height * 0.40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(base +
                                _newProductByIdController.newModelid!
                                    .productModelApi.multipleImage[
                                _newProductByIdController
                                    .selectedimg.value])),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.w),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  Container(
                    height: size.height * 0.04,
                    // height: size.height * 0.05,
                    width: size.width,
                    //color: Colors.green,
                    child: Center(
                        child: Text(
                          _newProductByIdController
                              .newModelid!.productModelApi.productName
                              .toString(),
                          style: TextStyle(
                            // color: AppColors
                            //     .themecolors,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              //fontSize: 19.sp,
                              fontSize: 20),
                        )),
                  ),
                  // SizedBox(
                  //   height: 16.h,
                  //   // height: 16.h,
                  //   width: double.infinity,
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: 4,
                  //       // itemCount: _newProductByIdController.newModelid!
                  //       //     .productModelApi.multipleImage.length,
                  //       shrinkWrap: true,
                  //       itemBuilder: (context, index) {
                  //         return Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Container(
                  //             height: 100,
                  //             width: 100,
                  //             color: Colors.grey,
                  //             child:
                  //             Image.network(base +
                  //                 '${_newProductByIdController.newModelid!.productModelApi.multipleImage[index].toString()}'
                  //
                  //             ),
                  //             ),
                  //
                  //           );
                  //
                  //
                  //
                  //       }),
                  // ),
                  ///small images


                  SizedBox(
                    height: 16.h,
                    // height: 16.h,
                    width: size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _newProductByIdController.newModelid!
                            .productModelApi.multipleImage.length,
                        itemBuilder: (context, index) {
                          return

                              InkWell(
                                onTap: () {
                                  // print()
                                  _newProductByIdController
                                      .selectedimg.value = index;
                                },
                                child: Container(
                                  height: 16.h,
                                  width: 30.w,
                                  // height: 16.h,
                                  // width: 30.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(base +
                                              _newProductByIdController
                                                  .newModelid!
                                                  .productModelApi
                                                  .multipleImage[
                                              index]))),
                                ),
                              );


                        }),
                  ),

                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  Obx(
                        () => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04),
                      child: Row(
                        children: [
                          Text(
                            "Add Qunatity : ",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.40,
                          ),
                          InkWell(
                            onTap: () {
                              _newProductByIdController.removeQty();
                              print(_newProductByIdController.qty.value);
                            },
                            child: CircleAvatar(
                              maxRadius: size.width * 0.03,
                              backgroundColor:
                              Colors.blueGrey.withOpacity(0.8),
                              child: Center(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Text(
                            _newProductByIdController.qty.value
                                .toString(),
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          InkWell(
                            onTap: () {
                              _newProductByIdController.addQty();
                              print(_newProductByIdController.qty.value);
                            },
                            child: CircleAvatar(
                              maxRadius: size.width * 0.03,
                              backgroundColor: AppColors.themecolors,
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  ///price and discount
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.04),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: size.height * 0.05,
                            width: size.width * 0.06,
                            //color: Colors.red,
                            child: Center(
                              child: Text(
                                _newProductByIdController
                                    .newModelid!
                                    .productModelApi
                                    .packetSizemodel[
                                _newProductByIdController
                                    .selectedPrice.value]
                                    .discountPercentage
                                    .toString(),
                                // textAlign: TextAlign. center,
                              ),
                            ),
                          ),
                          Container(
                            height: size.height * 0.05,
                            width: size.width * 0.01,
                            // color: Colors.red,
                            child: Center(
                                child: Text(
                                  '%',
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),

                  ///final price
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.040),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Padding(
                        //   padding:  EdgeInsets.only(
                        //       left: size.width*0.03
                        //   ),
                        //   child: Text(
                        //     'Final Price:',
                        //     style: TextStyle(
                        //       fontSize: 15,
                        //       color: Colors.black,
                        //       fontWeight: FontWeight.w500,
                        //     ),
                        //   ),
                        // ),
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.2,
                          // color: Colors.red,
                          child: Text(
                            "₹${_newProductByIdController.newModelid!.productModelApi.packetSizemodel[_newProductByIdController.selectedPrice.value].price}",
                            style:
                            TextStyle(
                            decoration: TextDecoration.lineThrough,

                            decorationStyle:
                            TextDecorationStyle
                                .solid,

                            decorationColor: Colors
                                .grey
                                .shade700,
                            decorationThickness:
                            1.9,
                            fontWeight:
                            FontWeight
                                .w600,
                            fontSize:
                            11.sp,
                            color: Colors
                                .red
                                .shade600,

                          ),
                            // TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //     decoration: TextDecoration.lineThrough,
                            //     decorationColor: Colors.red,
                            //     decorationThickness: 2.85,
                            //     color: Colors.red),
                          ),
                        ),
                        // SizedBox(width: size.width*0.05,),
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.2,
                          // color: Colors.red,
                          child: Text(
                            "₹${_newProductByIdController.newModelid!.productModelApi.packetSizemodel[_newProductByIdController.selectedPrice.value].finalPrice}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.2,
                        ),
                        GestureDetector(
                          onTap: () {
                            addReview();
                          },
                          child: Container(
                            height: size.height * 0.050,
                            width: 30.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: RaisedGradientButton(
                              //height: 3.3.h,
                              //width: 23.9.w,
                              child: Text(
                                'Review',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15.sp),
                              ),
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xff3a923b),
                                  Color(0xffb5d047),
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
                                print('Add To cart');
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  ///Text weight
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.03,
                        top: size.height * 0.01,
                        bottom: size.height * 0.01),
                    child: Text(
                      'Weight:',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  ///weightRicha
                  Container(
                      height: size.height * 0.04,
                      width: size.width,
                      child: ListView.builder(
                          itemCount: _newProductByIdController.newModelid
                              ?.productModelApi.packetSizemodel.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.01,
                                  right: size.width * 0.01),
                              child: InkWell(
                                onTap: () {
                                  _newProductByIdController
                                      .selectedPrice.value = index;
                                },
                                child: Container(
                                  // height: size.height * 0.04,
                                  // width: size.width * 0.26,
                                    height: size.height * 0.04,
                                    width: size.width * 0.18,
                                    decoration: BoxDecoration(
                                      // color: Colors.blue,
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color(0xff3a923b),
                                          const Color(0xffb5d047),
                                        ],
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(10),
                                    ),
                                    child:

                                    // Padding(
                                    //   padding:  EdgeInsets.only(
                                    //     top: size.height*0.01
                                    //   ),
                                    //   child: Text('${_newProductByIdController.newModelid!.productModelApi!.packetSizemodel![index]!.qty.toString()}',
                                    //     style:
                                    //     TextStyle(
                                    //       overflow:
                                    //       TextOverflow
                                    //           .ellipsis,
                                    //       fontSize:
                                    //       10,
                                    //       color: Colors
                                    //           .white,
                                    //       fontWeight:
                                    //       FontWeight
                                    //           .bold,
                                    //     ),
                                    //   ),
                                    // ),
                                    Center(
                                      child: Text(
                                        '${_newProductByIdController.newModelid!.productModelApi.packetSizemodel[index].qty.toString()}${_newProductByIdController.newModelid!.productModelApi.packetSizemodel[index].pkt.toString()}',
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 7,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )

                                  // Center(
                                  //   child: Text(
                                  //     '${_newProductByIdController.newModelid!.productModelApi!.packetSizemodel![index]!.qty.toString()}${_newProductByIdController.newModelid!.productModelApi!.packetSizemodel![index]!.pkt.toString()}',
                                  //
                                  //     style:
                                  //     TextStyle(
                                  //       overflow:
                                  //       TextOverflow
                                  //           .ellipsis,
                                  //       fontSize:
                                  //       10,
                                  //       color: Colors
                                  //           .white,
                                  //       fontWeight:
                                  //       FontWeight
                                  //           .bold,
                                  //     ),
                                  //   ),
                                  // ),
                                ),
                              ),
                            );
                          })),

                  ///button in row

                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.03, top: size.height * 0.01),
                    child: Text(
                      'Details:',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.03,
                        right: size.width * 0.03,
                        top: size.height * 0.001),
                    child: Container(
                      height: size.height * 0.3,
                      width: size.width,
                      // color: Colors.green,
                      child: Text(
                        _newProductByIdController.newModelid!
                            .productModelApi.productDescription
                            .toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 8,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),

                  ///extended data
                  Container(
                    // height: 1200,
                    // width: constraints.maxWidth,
                    width: size.width,
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
                                //itemCount: _aboutProductController.getabouttheproduct?.result?.length,
                                itemCount: 5,
                                itemBuilder:
                                    (BuildContext context, int indexx) {
                                  return Obx(
                                        () => (_aboutProductController
                                        .isLoading.value)
                                        ? Center(
                                        child:
                                        CircularProgressIndicator())
                                        : _aboutProductController
                                        .getabouttheproduct!
                                        .result!
                                        .isEmpty
                                        ? Center(
                                      child: Text('No data'),
                                    )
                                        : Column(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                          const EdgeInsets
                                              .all(15.0),
                                          child: PhysicalModel(
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                5),
                                            color: MyTheme
                                                .ThemeColors,
                                            elevation: 1,
                                            child: Container(
                                                height: 26.h,
                                                width:
                                                size.width *
                                                    0.5,
                                                decoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      5),
                                                  color: Colors
                                                      .white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors
                                                          .grey
                                                          .withOpacity(
                                                          1.0),
                                                      spreadRadius:
                                                      5,
                                                      blurRadius:
                                                      7,
                                                      //offset: Offset(0, 3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child:
                                                ClipRRect(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      5),
                                                  child: Image
                                                      .network(
                                                    base +
                                                        '${_aboutProductController.getabouttheproduct!.result![indexx].image.toString()}',
                                                    fit: BoxFit
                                                        .cover,
                                                  ),
                                                )),
                                          ),
                                        ),
                                        Container(
                                          // height: 200,
                                          // width: 200,
                                            child: Text(
                                              _aboutProductController
                                                  .getabouttheproduct!
                                                  .result![indexx]
                                                  .title
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight:
                                                FontWeight.w700,
                                                fontSize: 11.sp,
                                              ),
                                            )),
                                        SizedBox(
                                          height: 0.1.h,
                                        ),

                                        ///description
                                        Container(
                                          height: size.height *
                                              0.15,
                                          width:
                                          size.width * 0.5,
                                          child: Text(
                                            _aboutProductController
                                                .getabouttheproduct!
                                                .result![indexx]
                                                .description
                                                .toString(),
                                            overflow:
                                            TextOverflow
                                                .ellipsis,
                                            maxLines: 8,
                                            style: TextStyle(
                                              fontSize: 9.sp,
                                              color:
                                              Colors.black,
                                              fontWeight:
                                              FontWeight
                                                  .w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                })),
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
                                itemCount: 4,
                                // itemCount: _standOutController.getstandoutpoints?.result?.length,
                                itemBuilder:
                                    (BuildContext context, int indexx) {
                                  return Obx(
                                        () => (_standOutController
                                        .isLoading.value)
                                        ? Center(
                                        child:
                                        CircularProgressIndicator())
                                        : _standOutController
                                        .getstandoutpoints!
                                        .result!
                                        .isEmpty
                                        ? Center(
                                      child: Text('No data'),
                                    )

                                    //     ? Center(
                                    //   child: Text('No data'),
                                    // )
                                        : Column(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets
                                              .all(15.0),
                                          child: PhysicalModel(
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                5),
                                            color: MyTheme
                                                .ThemeColors,
                                            elevation: 1,
                                            child: Container(
                                                height: 26.h,
                                                width:
                                                size.width *
                                                    0.5,
                                                decoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      5),
                                                  color: Colors
                                                      .white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors
                                                          .grey
                                                          .withOpacity(
                                                          1.0),
                                                      spreadRadius:
                                                      5,
                                                      blurRadius:
                                                      7,
                                                      //offset: Offset(0, 3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child:
                                                ClipRRect(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      5),
                                                  child: Image
                                                      .network(
                                                    base +
                                                        '${_standOutController.getstandoutpoints!.result![indexx].image.toString()}',
                                                    fit: BoxFit
                                                        .cover,
                                                  ),
                                                )),
                                          ),
                                        ),
                                        Container(
                                          // height: 200,
                                          // width: 200,
                                            child: Text(
                                              _standOutController
                                                  .getstandoutpoints!
                                                  .result![indexx]
                                                  .title
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight:
                                                FontWeight.w700,
                                                fontSize: 11.sp,
                                              ),
                                            )),
                                        SizedBox(
                                          height: 0.1.h,
                                        ),

                                        ///description
                                        Container(
                                          height: size.height *
                                              0.15,
                                          width:
                                          size.width * 0.5,
                                          child: Text(
                                            _standOutController
                                                .getstandoutpoints!
                                                .result![indexx]
                                                .description
                                                .toString(),
                                            overflow:
                                            TextOverflow
                                                .ellipsis,
                                            maxLines: 8,
                                            style: TextStyle(
                                              fontSize: 9.sp,
                                              color:
                                              Colors.black,
                                              fontWeight:
                                              FontWeight
                                                  .w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                })),

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
                          // height: size.height * 0.325,
                            height: size.height * 0.425,
                            decoration: BoxDecoration(
//color: Colors.green
                              // color: Color(0xffE8F9FD)

                            ),
                            //null error

                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                // itemCount: _allTriedProductController.allProductModel?.result?.length,
                                itemBuilder:
                                    (BuildContext context, int indexx) {
                                  return Obx(
                                        () => (_allTriedProductController
                                        .isLoading.value)
                                        ? Center(
                                        child:
                                        CircularProgressIndicator())
                                        : _allTriedProductController
                                        .allProductModel!
                                        .result!
                                        .isEmpty
                                        ? Center(
                                      child: Text('No data'),
                                    )

                                    //     ? Center(
                                    //   child: Text('No data'),
                                    // )
                                        : Column(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets
                                              .all(15.0),
                                          child: PhysicalModel(
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                5),
                                            color: MyTheme
                                                .ThemeColors,
                                            elevation: 1,
                                            child: Container(
                                                height: 26.h,
                                                width:
                                                size.width *
                                                    0.5,
                                                decoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      5),
                                                  color: Colors
                                                      .white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors
                                                          .grey
                                                          .withOpacity(
                                                          1.0),
                                                      spreadRadius:
                                                      5,
                                                      blurRadius:
                                                      7,
                                                      //offset: Offset(0, 3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child:
                                                ClipRRect(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      5),
                                                  child: Image
                                                      .network(
                                                    base +
                                                        '${_allTriedProductController.allProductModel!.result![indexx].productImage.toString()}',
                                                    fit: BoxFit
                                                        .cover,
                                                  ),
                                                )),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(
                                              left:
                                              size.width *
                                                  0.04),
                                          child: Container(
                                              height:
                                              size.height *
                                                  0.02,
                                              width:
                                              size.width *
                                                  0.6,
                                              child:
                                              AutoSizeText(
                                                _allTriedProductController
                                                    .allProductModel!
                                                    .result![
                                                indexx]
                                                    .productName
                                                    .toString(),
                                                style:
                                                TextStyle(
                                                  color: Colors
                                                      .black,
                                                  fontWeight:
                                                  FontWeight
                                                      .w700,
                                                  fontSize:
                                                  11.sp,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  );
                                })),

                        SizedBox(
                          height: 20,
                        ),

                        ///add product.................
                        // Padding(
                        //   padding: const EdgeInsets.all(15.0),
                        //   child: Row(
                        //     children: [
                        //       InkWell(
                        //         onTap: () {
                        //           _newCartController.newAddToCartApi();
                        //           print('kjhgkdfg');
                        //           // controller.addtocartApi(
                        //           //     _flashProductByIdController
                        //           //         .flashproductbyid!
                        //           //         // .result![mainIndex]
                        //           //         .result![mainIndex]
                        //           //         .id);
                        //
                        //         },
                        //         child: Container(
                        //           margin: EdgeInsets.only(
                        //               right: MyTheme.defaultPading),
                        //           height: 50,
                        //           width: 50,
                        //           decoration: BoxDecoration(
                        //             color: AppColors.themecolors,
                        //
                        //             borderRadius:
                        //             BorderRadius.circular(20),
                        //             border: Border.all(
                        //               color: AppColors.themecolors,
                        //               //Colors.blueAccent,
                        //               // Color(int.parse(
                        //               //     Productss
                        //               //         .products[mainIndex]
                        //               //         .color
                        //               //         .toString())),
                        //             ),
                        //           ),
                        //           child: Padding(
                        //             padding:
                        //             const EdgeInsets.all(8.0),
                        //             child: Icon(
                        //               Icons.add_shopping_cart_sharp,
                        //               color: Colors.white,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         height: 50,
                        //         width: size.width * 0.7,
                        //         child: ElevatedButton(
                        //           onPressed: () {
                        //             _rozarPayController
                        //                 .openCheckout();
                        //
                        //             print('click');
                        //           },
                        //           style: ButtonStyle(
                        //               shape:
                        //               MaterialStateProperty.all(
                        //                 RoundedRectangleBorder(
                        //                   borderRadius:
                        //                   BorderRadius.circular(
                        //                       30),
                        //                 ),
                        //               ),
                        //               backgroundColor:
                        //               MaterialStateProperty.all(
                        //                   AppColors.themecolors
                        //                 // Color(
                        //                 //   int.parse(Colors.green).toString()
                        //                 //     // int.parse(Productss
                        //                 //     // .products[mainIndex]
                        //                 //     // .color
                        //                 //     // .toString())
                        //                 // ),
                        //               )),
                        //           child: Text(
                        //             'Buy Now'.toUpperCase(),
                        //             style: TextStyle(
                        //                 fontSize: 12,
                        //                 fontWeight: FontWeight.bold,
                        //                 color: Colors.white),
                        //           ),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          ///add product.................
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.06,
                right: size.width * 0.02,
                top: size.height * 0.8),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    CallLoader.loader();

                    //  -- final amount --//
                    var finalamnt = _newProductByIdController.qty.value *
                        _newProductByIdController
                            .newModelid!
                            .productModelApi
                            .packetSizemodel[_newProductByIdController
                            .selectedPrice.value]
                            .finalPrice;

                    _newProductByIdController.callAddtoCartApi(
                        _newProductByIdController
                            .newModelid!.productModelApi.id,
                        _newProductByIdController
                            .newModelid!
                            .productModelApi
                            .packetSizemodel[_newProductByIdController
                            .selectedPrice.value]
                            .pkt,
                        _newProductByIdController
                            .newModelid!
                            .productModelApi
                            .packetSizemodel[_newProductByIdController
                            .selectedPrice.value]
                            .qty,
                        _newProductByIdController.qty.value,
                        _newProductByIdController
                            .newModelid!
                            .productModelApi
                            .packetSizemodel[_newProductByIdController
                            .selectedPrice.value]
                            .price,
                        finalamnt);

                    print('kjhgkdfg');
                    // controller.addtocartApi(
                    //     _flashProductByIdController
                    //         .flashproductbyid!
                    //         // .result![mainIndex]
                    //         .result![mainIndex]
                    //         .id);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: MyTheme.defaultPading),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.themecolors,
                      borderRadius: BorderRadius.circular(20),
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
                      padding: const EdgeInsets.all(8.0),
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
                      _rozarPayController.openCheckout();

                      print('click');
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            AppColors.themecolors)),
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

          ///old code of add to cart
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: Row(
          //     children: [
          //       InkWell(
          //         onTap: () {
          //           controller.addtocartApi(
          //               _flashProductByIdController
          //                   .flashproductbyid!
          //                .result!.first.id.toString()
          //                   //.id.toString()
          //           );
          //
          //         },
          //         child: Container(
          //           margin: EdgeInsets.only(
          //               right: MyTheme.defaultPading),
          //           height: 50,
          //           width: 50,
          //           decoration: BoxDecoration(
          //             color: AppColors.themecolors,
          //
          //             borderRadius:
          //             BorderRadius.circular(20),
          //             border: Border.all(
          //               color: AppColors.themecolors,
          //               //Colors.blueAccent,
          //               // Color(int.parse(
          //               //     Productss
          //               //         .products[mainIndex]
          //               //         .color
          //               //         .toString())),
          //             ),
          //           ),
          //           child: Padding(
          //             padding:
          //             const EdgeInsets.all(8.0),
          //             child: Icon(
          //               Icons.add_shopping_cart_sharp,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         height: 50,
          //         width: size.width * 0.7,
          //         child: ElevatedButton(
          //           onPressed: () {
          //             _rozarPayController
          //                 .openCheckout();
          //
          //             print('click hello');
          //           },
          //           style: ButtonStyle(
          //               shape:
          //               MaterialStateProperty.all(
          //                 RoundedRectangleBorder(
          //                   borderRadius:
          //                   BorderRadius.circular(
          //                       30),
          //                 ),
          //               ),
          //               backgroundColor:
          //               MaterialStateProperty.all(
          //                   AppColors.themecolors
          //                 // Color(
          //                 //   int.parse(Colors.green).toString()
          //                 //     // int.parse(Productss
          //                 //     // .products[mainIndex]
          //                 //     // .color
          //                 //     // .toString())
          //                 // ),
          //               )),
          //           child: Text(
          //             'Buy Now'.toUpperCase(),
          //             style: TextStyle(
          //                 fontSize: 12,
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.white),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ])));
    // );
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
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: TextFormField(
                      controller: _controller.name,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Name"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 5.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: TextFormField(
                      controller: _controller.email,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Email"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 5.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: TextFormField(
                      controller: _controller.title,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Title"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 5.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      controller: _controller.description,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Description"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 5.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      controller: _controller.mobile,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Mobile Number"),
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
                      : Center(
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
