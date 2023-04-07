import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/sub_catagary_controllers/sub_cat_id_controllers.dart';
import 'package:gyros_app/models/all_product_model.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/view/home_page/drower/drower.dart';
import 'package:gyros_app/view/home_page/home_page_controller.dart';
import 'package:gyros_app/view/home_page/slider_crusial.dart';
import 'package:gyros_app/view/model_cart_practice/controllers/cart_controllersss.dart';
import 'package:gyros_app/view/model_cart_practice/widgets/cart_product2.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/flash_sale_product_by_id_controllers/flash_product_by_id_controller.dart';
import '../../../controllers/invoice_controller/invoice_controller.dart';
import '../../../controllers/new_detail_controller.dart';
import '../../model_cart_practice/widgets/gradient_button.dart';

class HomePagePractice extends StatelessWidget {
  HomePagePractice({Key? key}) : super(key: key);
  CartController controller = Get.put(CartController());
  NewController _newProductByIdController = Get.put(NewController());
  HomePageController _homePageController = Get.put(HomePageController());
  SubCatByIdController _subCatByIdController = Get.put(SubCatByIdController());
  FlashProductByIdController _flashProductByIdController =
      Get.put(FlashProductByIdController());
  InvoiceController _invoiceController = Get.put(InvoiceController());
  final cartController = Get.put(CartController());
  //RxBool isLoading = false.obs;
  ///here no need to put is loading value... if you are put in to the controller...
  var cartlistid = '';

  List<Result>? result;

  //Result? resultDetail;

  //CatagaryController _catagaryController = Get.find();
  final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();

  ///var base = 'https://voit.in/Images/';

  // final List<String> images = [
  //   'https://wallpaperaccess.com/full/2792340.jpg',
  //   'https://wallpaperaccess.com/full/2792350.jpg',
  //   'https://wallpaperaccess.com/full/2792347.jpg',
  //   'https://wallpaperaccess.com/full/2792432.jpg',
  //   'https://wallpaperaccess.com/full/2614545.jpg',
  //   'https://wallpaperaccess.com/full/2792584.jpg',
  //   'https://wallpaperaccess.com/full/2792583.jpg',
  //   'https://wallpaperaccess.com/full/2792492.jpg',
  // ];

  final List<String> images2 = [
    'https://img.icons8.com/external-bearicons-detailed-outline-bearicons/2x/external-All-miscellany-texts-and-badges-bearicons-detailed-outline-bearicons.png',
    'https://img.icons8.com/wired/2x/best-seller.png',
    'https://img.icons8.com/ios/2x/water-bottle.png',
    'https://img.icons8.com/dotty/2x/drop-of-blood.png',
    'https://img.icons8.com/external-sbts2018-lineal-color-sbts2018/2x/external-spices-cooking-sbts2018-lineal-color-sbts2018.png',
    'https://img.icons8.com/carbon-copy/344/honey.png',
    // 'https://img.icons8.com/external-bearicons-detailed-outline-bearicons/2x/external-All-miscellany-texts-and-badges-bearicons-detailed-outline-bearicons.png',
    'https://img.icons8.com/external-others-pike-picture/2x/external-Seeds-gardening-others-pike-picture-2.png',
    'https://img.icons8.com/carbon-copy/2x/pepitas.png',
    'https://img.icons8.com/ios/72/discount--v1.png',
    //'https://img.icons8.com/external-bearicons-detailed-outline-bearicons/2x/external-All-miscellany-texts-and-badges-bearicons-detailed-outline-bearicons.png',
    'https://img.icons8.com/external-kiranshastry-lineal-kiranshastry/2x/external-gift-box-ecommerce-kiranshastry-lineal-kiranshastry.png',
    'https://img.icons8.com/external-icongeek26-outline-icongeek26/2x/external-sweets-baking-and-bakery-icongeek26-outline-icongeek26.png',
    'https://img.icons8.com/external-icongeek26-outline-icongeek26/2x/external-Jaggery-pongal-icongeek26-outline-icongeek26.png',
  ];

  // final List<String> text1 = [
  //   'All',
  //   'Best deals',
  //   'Ghee',
  //   'Oil',
  //   'Spices',
  //   'Honey',
  //   'Pulses',
  //   'Sattu',
  //   'Combos',
  //   'Gift Boxes',
  //   'Sweet',
  //   'Jaggery',
  // ];
  // final List<String> image1 = [
  //   'lib/assets/asset/ghee3.jpeg',
  //   'lib/assets/asset/oil_1.jpeg',
  //   'lib/assets/asset/spices4.webp',
  //   'lib/assets/asset/honey3.jpeg',
  // ];

  final List<String> image2 = [
    'lib/assets/asset/ jagary3.jpeg',
    'lib/assets/asset/sattu2.jpeg',
    'lib/assets/asset/sweet4.jpeg',
    'lib/assets/asset/dal7.webp',
    'lib/assets/asset/ghee3.jpeg',
    'lib/assets/asset/oil_1.jpeg',
    'lib/assets/asset/spices4.webp',
    'lib/assets/asset/honey3.jpeg',
  ];

  final List<String> text2 = [
    'Ghee',
    'Oil',
    "Spices",
    'Honey',
  ];
  final List<String> text3 = [
    'Jaggery',
    "Sattu",
    'Sweet',
    'Pulse',
    'Ghee',
    'Oil',
    "Spices",
    'Honey',
  ];

  ///product List with api future builder................................

  // Future<List<Result>> getCategoryData() async {
  //   List<Result> list;
  //
  //   var url = 'https://api.gyros.farm/api/AdminApi/ProductList';
  //
  //   var res = await http.get(Uri.parse(url));
  //   if (res.statusCode == 200) {
  //     var data = json.decode(res.body);
  //     var rest = data["result"] as List;
  //     list = rest.map<Result>((json) => Result.fromJson(json)).toList();
  //     print("List Size&&&&&&&&&&&&&&&Rahul: ${list}");
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  //   return list;
  // }

  ///our offers api with future builder............................................

  // Future<List<ourOfferResult>> ourOfferData() async {
  //   List<ourOfferResult> list;
  //   var url = 'https://api.gyros.farm/api/AdminApi/PromotionImage';
  //   var res = await http.get(Uri.parse(url));
  //   if (res.statusCode == 200) {
  //     var data = json.decode(res.body);
  //     var rest = data["result"] as List;
  //     list = rest
  //         .map<ourOfferResult>((json) => ourOfferResult.fromJson(json))
  //         .toList();
  //     print("List Size&&&&&&&&&&&&&&&Rahul: ${list}");
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  //   return list;
  // }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _key = GlobalKey();
    Size size = MediaQuery.of(context).size;
    var base = 'https://api.gyros.farm/Images/';
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'lib/assets/asset/guser_logo.png', scale: 28,
          //'lib/assets/asset/guser_logo.png',
          // color: AppColors.themecolors,
          height: 10.h,
          width: 16.w,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: GestureDetector(
              onTap: (){
                Get.to(() => Cartproducts());
              },
              child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.shopping_cart,
                        size: size.height * 0.035,
                        color: Colors.green,
                      ),)
            ),

            // InkWell(
            //     onTap: () {
            //       ///Navigating coupan screen for test other wise cartproducts was navigate from here
            //       //Get.to(() => Coupan());
            //       //  Get.to(() => Wallet());
            //       Get.to(() => Cartproducts());
            //       //Get.to(() => ShopingBagsEmpty());
            //     },
            //     child: Padding(
            //       padding: EdgeInsets.all(6.0),
            //       child: Icon(
            //         Icons.shopping_cart,
            //         size: size.height * 0.035,
            //         color: Colors.green,
            //       ),
            //     )),
          ),

          ///here search page for your identification.......
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 3.w),
          //   child: InkWell(
          //     onTap: () {
          //       Get.to(() => SearchPage());
          //       //Get.to(() => ExploreView());
          //     },
          //     child: Icon(
          //       Icons.search,
          //       color: AppColors.themecolors,
          //     ),
          //   ),
          // ),
        ],
        // Text(
        //   'Gyrus',
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 16.sp,
        //   ),
        // ),
        leading: InkWell(
            onTap: () {
              _key.currentState!.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: AppColors.themecolors,
            )),
      ),
      drawer: MainDrawer(),
      body:
      Obx(
            () => (_homePageController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
                  child: Column(
                    children: [
                     // Text('${_invoiceController.getinvoicepoints!.result![0].discountPrice!.toDouble()}'),
                      Container(
                        height: size.height * 0.25,
                        width: double.infinity,
                        color: Colors.greenAccent,
                        child: MySlider(),
                      ),

                      /// TODO: here we heve catagary product.........
                      ///

                      // GridView.builder(
                      //     shrinkWrap: true,
                      //     physics: NeverScrollableScrollPhysics(),
                      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //         crossAxisCount: 4,
                      //         childAspectRatio: 5 / 2,
                      //         mainAxisExtent: size.height * 0.09,
                      //         crossAxisSpacing: 1,
                      //         mainAxisSpacing: 0),
                      //     itemCount:
                      //         _homePageController.getcatagartlist!.result!.length,
                      //     //items?.length,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return Obx(
                      //         () => (_homePageController.isLoading.value)
                      //             ? Center(child: CircularProgressIndicator())
                      //             : _homePageController.getcatagartlist!.result ==
                      //                     null
                      //                 ? Center(
                      //                     child: Text('No Data'),
                      //                   )
                      //                 : Padding(
                      //                     padding: EdgeInsets.symmetric(
                      //                         horizontal: size.width * 0.005,
                      //                         vertical: size.height * 0.002),
                      //                     child: InkWell(
                      //                       onTap: () {
                      //                         _subCatByIdController.catid =
                      //                             _homePageController
                      //                                 .getcatagartlist!
                      //                                 .result![index]
                      //                                 .id
                      //                                 .toString();
                      //                         _subCatByIdController.subcatidApi();
                      //                         // _homePageController.toggle(index);
                      //                         // if (index == 0) {
                      //                         //   Get.to(() => CatagaryListSubcatagary());
                      //                         //   //Get.to(() => BestSeller());
                      //                         //   //Get.to(() => WaterTracking());
                      //                         // } else if (index == 1) {
                      //                         //   Get.to(() => CatagaryListSubcatagary());
                      //                         // }
                      //                         // /*else if (index == 2) {
                      //                         //       Get.to(() => CowGhee());
                      //                         //       //Get.to(() => WalkTracking());
                      //                         //     } else if (index == 3) {
                      //                         //       Get.to(() => Oil());
                      //                         //     } else if (index == 4) {
                      //                         //       Get.to(() => Spices());
                      //                         //       //Get.to(() => WalkTracking());
                      //                         //     } else if (index == 5) {
                      //                         //       Get.to(() => Honey());
                      //                         //       //Get.to(() => WalkTracking());
                      //                         //     } else if (index == 6) {
                      //                         //       Get.to(() => Pulses());
                      //                         //       //Get.to(() => WalkTracking());
                      //                         //     } else if (index == 7) {
                      //                         //       Get.to(() => Sattu());
                      //                         //       //Get.to(() => WalkTracking());
                      //                         //     } else if (index == 8) {
                      //                         //       Get.to(() => CupponsPage());
                      //                         //     } else if (index == 9) {
                      //                         //       Get.to(() => GiftBox());
                      //                         //
                      //                         //       //Get.to(() => WalkTracking());
                      //                         //     } else if (index == 10) {
                      //                         //       Get.to(() => Sweets());
                      //                         //       //Get.to(() => BestSeller());
                      //                         //       //Get.to(() => WalkTracking());
                      //                         //     } else if (index == 11) {
                      //                         //       Get.to(() => Jeggary());
                      //                         //       //Get.to(() => WalkTracking());
                      //                         //     }*/
                      //                       },
                      //                       child: PhysicalModel(
                      //                         borderRadius:
                      //                             BorderRadius.circular(5),
                      //                         color: _homePageController
                      //                                     .selectedIndex.value ==
                      //                                 index
                      //                             ? MyTheme.containercolor7
                      //                             : MyTheme.containercolor7,
                      //
                      //                         //: Color(0xffeff8f5),
                      //                         elevation: 0.1,
                      //                         child: Container(
                      //                           height: 10.h,
                      //                           width: 20.w,
                      //                           decoration: BoxDecoration(
                      //                             borderRadius:
                      //                                 BorderRadius.circular(5),
                      //                             color: _homePageController
                      //                                         .selectedIndex
                      //                                         .value ==
                      //                                     index
                      //                                 ? Colors.white12
                      //                                 : Colors.white12,
                      //                           ),
                      //                           child: Column(
                      //                             mainAxisAlignment:
                      //                                 MainAxisAlignment.center,
                      //                             children: [
                      //                               Image.network(
                      //                                 base +
                      //                                     '${_homePageController.getcatagartlist!.result![index].imageName.toString()}',
                      //                                 fit: BoxFit.fill,
                      //                                 errorBuilder: (context,
                      //                                     error, stackTrace) {
                      //                                   //if image not comming in catagary then we have to purchase
                      //
                      //                                   return Icon(
                      //                                     Icons.error,
                      //                                     color: Colors.grey,
                      //                                   );
                      //                                 },
                      //
                      //                                 height: size.height * 0.056,
                      //                                 width: size.width * 0.15,
                      //                                 // color: _homePageController
                      //                                 //             .selectedIndex
                      //                                 //             .value ==
                      //                                 //         index
                      //                                 //     ? Colors.white
                      //                                 //     : MyTheme.ThemeColors
                      //                               ),
                      //                               Center(
                      //                                   child: SizedBox(
                      //                                 width: size.width * 0.25,
                      //                                 child: Center(
                      //                                   child: Text(
                      //                                     _homePageController
                      //                                         .getcatagartlist!
                      //                                         .result![index]
                      //                                         .categoryName
                      //                                         .toString(),
                      //                                     style: TextStyle(
                      //                                         fontWeight:
                      //                                             FontWeight.w700,
                      //                                         fontSize: 8.sp,
                      //                                         color: MyTheme
                      //                                             .ContainerUnSelectedColor
                      //                                         // _homePageController
                      //                                         //             .selectedIndex
                      //                                         //             .value ==
                      //                                         //         index
                      //                                         //     ? MyTheme.ThemeColors
                      //                                         //     : MyTheme.ThemeColors
                      //                                         ),
                      //                                   ),
                      //                                 ),
                      //                               )),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //       );
                      //     }),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: size.height * 0.034,
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
                            child: Text(
                              'Our Products',
                              style: TextStyle(
                                color: Colors.black,

                                //color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w700,
                                fontSize: 11.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ///demo rating
    //                 Container(
    //                   height: size.height * 0.295,
    //                   decoration: BoxDecoration(color: Color(0xffE8F9FD)),
    //                   child: ListView.builder(
    //                     scrollDirection: Axis.horizontal,
    //                     itemCount: 5,
    // itemBuilder: (BuildContext context, int index) {
    //                       return Obx(
    //                             () => (_homePageController.isLoading.value)
    //                             ? Center(child: CircularProgressIndicator())
    //                             :_homePageController.getflashsellproduct!.result.isEmpty
    //                             ? Center(
    //                           child: Text('No List'),
    //                         )
    //                         : Center(
    //                           child: Text('${_homePageController.getflashsellproduct!.result[index].rating.toString()}'),
    //                         ),
    //                       );
    // }
    //                   )
    //                 )
                      Container(
                          height: size.height * 0.295,
                          decoration: BoxDecoration(color: Color(0xffE8F9FD)),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _homePageController.getflashsellproduct?.result.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(
                                      () => (_homePageController.isLoading.value)
                                      ? Center(child: CircularProgressIndicator())
                                      :_homePageController.getflashsellproduct?.result == null
                                      ? Center(
                                    child: Text('No List'),
                                  )
                                          : Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: PhysicalModel(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: MyTheme.ThemeColors,
                                                elevation: 0.1,
                                                child: Container(
                                                  height: 26.h,
                                                  width: size.width * 0.5,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    color: Colors.white,
                                                    //Color(0xff876445)
                                                    // MyTheme.containercolor01,
                                                    //containercolor7,
                                                    //gradient: MyTheme.gradient12
                                                  ),
                                                  child: Column(
                                                    //mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Container(
                                                              height: 3.1.h,
                                                              width: 22.w,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Color(
                                                                          0xffDBC6EB),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft: Radius
                                                                            .circular(
                                                                                5),
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                20),
                                                                      )),
                                                              child: Center(
                                                                child: Text(
                                                                  //"Save:${_homePageController.getflashsellproduct!.result[index].discountPercentage.toDouble()}%",
                                                                   "Save:${_homePageController.getflashsellproduct!.result![index].discountPercentage.toString()}%",

                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        9.sp,
                                                                  ),
                                                                ),
                                                              ),

                                                              ///Todo___bestseller options............
                                                            ),
                                                          ),

                                                          // Container(
                                                          //     height: 3.1.h,
                                                          //     width: 18.w,
                                                          //     decoration:
                                                          //         BoxDecoration(
                                                          //
                                                          //             // color: Colors.black12,
                                                          //             borderRadius: BorderRadius.only(
                                                          //                 topLeft:
                                                          //                     Radius.circular(
                                                          //                         20),
                                                          //                 topRight:
                                                          //                     Radius.circular(
                                                          //                         20),
                                                          //                 bottomLeft:
                                                          //                     Radius.circular(
                                                          //                         20),
                                                          //                 bottomRight:
                                                          //                     Radius.circular(20))),
                                                          //     child: Row(
                                                          //       children: [
                                                          //         RichText(
                                                          //           text: TextSpan(
                                                          //               style: TextStyle(
                                                          //                 color: Colors
                                                          //                     .black,
                                                          //                 fontSize:
                                                          //                     10,
                                                          //               ),
                                                          //               children: <TextSpan>[
                                                          //                 TextSpan(
                                                          //                     text:
                                                          //                         'Rating',
                                                          //                     style:
                                                          //                         TextStyle(fontWeight: FontWeight.bold)),
                                                          //                 TextSpan(
                                                          //                     text:
                                                          //                     '0'
                                                          //
                                                          //                       //  '${_homePageController.getflashsellproduct!.result[index].rating.toDouble()}'
                                                          //                 ),
                                                          //               ]),
                                                          //         ),
                                                          //         Icon(
                                                          //           Icons.star,
                                                          //           color: Colors
                                                          //               .amber,
                                                          //           size: 12,
                                                          //         )
                                                          //       ],
                                                          //     )
                                                          //
                                                          //     )
                                                          ///Rating
                                                          Container(
                                                            height: size.height*0.03,
                                                            width: size.width*0.2,
                                                           // color: Colors.green,
                                                            child: Row(
                                                              children: [
                                                                Text('Rating' , style: TextStyle(fontSize: 10, color: Colors.black),),
                                                                Text('${_homePageController.getflashsellproduct!.result![index].rating!.toDouble()}',
                                                                  style: TextStyle(fontSize: 10,),
                                                                ),
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .amber,
                                                                  size: 12,
                                                                )
                                                              ],
                                                            )

                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 0.7.h,
                                                      ),
                                                      PhysicalModel(
                                                        //shadowColor: Colors.green,
                                                        color: Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5),
                                                        elevation: 7,

                                                        ///code go to next screen
                                                        child: InkWell(
                                                          onTap: () {
                                                            _newProductByIdController
                                                                    .productid =
                                                                _homePageController
                                                                    .getflashsellproduct!
                                                                    .result[
                                                                        index]
                                                                    .id
                                                                    .toString();
                                                            _newProductByIdController
                                                                .newproductbyIdApi();


                                                          },
                                                          child: Container(
                                                            height: size.height *
                                                                0.17,
                                                            width:
                                                                size.width * 0.36,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              // border: Border.all(
                                                              //     color: AppColors.themecolors),
                                                              // image: DecorationImage(
                                                              //     image: AssetImage(Productss
                                                              //         .products[index].imageUrl),
                                                              //     fit: BoxFit.cover),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      1.0),
                                                              child: CachedNetworkImage(
                                                                imageUrl: base + "${_homePageController.getflashsellproduct?.result![index].productImage.toString()}",fit: BoxFit.fitWidth,
                                                                placeholder: (context, url) => SizedBox(
                                                                    height: size.height *
                                                                        0.17,
                                                                    width:
                                                                    size.width * 0.36,
                                                                    //width: 4.w,
                                                                    child: Center(
                                                                      child: Image.asset("lib/assets/asset/zif_loading.gif",fit: BoxFit.fill,height: size.height*0.17,),
                                                                      //CircularProgressIndicator()
                                                                    )
                                                                ),
                                                                errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.red,),
                                                              ),
                                                              // FadeInImage.assetNetwork(
                                                              //   placeholder: 'lib/assets/asset/zif_loading.gif',fadeInCurve: Curves.linear,
                                                              //   image: base +'${_homePageController.getflashsellproduct?.result![index].productImage.toString()}',fit: BoxFit.fill,
                                                              // ),
                                                              ///
                                                              //     Image.network(
                                                              //   base +
                                                              //       '${_homePageController.getflashsellproduct?.result![index].productImage.toString()}',
                                                              //   fit: BoxFit.fill,
                                                              //   errorBuilder:
                                                              //       (context,
                                                              //           error,
                                                              //           stackTrace) {
                                                              //     //if image not comming in catagary then we have to purchase
                                                              //
                                                              //     return Icon(
                                                              //       Icons.error,
                                                              //       color: Colors
                                                              //           .grey,
                                                              //     );
                                                              //   },
                                                              //
                                                              //   height:
                                                              //       size.height *
                                                              //           0.04,
                                                              //   // color: _homePageController
                                                              //   //             .selectedIndex
                                                              //   //             .value ==
                                                              //   //         index
                                                              //   //     ? Colors.white
                                                              //   //     : MyTheme.ThemeColors
                                                              // ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.6.h,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                                horizontal:
                                                                    size.width *
                                                                        0.01),
                                                        child: Row(
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  width:
                                                                      size.width * 0.23,
                                                                  height:
                                                                      size.height *
                                                                          0.045,
                                                                  child: Text(
                                                                    _homePageController
                                                                        .getflashsellproduct!
                                                                        .result![
                                                                            index]
                                                                        .productName
                                                                        .toString(),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 3,
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          7.sp,
                                                                      color: Colors
                                                                          .green,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      '₹${_homePageController.getflashsellproduct!.result![index].finalPrice}'
                                                                      " ",
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        fontSize:
                                                                            8.sp,
                                                                        color: Colors
                                                                            .red,
                                                                        //.ContainerUnSelectedColor,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      ' ₹${_homePageController.getflashsellproduct!.result![index].price}',
                                                                      style:
                                                                          TextStyle(
                                                                        decoration: TextDecoration.lineThrough,

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
                                                                            8.sp,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade600,

                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    SizedBox(
                                                                      height: size
                                                                              .height *
                                                                          0.03,
                                                                      width: size
                                                                              .width *
                                                                          0.24,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          '${_homePageController.getflashsellproduct!.result![index].qty1}' +
                                                                              '${_homePageController.getflashsellproduct!.result![index].pkt1}',
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                7.sp,
                                                                            color:
                                                                                Colors.black,
                                                                            // .grey
                                                                            // .shade100,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    // SizedBox(
                                                                    //   height: size
                                                                    //           .height *
                                                                    //       0.023,
                                                                    // ),
                                                                    // SizedBox(
                                                                    //   width: size
                                                                    //           .width *
                                                                    //       0.22,
                                                                    //   height: size
                                                                    //           .height *
                                                                    //       0.015,
                                                                    //   child:
                                                                    //       Text(
                                                                    //     '${_homePageController.getflashsellproduct!.result![index].pkt1}',
                                                                    //     style:
                                                                    //         TextStyle(
                                                                    //       fontWeight:
                                                                    //           FontWeight.w500,
                                                                    //       fontSize:
                                                                    //           8.sp,
                                                                    //       color:
                                                                    //           Colors.blueGrey,
                                                                    //       // .grey
                                                                    //       // .shade100,
                                                                    //     ),
                                                                    //   ),
                                                                    // ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height:
                                                                      size.height *
                                                                          0.033,
                                                                  width: 23.w,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                20),
                                                                  ),
                                                                  child: InkWell(
                                                                    ///TODO: here we have to change the code add to cart..............prince
                                                                    onTap: () {
                                                                      ///this is the thing to thing to you that how can you add the item to add to cart api send by the help of id
                                                                      controller.addtocartApi(_homePageController
                                                                          .getflashsellproduct!
                                                                          .result![
                                                                              index]
                                                                          .id);

                                                                      ///
                                                                    },
                                                                    child:
                                                                        RaisedGradientButton(
                                                                      //height: 3.3.h,
                                                                      //width: 23.9.w,
                                                                      child: Text(
                                                                        'Add To Cart',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontWeight: FontWeight
                                                                                .w800,
                                                                            fontSize:
                                                                                8.sp),
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
                                                                      onPressed:
                                                                          () {
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

                                                      ///todo.new.................design........
                                                      // Padding(
                                                      //   padding:
                                                      //       EdgeInsets.symmetric(
                                                      //           horizontal: 0.w),
                                                      //   child: Row(
                                                      //     mainAxisAlignment:
                                                      //         MainAxisAlignment
                                                      //             .end,
                                                      //     children: [
                                                      //       SizedBox(
                                                      //         width: size.width *
                                                      //             0.26,
                                                      //         child: Row(
                                                      //           children: [
                                                      //             Text(
                                                      //               '${_homePageController.getflashsellproduct!.result![index].weight1}',
                                                      //               style:
                                                      //                   TextStyle(
                                                      //                 fontWeight:
                                                      //                     FontWeight
                                                      //                         .w500,
                                                      //                 fontSize:
                                                      //                     9.sp,
                                                      //                 color: Colors
                                                      //                     .black,
                                                      //                 // .grey
                                                      //                 // .shade100,
                                                      //               ),
                                                      //             ),
                                                      //             SizedBox(
                                                      //               width:
                                                      //                   size.width *
                                                      //                       0.2,
                                                      //               height:
                                                      //                   size.height *
                                                      //                       0.015,
                                                      //               child: Text(
                                                      //                 '${_homePageController.getflashsellproduct!.result![index].pkt1}',
                                                      //                 style:
                                                      //                     TextStyle(
                                                      //                   fontWeight:
                                                      //                       FontWeight
                                                      //                           .w500,
                                                      //                   fontSize:
                                                      //                       9.sp,
                                                      //                   color: Colors
                                                      //                       .blueGrey,
                                                      //                   // .grey
                                                      //                   // .shade100,
                                                      //                 ),
                                                      //               ),
                                                      //             ),
                                                      //           ],
                                                      //         ),
                                                      //       ),
                                                      //       // SizedBox(
                                                      //       //   width: size.width *
                                                      //       //       0.2,
                                                      //       //   child: Text(
                                                      //       //     "Save:${_homePageController.getflashsellproduct!.result![index].discountPercentage.toString()}%",
                                                      //       //     style: TextStyle(
                                                      //       //       overflow:
                                                      //       //           TextOverflow
                                                      //       //               .ellipsis,
                                                      //       //       fontWeight:
                                                      //       //           FontWeight
                                                      //       //               .w500,
                                                      //       //       fontSize: 9.sp,
                                                      //       //       color: Colors
                                                      //       //           .green
                                                      //       //           .shade900,
                                                      //       //     ),
                                                      //       //   ),
                                                      //       // ),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                      // SizedBox(
                                                      //   height:
                                                      //       size.height * 0.001,
                                                      // ),
                                                      // Padding(
                                                      //   padding:
                                                      //       EdgeInsets.symmetric(
                                                      //           horizontal:
                                                      //               1.7.w),
                                                      //   child: Row(
                                                      //     children: [
                                                      //       SizedBox(
                                                      //         width: 23.w,
                                                      //         child: Column(
                                                      //           mainAxisAlignment:
                                                      //               MainAxisAlignment
                                                      //                   .spaceBetween,
                                                      //           crossAxisAlignment:
                                                      //               CrossAxisAlignment
                                                      //                   .start,
                                                      //           children: [
                                                      //             Padding(
                                                      //               padding: EdgeInsets
                                                      //                   .only(
                                                      //                       top: 0.0
                                                      //                           .h),
                                                      //               child:
                                                      //                   SizedBox(
                                                      //                 width: size
                                                      //                         .width *
                                                      //                     0.23,
                                                      //                 height: size
                                                      //                         .height *
                                                      //                     0.029,
                                                      //                 child: Text(
                                                      //                   _homePageController
                                                      //                       .getflashsellproduct!
                                                      //                       .result![
                                                      //                           index]
                                                      //                       .productName
                                                      //                       .toString(),
                                                      //                   overflow:
                                                      //                       TextOverflow
                                                      //                           .ellipsis,
                                                      //                   maxLines:
                                                      //                       2,
                                                      //                   style:
                                                      //                       TextStyle(
                                                      //                     fontWeight:
                                                      //                         FontWeight.w700,
                                                      //                     fontSize:
                                                      //                         8.sp,
                                                      //                     color: Colors
                                                      //                         .green,
                                                      //                   ),
                                                      //                 ),
                                                      //               ),
                                                      //             ),
                                                      //             Row(
                                                      //               children: [
                                                      //                 Text(
                                                      //                   '₹${_homePageController.getflashsellproduct!.result![index].finalPrice}'
                                                      //                   " ",
                                                      //                   style:
                                                      //                       TextStyle(
                                                      //                     fontWeight:
                                                      //                         FontWeight.w700,
                                                      //                     fontSize:
                                                      //                         8.sp,
                                                      //                     color: Colors
                                                      //                         .red,
                                                      //                     //.ContainerUnSelectedColor,
                                                      //                   ),
                                                      //                 ),
                                                      //                 Text(
                                                      //                   ' ₹${_homePageController.getflashsellproduct!.result![index].price}',
                                                      //                   style:
                                                      //                       TextStyle(
                                                      //                     decoration:
                                                      //                         TextDecoration.lineThrough,
                                                      //                     // decorationStyle:
                                                      //                     //     TextDecorationStyle.wavy,
                                                      //                     decorationColor: Colors
                                                      //                         .indigo
                                                      //                         .shade900,
                                                      //                     decorationThickness:
                                                      //                         2.85,
                                                      //                     fontWeight:
                                                      //                         FontWeight.w600,
                                                      //                     fontSize:
                                                      //                         8.sp,
                                                      //                     color: Colors
                                                      //                         .grey
                                                      //                         .shade600,
                                                      //                     // MyTheme
                                                      //                     //     .containercolor10,
                                                      //                     //.ContainerUnSelectedColor,
                                                      //                   ),
                                                      //                 ),
                                                      //               ],
                                                      //             ),
                                                      //           ],
                                                      //         ),
                                                      //       ),
                                                      //
                                                      //       Spacer(),
                                                      //       Container(
                                                      //         height:
                                                      //             size.height *
                                                      //                 0.033,
                                                      //         width: 23.w,
                                                      //         decoration:
                                                      //             BoxDecoration(
                                                      //           borderRadius:
                                                      //               BorderRadius
                                                      //                   .circular(
                                                      //                       20),
                                                      //         ),
                                                      //         child: InkWell(
                                                      //           ///TODO: here we have to change the code add to cart..............prince
                                                      //           onTap: () {
                                                      //             ///this is the thing to thing to you that how can you add the item to add to cart api send by the help of id
                                                      //             controller.addtocartApi(
                                                      //                 _homePageController
                                                      //                     .getflashsellproduct!
                                                      //                     .result![
                                                      //                         index]
                                                      //                     .id);
                                                      //
                                                      //             ///
                                                      //           },
                                                      //           child:
                                                      //               RaisedGradientButton(
                                                      //             //height: 3.3.h,
                                                      //             //width: 23.9.w,
                                                      //             child: Text(
                                                      //               'Add To Cart',
                                                      //               style: TextStyle(
                                                      //                   color: Colors
                                                      //                       .black,
                                                      //                   fontWeight:
                                                      //                       FontWeight
                                                      //                           .w800,
                                                      //                   fontSize:
                                                      //                       8.sp),
                                                      //             ),
                                                      //             gradient:
                                                      //                 LinearGradient(
                                                      //               colors: <
                                                      //                   Color>[
                                                      //                 Color(
                                                      //                     0xff3a923b),
                                                      //                 Color(
                                                      //                     0xffb5d047),
                                                      //               ],
                                                      //             ),
                                                      //             onPressed: () {
                                                      //               // cartController.addProduct(
                                                      //               //     Productss
                                                      //               //         .products[index]);
                                                      //               // controller.addtocartApi(_homePageController
                                                      //               //     .getflashsellproduct!
                                                      //               //     .result![
                                                      //               //         index]
                                                      //               //     .id);
                                                      //               print(
                                                      //                   'Add To cart');
                                                      //             },
                                                      //           ),
                                                      //         ),
                                                      //       ),
                                                      //
                                                      //       // InkWell(
                                                      //       //   onTap: () {
                                                      //       //     cartController.addProduct(Productss.products[index]);
                                                      //       //   },
                                                      //       //   child: Container(
                                                      //       //     height: 3.3.h,
                                                      //       //     width: 23.9.w,
                                                      //       //     decoration: BoxDecoration(
                                                      //       //         //color: MyTheme.loginbuttonColor,
                                                      //       //         gradient: MyTheme.gradient4,
                                                      //       //         borderRadius: BorderRadius.only(
                                                      //       //           bottomRight: Radius.circular(5),
                                                      //       //           bottomLeft: Radius.circular(5),
                                                      //       //         )),
                                                      //       //     child: Center(
                                                      //       //       child: Text(
                                                      //       //         'Add To Cart',
                                                      //       //         style: TextStyle(
                                                      //       //           color: Colors.white,
                                                      //       //           fontWeight: FontWeight.w500,
                                                      //       //           fontSize: 8.sp,
                                                      //       //         ),
                                                      //       //       ),
                                                      //       //     ),
                                                      //       //   ),
                                                      //       // ),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
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
                          height: size.height * 0.034,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: MyTheme.containergradient,
                          ),
                          //color: MyTheme.loginPageBoxColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 0.4.h),
                            child: Text(
                              'Purchase your first product',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 11.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: size.height * 0.19,
                          color: Color(0xffE8F9FD),
                          //width: double.infinity,
                          child: ListView.builder(
                              //physics: NeverScrollableScrollPhysics(),
                              itemCount: _homePageController
                                  .getfirstorderbanner!.result.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(
                                  () => (_homePageController.isLoading.value)
                                      ? Center(child: CircularProgressIndicator())
                                      : _homePageController
                                                  .getfirstorderbanner!.result ==
                                              null
                                          ? Center(
                                              child: Text('No List'),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                // _homePageController.toggle(index);
                                                if (index == 0) {
                                                  //Get.to(() => ManPage());
                                                  //Get.to(() => BestSeller());
                                                  //Get.to(() => WaterTracking());
                                                }
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: PhysicalModel(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: _homePageController
                                                              .selectedIndex
                                                              .value ==
                                                          index
                                                      ? MyTheme.ThemeColors
                                                      : Color(0xffeff8f5),
                                                  elevation: 0.1,
                                                  child: Container(
                                                    height: 23.h,
                                                    width: 100
                                                        .w, //size.width * 0.99,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: MyTheme
                                                          .ContainerUnSelectedColor,
                                                      // image: DecorationImage(
                                                      //   image: NetworkImage(
                                                      //     base +
                                                      //         '${_homePageController.getfirstorderbanner!.result[index].imagePath}',
                                                      //   ),
                                                      //   fit: BoxFit.fill,
                                                      // ),
                                                    ),
                                                    child:  CachedNetworkImage(
                                                      imageUrl: base + "${_homePageController.getfirstorderbanner!.result[index].imagePath.toString()}",fit: BoxFit.fill,
                                                      placeholder: (context, url) => SizedBox(
                                                          height: 23.h,
                                                          width: 100
                                                              .w,
                                                          //width: 4.w,
                                                          child: Center(
                                                            child: Image.asset("lib/assets/asset/zif_loading6.gif",fit: BoxFit.fill,height: size.height*0.17,),
                                                            //CircularProgressIndicator()
                                                          )
                                                      ),
                                                      errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.red,),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                );
                              })),
                      SizedBox(
                        height: 0.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: size.height * 0.034,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: MyTheme.containergradient,
                            //gradient: MyTheme.gradient2,
                          ),
                          //color: MyTheme.loginPageBoxColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 0.4.h),
                            child: Text(
                              'Flash Sale',
                              style: TextStyle(
                                color: Colors.black,

                                //color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w700,
                                fontSize: 11.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: size.height * 0.295,
                          decoration: BoxDecoration(color: Color(0xffE8F9FD)),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _homePageController
                                  .getflashsellproduct!.result!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(
                                      () => (_homePageController.isLoading.value)
                                      ? Center(child: CircularProgressIndicator())
                                      :_homePageController.getflashsellproduct!.result.isEmpty
                                      ? Center(
                                    child: Text('No List'),
                                  )
                                          : Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: PhysicalModel(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: MyTheme.ThemeColors,
                                                elevation: 0.1,
                                                child: Container(
                                                  height: 26.h,
                                                  width: size.width * 0.5,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    color: Colors.white,
                                                    //Color(0xff876445)
                                                    // MyTheme.containercolor01,
                                                    //containercolor7,
                                                    //gradient: MyTheme.gradient12
                                                  ),
                                                  child: Column(
                                                    //mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Container(
                                                              height: 3.1.h,
                                                              width: 22.w,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Color(
                                                                          0xffDBC6EB),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft: Radius
                                                                            .circular(
                                                                                5),
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                20),
                                                                      )),
                                                              child: Center(
                                                                child: Text(
                                                                  "Save:${_homePageController.getflashsellproduct!.result![index].discountPercentage.toString()}%",
                                                                  // _homePageController
                                                                  //     .getflashsellproduct!
                                                                  //     .result![
                                                                  //         index]
                                                                  //     .sellerOption
                                                                  //     .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        9.sp,
                                                                  ),
                                                                ),
                                                              ),

                                                              ///Todo___bestseller options............
                                                            ),
                                                          ),
                                                          ////////rating code
                                                          // borderRadius:  BorderRadius.only(
                                                          //   // topRight: Radius.circular(5),
                                                          //   // bottomLeft: Radius.circular(20),
                                                          //     topLeft: Radius.circular(20),
                                                          //     topRight: Radius.circular(20),
                                                          //     bottomLeft: Radius.circular(20),
                                                          //     bottomRight: Radius.circular(20)
                                                          // ),
                                                          // color: Colors.white38,
                                                          //
                                                          // elevation: 0,
                                                          Container(
                                                              height: 3.1.h,
                                                              width: 18.w,
                                                              decoration:
                                                                  BoxDecoration(

                                                                      // color: Colors.black12,
                                                                      borderRadius: BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(
                                                                                  20),
                                                                          topRight:
                                                                              Radius.circular(
                                                                                  20),
                                                                          bottomLeft:
                                                                              Radius.circular(
                                                                                  20),
                                                                          bottomRight:
                                                                              Radius.circular(20))),
                                                              child: Row(
                                                                children: [
                                                                  Text('Rating' , style: TextStyle(fontSize: 10, color: Colors.black),),
                                                                  Text('${_homePageController.getflashsellproduct!.result![index].rating!.toDouble()}',
                                                                    style: TextStyle(fontSize: 10,),
                                                                  ),
                                                                  Icon(
                                                                    Icons.star,
                                                                    color: Colors
                                                                        .amber,
                                                                    size: 12,
                                                                  )
                                                                ],
                                                              )
                                                              //          Row(
                                                              //            mainAxisAlignment: MainAxisAlignment.center,
                                                              //            children: <Widget>[
                                                              //              SizedBox(width: 10,),
                                                              // Text('Rating',
                                                              //   style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                                                              //              SizedBox(width: 5,),
                                                              //              Text('3.5' , style: TextStyle(fontSize: 10,  )),
                                                              //              Icon(Icons.star ,
                                                              //                size: 12,
                                                              //                  color: Colors.amber,
                                                              //              )
                                                              //
                                                              //
                                                              //            ],
                                                              //          ),
                                                              )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 0.7.h,
                                                      ),
                                                      PhysicalModel(
                                                        //shadowColor: Colors.green,
                                                        color: Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5),
                                                        elevation: 7,

                                                        ///code go to next screen
                                                        child: InkWell(
                                                          onTap: () {
                                                            _newProductByIdController.productid =
                                                                _homePageController.getflashsellproduct!.result![index].id.toString();
                                                            _newProductByIdController.newproductbyIdApi();

                                                            // _flashProductByIdController
                                                            //         .productid =
                                                            //     _homePageController
                                                            //         .getflashsellproduct!
                                                            //         .result![
                                                            //             index]
                                                            //         .id
                                                            //         .toString();
                                                            // _flashProductByIdController
                                                            //     .flashproductbyIdApi();

                                                            // Navigator.of(context).push(_createRoute());
                                                            //
                                                            // Get.to(
                                                            //   () => ItemDetailss(
                                                            //     // name: Productss
                                                            //     //     .products[index].name,
                                                            //     // price: Productss
                                                            //     //     .products[index].price,
                                                            //     // weight: Productss
                                                            //     //     .products[index].weight,
                                                            //     // imageUrl: Productss
                                                            //     //     .products[index].imageUrl,
                                                            //     // description: Productss
                                                            //     //     .products[index].descriptions,
                                                            //     // color: Productss
                                                            //     //     .products[index].color,
                                                            //     // id: Productss.products[index].id,
                                                            //     //
                                                            //     index: index,
                                                            //
                                                            //     //cartController.products[index].toString(),
                                                            //
                                                            //     // product:pr,
                                                            //   ), //next page class
                                                            //   duration: Duration(
                                                            //       milliseconds:
                                                            //           500), //duration of transitions, default 1 sec
                                                            //   transition:
                                                            //       // Transition.leftToRight //transition effect
                                                            //       // Transition.fadeIn
                                                            //       //Transition.size
                                                            //       Transition.zoom,
                                                            // );
                                                          },
                                                          child: Container(
                                                            height: size.height *
                                                                0.17,
                                                            width:
                                                                size.width * 0.36,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              // border: Border.all(
                                                              //     color: AppColors.themecolors),
                                                              // image: DecorationImage(
                                                              //     image: AssetImage(Productss
                                                              //         .products[index].imageUrl),
                                                              //     fit: BoxFit.cover),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      1.0),
                                                              child:
                                                              CachedNetworkImage(
                                                                imageUrl: base + "${_homePageController.getflashsellproduct?.result![index].productImage.toString()}",fit: BoxFit.fitWidth,
                                                                placeholder: (context, url) => SizedBox(
                                                                    height: size.height *
                                                                        0.17,
                                                                    width:
                                                                    size.width * 0.36,
                                                                    //width: 4.w,
                                                                    child: Center(
                                                                      child: Image.asset("lib/assets/asset/zif_loading.gif",fit: BoxFit.fill,height: size.height*0.17,),
                                                                      //CircularProgressIndicator()
                                                                    )
                                                                ),
                                                                errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.red,),
                                                              ),
                                                              // FadeInImage.assetNetwork(
                                                              //   placeholder: 'lib/assets/asset/zif_loading.gif',fadeInCurve: Curves.linear,
                                                              //   image: base +'${_homePageController.getflashsellproduct?.result![index].productImage.toString()}',fit: BoxFit.fill,
                                                              // ),
                                                              ///
                                                              //     Image.network(
                                                              //   base +
                                                              //       '${_homePageController.getflashsellproduct!.result![index].productImage.toString()}',
                                                              //   fit: BoxFit.fill,
                                                              //   errorBuilder:
                                                              //       (context,
                                                              //           error,
                                                              //           stackTrace) {
                                                              //     //if image not comming in catagary then we have to purchase
                                                              //
                                                              //     return Icon(
                                                              //       Icons.error,
                                                              //       color: Colors
                                                              //           .grey,
                                                              //     );
                                                              //   },
                                                              //
                                                              //   height:
                                                              //       size.height *
                                                              //           0.04,
                                                              //   // color: _homePageController
                                                              //   //             .selectedIndex
                                                              //   //             .value ==
                                                              //   //         index
                                                              //   //     ? Colors.white
                                                              //   //     : MyTheme.ThemeColors
                                                              // ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.6.h,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                                horizontal:
                                                                    size.width *
                                                                        0.01),
                                                        child: Row(
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  width:
                                                                      size.width *
                                                                          0.23,
                                                                  height:
                                                                      size.height *
                                                                          0.045,
                                                                  child: Text(
                                                                    _homePageController
                                                                        .getflashsellproduct!
                                                                        .result![
                                                                            index]
                                                                        .productName
                                                                        .toString(),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 3,
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          7.sp,
                                                                      color: Colors
                                                                          .green,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      '₹${_homePageController.getflashsellproduct!.result![index].finalPrice}'
                                                                      " ",
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        fontSize:
                                                                            8.sp,
                                                                        color: Colors
                                                                            .red,
                                                                        //.ContainerUnSelectedColor,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      ' ₹${_homePageController.getflashsellproduct!.result![index].price}',
                                                                      style:
                                                                          TextStyle(
                                                                        decoration:
                                                                            TextDecoration
                                                                                .lineThrough,
                                                                        // decorationColor: Colors.red,
                                                                        // decorationThickness: 0.5,
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
                                                                            8.sp,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade600,
                                                                        // MyTheme
                                                                        //     .containercolor10,
                                                                        //.ContainerUnSelectedColor,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    SizedBox(
                                                                      height: size
                                                                              .height *
                                                                          0.03,
                                                                      width: size
                                                                              .width *
                                                                          0.24,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          '${_homePageController.getflashsellproduct!.result![index].weight1}' +
                                                                              '${_homePageController.getflashsellproduct!.result![index].pkt1}',
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                7.sp,
                                                                            color:
                                                                                Colors.black,
                                                                            // .grey
                                                                            // .shade100,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    // SizedBox(
                                                                    //   height: size
                                                                    //           .height *
                                                                    //       0.023,
                                                                    // ),
                                                                    // SizedBox(
                                                                    //   width: size
                                                                    //           .width *
                                                                    //       0.22,
                                                                    //   height: size
                                                                    //           .height *
                                                                    //       0.015,
                                                                    //   child:
                                                                    //       Text(
                                                                    //     '${_homePageController.getflashsellproduct!.result![index].pkt1}',
                                                                    //     style:
                                                                    //         TextStyle(
                                                                    //       fontWeight:
                                                                    //           FontWeight.w500,
                                                                    //       fontSize:
                                                                    //           8.sp,
                                                                    //       color:
                                                                    //           Colors.blueGrey,
                                                                    //       // .grey
                                                                    //       // .shade100,
                                                                    //     ),
                                                                    //   ),
                                                                    // ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height:
                                                                      size.height *
                                                                          0.033,
                                                                  width: 23.w,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                20),
                                                                  ),
                                                                  child: InkWell(
                                                                    ///TODO: here we have to change the code add to cart..............prince
                                                                    onTap: () {
                                                                      ///this is the thing to thing to you that how can you add the item to add to cart api send by the help of id
                                                                      controller.addtocartApi(_homePageController
                                                                          .getflashsellproduct!
                                                                          .result![
                                                                              index]
                                                                          .id);

                                                                      ///
                                                                    },
                                                                    child:
                                                                        RaisedGradientButton(
                                                                      //height: 3.3.h,
                                                                      //width: 23.9.w,
                                                                      child: Text(
                                                                        'Add To Cart',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontWeight: FontWeight
                                                                                .w800,
                                                                            fontSize:
                                                                                8.sp),
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
                                                                      onPressed:
                                                                          () {
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

                                                      ///todo.new.................design........
                                                      // Padding(
                                                      //   padding:
                                                      //       EdgeInsets.symmetric(
                                                      //           horizontal: 0.w),
                                                      //   child: Row(
                                                      //     mainAxisAlignment:
                                                      //         MainAxisAlignment
                                                      //             .end,
                                                      //     children: [
                                                      //       SizedBox(
                                                      //         width: size.width *
                                                      //             0.26,
                                                      //         child: Row(
                                                      //           children: [
                                                      //             Text(
                                                      //               '${_homePageController.getflashsellproduct!.result![index].weight1}',
                                                      //               style:
                                                      //                   TextStyle(
                                                      //                 fontWeight:
                                                      //                     FontWeight
                                                      //                         .w500,
                                                      //                 fontSize:
                                                      //                     9.sp,
                                                      //                 color: Colors
                                                      //                     .black,
                                                      //                 // .grey
                                                      //                 // .shade100,
                                                      //               ),
                                                      //             ),
                                                      //             SizedBox(
                                                      //               width:
                                                      //                   size.width *
                                                      //                       0.2,
                                                      //               height:
                                                      //                   size.height *
                                                      //                       0.015,
                                                      //               child: Text(
                                                      //                 '${_homePageController.getflashsellproduct!.result![index].pkt1}',
                                                      //                 style:
                                                      //                     TextStyle(
                                                      //                   fontWeight:
                                                      //                       FontWeight
                                                      //                           .w500,
                                                      //                   fontSize:
                                                      //                       9.sp,
                                                      //                   color: Colors
                                                      //                       .blueGrey,
                                                      //                   // .grey
                                                      //                   // .shade100,
                                                      //                 ),
                                                      //               ),
                                                      //             ),
                                                      //           ],
                                                      //         ),
                                                      //       ),
                                                      //       // SizedBox(
                                                      //       //   width: size.width *
                                                      //       //       0.2,
                                                      //       //   child: Text(
                                                      //       //     "Save:${_homePageController.getflashsellproduct!.result![index].discountPercentage.toString()}%",
                                                      //       //     style: TextStyle(
                                                      //       //       overflow:
                                                      //       //           TextOverflow
                                                      //       //               .ellipsis,
                                                      //       //       fontWeight:
                                                      //       //           FontWeight
                                                      //       //               .w500,
                                                      //       //       fontSize: 9.sp,
                                                      //       //       color: Colors
                                                      //       //           .green
                                                      //       //           .shade900,
                                                      //       //     ),
                                                      //       //   ),
                                                      //       // ),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                      // SizedBox(
                                                      //   height:
                                                      //       size.height * 0.001,
                                                      // ),
                                                      // Padding(
                                                      //   padding:
                                                      //       EdgeInsets.symmetric(
                                                      //           horizontal:
                                                      //               1.7.w),
                                                      //   child: Row(
                                                      //     children: [
                                                      //       SizedBox(
                                                      //         width: 23.w,
                                                      //         child: Column(
                                                      //           mainAxisAlignment:
                                                      //               MainAxisAlignment
                                                      //                   .spaceBetween,
                                                      //           crossAxisAlignment:
                                                      //               CrossAxisAlignment
                                                      //                   .start,
                                                      //           children: [
                                                      //             Padding(
                                                      //               padding: EdgeInsets
                                                      //                   .only(
                                                      //                       top: 0.0
                                                      //                           .h),
                                                      //               child:
                                                      //                   SizedBox(
                                                      //                 width: size
                                                      //                         .width *
                                                      //                     0.23,
                                                      //                 height: size
                                                      //                         .height *
                                                      //                     0.029,
                                                      //                 child: Text(
                                                      //                   _homePageController
                                                      //                       .getflashsellproduct!
                                                      //                       .result![
                                                      //                           index]
                                                      //                       .productName
                                                      //                       .toString(),
                                                      //                   overflow:
                                                      //                       TextOverflow
                                                      //                           .ellipsis,
                                                      //                   maxLines:
                                                      //                       2,
                                                      //                   style:
                                                      //                       TextStyle(
                                                      //                     fontWeight:
                                                      //                         FontWeight.w700,
                                                      //                     fontSize:
                                                      //                         8.sp,
                                                      //                     color: Colors
                                                      //                         .green,
                                                      //                   ),
                                                      //                 ),
                                                      //               ),
                                                      //             ),
                                                      //             Row(
                                                      //               children: [
                                                      //                 Text(
                                                      //                   '₹${_homePageController.getflashsellproduct!.result![index].finalPrice}'
                                                      //                   " ",
                                                      //                   style:
                                                      //                       TextStyle(
                                                      //                     fontWeight:
                                                      //                         FontWeight.w700,
                                                      //                     fontSize:
                                                      //                         8.sp,
                                                      //                     color: Colors
                                                      //                         .red,
                                                      //                     //.ContainerUnSelectedColor,
                                                      //                   ),
                                                      //                 ),
                                                      //                 Text(
                                                      //                   ' ₹${_homePageController.getflashsellproduct!.result![index].price}',
                                                      //                   style:
                                                      //                       TextStyle(
                                                      //                     decoration:
                                                      //                         TextDecoration.lineThrough,
                                                      //                     // decorationStyle:
                                                      //                     //     TextDecorationStyle.wavy,
                                                      //                     decorationColor: Colors
                                                      //                         .indigo
                                                      //                         .shade900,
                                                      //                     decorationThickness:
                                                      //                         2.85,
                                                      //                     fontWeight:
                                                      //                         FontWeight.w600,
                                                      //                     fontSize:
                                                      //                         8.sp,
                                                      //                     color: Colors
                                                      //                         .grey
                                                      //                         .shade600,
                                                      //                     // MyTheme
                                                      //                     //     .containercolor10,
                                                      //                     //.ContainerUnSelectedColor,
                                                      //                   ),
                                                      //                 ),
                                                      //               ],
                                                      //             ),
                                                      //           ],
                                                      //         ),
                                                      //       ),
                                                      //
                                                      //       Spacer(),
                                                      //       Container(
                                                      //         height:
                                                      //             size.height *
                                                      //                 0.033,
                                                      //         width: 23.w,
                                                      //         decoration:
                                                      //             BoxDecoration(
                                                      //           borderRadius:
                                                      //               BorderRadius
                                                      //                   .circular(
                                                      //                       20),
                                                      //         ),
                                                      //         child: InkWell(
                                                      //           ///TODO: here we have to change the code add to cart..............prince
                                                      //           onTap: () {
                                                      //             ///this is the thing to thing to you that how can you add the item to add to cart api send by the help of id
                                                      //             controller.addtocartApi(
                                                      //                 _homePageController
                                                      //                     .getflashsellproduct!
                                                      //                     .result![
                                                      //                         index]
                                                      //                     .id);
                                                      //
                                                      //             ///
                                                      //           },
                                                      //           child:
                                                      //               RaisedGradientButton(
                                                      //             //height: 3.3.h,
                                                      //             //width: 23.9.w,
                                                      //             child: Text(
                                                      //               'Add To Cart',
                                                      //               style: TextStyle(
                                                      //                   color: Colors
                                                      //                       .black,
                                                      //                   fontWeight:
                                                      //                       FontWeight
                                                      //                           .w800,
                                                      //                   fontSize:
                                                      //                       8.sp),
                                                      //             ),
                                                      //             gradient:
                                                      //                 LinearGradient(
                                                      //               colors: <
                                                      //                   Color>[
                                                      //                 Color(
                                                      //                     0xff3a923b),
                                                      //                 Color(
                                                      //                     0xffb5d047),
                                                      //               ],
                                                      //             ),
                                                      //             onPressed: () {
                                                      //               // cartController.addProduct(
                                                      //               //     Productss
                                                      //               //         .products[index]);
                                                      //               // controller.addtocartApi(_homePageController
                                                      //               //     .getflashsellproduct!
                                                      //               //     .result![
                                                      //               //         index]
                                                      //               //     .id);
                                                      //               print(
                                                      //                   'Add To cart');
                                                      //             },
                                                      //           ),
                                                      //         ),
                                                      //       ),
                                                      //
                                                      //       // InkWell(
                                                      //       //   onTap: () {
                                                      //       //     cartController.addProduct(Productss.products[index]);
                                                      //       //   },
                                                      //       //   child: Container(
                                                      //       //     height: 3.3.h,
                                                      //       //     width: 23.9.w,
                                                      //       //     decoration: BoxDecoration(
                                                      //       //         //color: MyTheme.loginbuttonColor,
                                                      //       //         gradient: MyTheme.gradient4,
                                                      //       //         borderRadius: BorderRadius.only(
                                                      //       //           bottomRight: Radius.circular(5),
                                                      //       //           bottomLeft: Radius.circular(5),
                                                      //       //         )),
                                                      //       //     child: Center(
                                                      //       //       child: Text(
                                                      //       //         'Add To Cart',
                                                      //       //         style: TextStyle(
                                                      //       //           color: Colors.white,
                                                      //       //           fontWeight: FontWeight.w500,
                                                      //       //           fontSize: 8.sp,
                                                      //       //         ),
                                                      //       //       ),
                                                      //       //     ),
                                                      //       //   ),
                                                      //       // ),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                );
                              })),

                      // SizedBox(
                      //     height: size.height * 0.29,
                      //     child: ListView.builder(
                      //         scrollDirection: Axis.horizontal,
                      //         itemCount: _homePageController
                      //             .getflashsellproduct!.result!.length,
                      //         itemBuilder: (BuildContext context, int index) {
                      //           return Obx(
                      //             () => (_homePageController.isLoading.value)
                      //                 ? Center(child: CircularProgressIndicator())
                      //                 : _homePageController
                      //                             .getflashsellproduct!.result ==
                      //                         null
                      //
                      //                     // controller.cartListModel!.totalItem == null
                      //                     //.isEmpty
                      //                     ? Center(
                      //                         child: Text('No data'),
                      //                       )
                      //                     : Padding(
                      //                         padding: const EdgeInsets.all(1.0),
                      //                         child: PhysicalModel(
                      //                           borderRadius:
                      //                               BorderRadius.circular(5),
                      //                           color: MyTheme.ThemeColors,
                      //                           elevation: 0.1,
                      //                           child: Container(
                      //                             height: 26.h,
                      //                             width: size.width * 0.5,
                      //                             decoration: BoxDecoration(
                      //                               borderRadius:
                      //                                   BorderRadius.circular(5),
                      //                               color:
                      //                                   MyTheme.containercolor7,
                      //                               //gradient: MyTheme.gradient12
                      //                             ),
                      //                             child: Column(
                      //                               //mainAxisAlignment: MainAxisAlignment.center,
                      //                               children: [
                      //                                 Align(
                      //                                   alignment:
                      //                                       Alignment.centerLeft,
                      //                                   child: Container(
                      //                                     height: 3.1.h,
                      //                                     width: 22.w,
                      //                                     decoration:
                      //                                         BoxDecoration(
                      //                                             color: MyTheme
                      //                                                 .containercolor16,
                      //
                      //                                             //Colors.blueGrey.shade300,
                      //                                             borderRadius:
                      //                                                 BorderRadius
                      //                                                     .only(
                      //                                               topLeft: Radius
                      //                                                   .circular(
                      //                                                       5),
                      //                                               bottomRight: Radius
                      //                                                   .circular(
                      //                                                       20),
                      //                                             )),
                      //                                     child: Center(
                      //                                       child: Text(
                      //                                         _homePageController
                      //                                             .getflashsellproduct!
                      //                                             .result![index]
                      //                                             .sellerOption
                      //                                             .toString(),
                      //                                         style: TextStyle(
                      //                                           color:
                      //                                               Colors.black,
                      //                                           fontWeight:
                      //                                               FontWeight
                      //                                                   .w700,
                      //                                           fontSize: 9.sp,
                      //                                         ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                                 SizedBox(
                      //                                   height: 0.7.h,
                      //                                 ),
                      //                                 PhysicalModel(
                      //                                   shadowColor: Colors.green,
                      //                                   color: Colors.green,
                      //                                   borderRadius:
                      //                                       BorderRadius.circular(
                      //                                           5),
                      //                                   elevation: 5,
                      //                                   child: InkWell(
                      //                                     onTap: () {
                      //                                       _flashProductByIdController
                      //                                               .productid =
                      //                                           _homePageController
                      //                                               .getflashsellproduct!
                      //                                               .result![
                      //                                                   index]
                      //                                               .id
                      //                                               .toString();
                      //                                       _flashProductByIdController
                      //                                           .flashproductbyIdApi();
                      //                                       //Navigator.of(context).push(_createRoute());
                      //
                      //                                       // Get.to(
                      //                                       //   () => ItemDetailss(
                      //                                       //     // name: Productss
                      //                                       //     //     .products[index].name,
                      //                                       //     // price: Productss
                      //                                       //     //     .products[index].price,
                      //                                       //     // weight: Productss
                      //                                       //     //     .products[index].weight,
                      //                                       //     // imageUrl: Productss
                      //                                       //     //     .products[index].imageUrl,
                      //                                       //     // description: Productss
                      //                                       //     //     .products[index].descriptions,
                      //                                       //     // color: Productss
                      //                                       //     //     .products[index].color,
                      //                                       //     // id: Productss.products[index].id,
                      //                                       //     //
                      //                                       //     index: index,
                      //                                       //
                      //                                       //     //cartController.products[index].toString(),
                      //                                       //
                      //                                       //     // product:pr,
                      //                                       //   ), //next page class
                      //                                       //   duration: Duration(
                      //                                       //       milliseconds:
                      //                                       //           500), //duration of transitions, default 1 sec
                      //                                       //   transition:
                      //                                       //       // Transition.leftToRight //transition effect
                      //                                       //       // Transition.fadeIn
                      //                                       //       //Transition.size
                      //                                       //       Transition.zoom,
                      //                                       // );
                      //                                     },
                      //                                     child: Container(
                      //                                       height: size.height *
                      //                                           0.17,
                      //                                       width:
                      //                                           size.width * 0.36,
                      //                                       decoration:
                      //                                           BoxDecoration(
                      //                                         borderRadius:
                      //                                             BorderRadius
                      //                                                 .circular(
                      //                                                     5),
                      //                                         // border: Border.all(
                      //                                         //     color: AppColors.themecolors),
                      //                                         // image: DecorationImage(
                      //                                         //     image: AssetImage(Productss
                      //                                         //         .products[index].imageUrl),
                      //                                         //     fit: BoxFit.cover),
                      //                                       ),
                      //                                       child: Padding(
                      //                                         padding:
                      //                                             EdgeInsets.all(
                      //                                                 2.0),
                      //                                         child:
                      //                                             Image.network(
                      //                                           base +
                      //                                               '${_homePageController.getflashsellproduct!.result![index].productImage.toString()}',
                      //                                           fit: BoxFit.fill,
                      //                                           errorBuilder:
                      //                                               (context,
                      //                                                   error,
                      //                                                   stackTrace) {
                      //                                             //if image not comming in catagary then we have to purchase
                      //
                      //                                             return Icon(
                      //                                               Icons.error,
                      //                                               color: Colors
                      //                                                   .grey,
                      //                                             );
                      //                                           },
                      //
                      //                                           height:
                      //                                               size.height *
                      //                                                   0.04,
                      //                                           // color: _homePageController
                      //                                           //             .selectedIndex
                      //                                           //             .value ==
                      //                                           //         index
                      //                                           //     ? Colors.white
                      //                                           //     : MyTheme.ThemeColors
                      //                                         ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                                 SizedBox(
                      //                                   height: 0.6.h,
                      //                                 ),
                      //                                 Padding(
                      //                                   padding:
                      //                                       EdgeInsets.symmetric(
                      //                                           horizontal:
                      //                                               1.7.w),
                      //                                   child: Row(
                      //                                     mainAxisAlignment:
                      //                                         MainAxisAlignment
                      //                                             .spaceBetween,
                      //                                     children: [
                      //                                       SizedBox(
                      //                                         width: size.width *
                      //                                             0.26,
                      //                                         child: Text(
                      //                                           _homePageController
                      //                                               .getflashsellproduct!
                      //                                               .result![
                      //                                                   index]
                      //                                               .productName
                      //                                               .toString(),
                      //                                           overflow:
                      //                                               TextOverflow
                      //                                                   .ellipsis,
                      //                                           maxLines: 1,
                      //                                           style: TextStyle(
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w700,
                      //                                             fontSize: 9.sp,
                      //                                             color: Colors
                      //                                                 .white,
                      //                                           ),
                      //                                         ),
                      //                                       ),
                      //                                       SizedBox(
                      //                                         width: size.width *
                      //                                             0.2,
                      //                                         child: Text(
                      //                                           "Save:${_homePageController.getflashsellproduct!.result![index].discount.toString()}",
                      //                                           style: TextStyle(
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w400,
                      //                                             fontSize: 7.sp,
                      //                                             color: Colors
                      //                                                 .yellow
                      //                                                 .shade500,
                      //                                           ),
                      //                                         ),
                      //                                       ),
                      //                                     ],
                      //                                   ),
                      //                                 ),
                      //                                 SizedBox(
                      //                                   height:
                      //                                       size.height * 0.01,
                      //                                 ),
                      //                                 Padding(
                      //                                   padding:
                      //                                       EdgeInsets.symmetric(
                      //                                           horizontal:
                      //                                               1.8.w),
                      //                                   child: Row(
                      //                                     children: [
                      //                                       SizedBox(
                      //                                         //width: 21.w,
                      //                                         child: Column(
                      //                                           mainAxisAlignment:
                      //                                               MainAxisAlignment
                      //                                                   .spaceBetween,
                      //                                           crossAxisAlignment:
                      //                                               CrossAxisAlignment
                      //                                                   .start,
                      //                                           children: [
                      //                                             Padding(
                      //                                               padding: EdgeInsets
                      //                                                   .only(
                      //                                                       top: 0.0
                      //                                                           .h),
                      //                                               child: Text(
                      //                                                 '${_homePageController.getflashsellproduct!.result![index].weight1} gm',
                      //                                                 style:
                      //                                                     TextStyle(
                      //                                                   fontWeight:
                      //                                                       FontWeight
                      //                                                           .w400,
                      //                                                   fontSize:
                      //                                                       8.sp,
                      //                                                   color: Colors
                      //                                                       .grey
                      //                                                       .shade100,
                      //                                                 ),
                      //                                               ),
                      //                                             ),
                      //                                             Row(
                      //                                               children: [
                      //                                                 Text(
                      //                                                   '₹${_homePageController.getflashsellproduct!.result![index].price}'
                      //                                                   " ",
                      //                                                   style:
                      //                                                       TextStyle(
                      //                                                     fontWeight:
                      //                                                         FontWeight.w700,
                      //                                                     fontSize:
                      //                                                         9.sp,
                      //                                                     color: Colors
                      //                                                         .red,
                      //                                                     //.ContainerUnSelectedColor,
                      //                                                   ),
                      //                                                 ),
                      //                                                 Text(
                      //                                                   ' ₹${_homePageController.getflashsellproduct!.result![index].price}',
                      //                                                   style:
                      //                                                       TextStyle(
                      //                                                     decoration:
                      //                                                         TextDecoration.lineThrough,
                      //                                                     decorationStyle:
                      //                                                         TextDecorationStyle.wavy,
                      //                                                     decorationColor: Colors
                      //                                                         .red
                      //                                                         .shade300,
                      //                                                     decorationThickness:
                      //                                                         2.85,
                      //                                                     fontWeight:
                      //                                                         FontWeight.w600,
                      //                                                     fontSize:
                      //                                                         9.sp,
                      //                                                     color: MyTheme
                      //                                                         .containercolor10,
                      //                                                     //.ContainerUnSelectedColor,
                      //                                                   ),
                      //                                                 ),
                      //                                               ],
                      //                                             ),
                      //                                           ],
                      //                                         ),
                      //                                       ),
                      //
                      //                                       Spacer(),
                      //                                       Container(
                      //                                         height:
                      //                                             size.height *
                      //                                                 0.033,
                      //                                         width: 23.w,
                      //                                         decoration:
                      //                                             BoxDecoration(
                      //                                           borderRadius:
                      //                                               BorderRadius
                      //                                                   .circular(
                      //                                                       20),
                      //                                         ),
                      //                                         child: InkWell(
                      //                                           ///TODO: here we have to change the code add to cart..............prince
                      //                                           onTap: () {
                      //                                             ///this is the thing to thing to you that how can you add the item to add to cart api send by the help of id
                      //                                             controller.addtocartApi(
                      //                                                 _homePageController
                      //                                                     .getflashsellproduct!
                      //                                                     .result![
                      //                                                         index]
                      //                                                     .id);
                      //
                      //                                             ///
                      //                                           },
                      //                                           child:
                      //                                               RaisedGradientButton(
                      //                                             //height: 3.3.h,
                      //                                             //width: 23.9.w,
                      //                                             child: Text(
                      //                                               'Add To Cart',
                      //                                               style: TextStyle(
                      //                                                   color: Colors
                      //                                                       .black,
                      //                                                   fontWeight:
                      //                                                       FontWeight
                      //                                                           .w800,
                      //                                                   fontSize:
                      //                                                       8.sp),
                      //                                             ),
                      //                                             gradient:
                      //                                                 LinearGradient(
                      //                                               colors: <
                      //                                                   Color>[
                      //                                                 Color(
                      //                                                     0xff3a923b),
                      //                                                 Color(
                      //                                                     0xffb5d047),
                      //                                                 //Colors.green,
                      //                                                 //Colors.cyan.shade400
                      //                                               ],
                      //                                             ),
                      //                                             onPressed: () {
                      //                                               // cartController.addProduct(
                      //                                               //     Productss
                      //                                               //         .products[index]);
                      //                                               // controller.addtocartApi(_homePageController
                      //                                               //     .getflashsellproduct!
                      //                                               //     .result![
                      //                                               //         index]
                      //                                               //     .id);
                      //                                               print(
                      //                                                   'Add To cart');
                      //                                             },
                      //                                           ),
                      //                                         ),
                      //                                       ),
                      //
                      //                                       // InkWell(
                      //                                       //   onTap: () {
                      //                                       //     cartController.addProduct(Productss.products[index]);
                      //                                       //   },
                      //                                       //   child: Container(
                      //                                       //     height: 3.3.h,
                      //                                       //     width: 23.9.w,
                      //                                       //     decoration: BoxDecoration(
                      //                                       //         //color: MyTheme.loginbuttonColor,
                      //                                       //         gradient: MyTheme.gradient4,
                      //                                       //         borderRadius: BorderRadius.only(
                      //                                       //           bottomRight: Radius.circular(5),
                      //                                       //           bottomLeft: Radius.circular(5),
                      //                                       //         )),
                      //                                       //     child: Center(
                      //                                       //       child: Text(
                      //                                       //         'Add To Cart',
                      //                                       //         style: TextStyle(
                      //                                       //           color: Colors.white,
                      //                                       //           fontWeight: FontWeight.w500,
                      //                                       //           fontSize: 8.sp,
                      //                                       //         ),
                      //                                       //       ),
                      //                                       //     ),
                      //                                       //   ),
                      //                                       // ),
                      //                                     ],
                      //                                   ),
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //           );
                      //         })),
                      // SizedBox(
                      //     height: size.height * 0.29,
                      //     child: ListView.builder(
                      //         scrollDirection: Axis.horizontal,
                      //         itemCount: _homePageController
                      //             .getflashsellproduct!.result!.length,
                      //         itemBuilder: (BuildContext context, int index) {
                      //           return Obx(
                      //             () => (_homePageController.isLoading.value)
                      //                 ? Center(child: CircularProgressIndicator())
                      //                 : _homePageController
                      //                             .getflashsellproduct!.result ==
                      //                         null
                      //                     ? Center(
                      //                         child: Text('No List'),
                      //                       )
                      //                     : Padding(
                      //                         padding: const EdgeInsets.all(1.0),
                      //                         child: PhysicalModel(
                      //                           borderRadius:
                      //                               BorderRadius.circular(5),
                      //                           color: MyTheme.ThemeColors,
                      //                           elevation: 0.1,
                      //                           child: Container(
                      //                             height: 26.h,
                      //                             width: size.width * 0.5,
                      //                             decoration: BoxDecoration(
                      //                               borderRadius:
                      //                                   BorderRadius.circular(5),
                      //                               color:
                      //                                   MyTheme.containercolor7,
                      //                               //gradient: MyTheme.gradient12
                      //                             ),
                      //                             child: Column(
                      //                               //mainAxisAlignment: MainAxisAlignment.center,
                      //                               children: [
                      //                                 Align(
                      //                                   alignment:
                      //                                       Alignment.centerLeft,
                      //                                   child: Container(
                      //                                     height: 3.1.h,
                      //                                     width: 22.w,
                      //                                     decoration:
                      //                                         BoxDecoration(
                      //                                             color: MyTheme
                      //                                                 .containercolor16,
                      //
                      //                                             //Colors.blueGrey.shade300,
                      //                                             borderRadius:
                      //                                                 BorderRadius
                      //                                                     .only(
                      //                                               topLeft: Radius
                      //                                                   .circular(
                      //                                                       5),
                      //                                               bottomRight: Radius
                      //                                                   .circular(
                      //                                                       20),
                      //                                             )),
                      //                                     child: Center(
                      //                                       child: Text(
                      //                                         _homePageController
                      //                                             .getflashsellproduct!
                      //                                             .result![index]
                      //                                             .sellerOption
                      //                                             .toString(),
                      //                                         style: TextStyle(
                      //                                           color:
                      //                                               Colors.black,
                      //                                           fontWeight:
                      //                                               FontWeight
                      //                                                   .w700,
                      //                                           fontSize: 9.sp,
                      //                                         ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                                 SizedBox(
                      //                                   height: 0.7.h,
                      //                                 ),
                      //                                 PhysicalModel(
                      //                                   shadowColor: Colors.green,
                      //                                   color: Colors.green,
                      //                                   borderRadius:
                      //                                       BorderRadius.circular(
                      //                                           5),
                      //                                   elevation: 5,
                      //                                   child: InkWell(
                      //                                     onTap: () {
                      //                                       _flashProductByIdController
                      //                                               .productid =
                      //                                           _homePageController
                      //                                               .getflashsellproduct!
                      //                                               .result![
                      //                                                   index]
                      //                                               .id
                      //                                               .toString();
                      //                                       _flashProductByIdController
                      //                                           .flashproductbyIdApi();
                      //                                       //Navigator.of(context).push(_createRoute());
                      //
                      //                                       // Get.to(
                      //                                       //   () => ItemDetailss(
                      //                                       //     // name: Productss
                      //                                       //     //     .products[index].name,
                      //                                       //     // price: Productss
                      //                                       //     //     .products[index].price,
                      //                                       //     // weight: Productss
                      //                                       //     //     .products[index].weight,
                      //                                       //     // imageUrl: Productss
                      //                                       //     //     .products[index].imageUrl,
                      //                                       //     // description: Productss
                      //                                       //     //     .products[index].descriptions,
                      //                                       //     // color: Productss
                      //                                       //     //     .products[index].color,
                      //                                       //     // id: Productss.products[index].id,
                      //                                       //     //
                      //                                       //     index: index,
                      //                                       //
                      //                                       //     //cartController.products[index].toString(),
                      //                                       //
                      //                                       //     // product:pr,
                      //                                       //   ), //next page class
                      //                                       //   duration: Duration(
                      //                                       //       milliseconds:
                      //                                       //           500), //duration of transitions, default 1 sec
                      //                                       //   transition:
                      //                                       //       // Transition.leftToRight //transition effect
                      //                                       //       // Transition.fadeIn
                      //                                       //       //Transition.size
                      //                                       //       Transition.zoom,
                      //                                       // );
                      //                                     },
                      //                                     child: Container(
                      //                                       height: size.height *
                      //                                           0.17,
                      //                                       width:
                      //                                           size.width * 0.36,
                      //                                       decoration:
                      //                                           BoxDecoration(
                      //                                         borderRadius:
                      //                                             BorderRadius
                      //                                                 .circular(
                      //                                                     5),
                      //                                         // border: Border.all(
                      //                                         //     color: AppColors.themecolors),
                      //                                         // image: DecorationImage(
                      //                                         //     image: AssetImage(Productss
                      //                                         //         .products[index].imageUrl),
                      //                                         //     fit: BoxFit.cover),
                      //                                       ),
                      //                                       child: Padding(
                      //                                         padding:
                      //                                             EdgeInsets.all(
                      //                                                 2.0),
                      //                                         child:
                      //                                             Image.network(
                      //                                           base +
                      //                                               '${_homePageController.getflashsellproduct!.result![index].productImage.toString()}',
                      //                                           fit: BoxFit.fill,
                      //                                           errorBuilder:
                      //                                               (context,
                      //                                                   error,
                      //                                                   stackTrace) {
                      //                                             //if image not comming in catagary then we have to purchase
                      //
                      //                                             return Icon(
                      //                                               Icons.error,
                      //                                               color: Colors
                      //                                                   .grey,
                      //                                             );
                      //                                           },
                      //
                      //                                           height:
                      //                                               size.height *
                      //                                                   0.04,
                      //                                           // color: _homePageController
                      //                                           //             .selectedIndex
                      //                                           //             .value ==
                      //                                           //         index
                      //                                           //     ? Colors.white
                      //                                           //     : MyTheme.ThemeColors
                      //                                         ),
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                                 SizedBox(
                      //                                   height: 0.6.h,
                      //                                 ),
                      //                                 Padding(
                      //                                   padding:
                      //                                       EdgeInsets.symmetric(
                      //                                           horizontal:
                      //                                               1.7.w),
                      //                                   child: Row(
                      //                                     mainAxisAlignment:
                      //                                         MainAxisAlignment
                      //                                             .spaceBetween,
                      //                                     children: [
                      //                                       SizedBox(
                      //                                         width: size.width *
                      //                                             0.31,
                      //                                         child: Text(
                      //                                           _homePageController
                      //                                               .getflashsellproduct!
                      //                                               .result![
                      //                                                   index]
                      //                                               .productName
                      //                                               .toString(),
                      //                                           overflow:
                      //                                               TextOverflow
                      //                                                   .ellipsis,
                      //                                           maxLines: 1,
                      //                                           style: TextStyle(
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .w700,
                      //                                             fontSize: 9.sp,
                      //                                             color: Colors
                      //                                                 .white,
                      //                                           ),
                      //                                         ),
                      //                                       ),
                      //                                       Text(
                      //                                         "Save${_homePageController.getflashsellproduct!.result![index].discount.toString()}",
                      //                                         style: TextStyle(
                      //                                           fontWeight:
                      //                                               FontWeight
                      //                                                   .w400,
                      //                                           fontSize: 8.sp,
                      //                                           color: Colors
                      //                                               .yellow
                      //                                               .shade500,
                      //                                         ),
                      //                                       ),
                      //                                     ],
                      //                                   ),
                      //                                 ),
                      //                                 SizedBox(
                      //                                   height:
                      //                                       size.height * 0.01,
                      //                                 ),
                      //                                 Padding(
                      //                                   padding:
                      //                                       EdgeInsets.symmetric(
                      //                                           horizontal:
                      //                                               1.8.w),
                      //                                   child: Row(
                      //                                     children: [
                      //                                       SizedBox(
                      //                                         //width: 21.w,
                      //                                         child: Row(
                      //                                           mainAxisAlignment:
                      //                                               MainAxisAlignment
                      //                                                   .spaceBetween,
                      //                                           children: [
                      //                                             Text(
                      //                                               '₹${_homePageController.getflashsellproduct!.result![index].price}' +
                      //                                                   "",
                      //                                               style:
                      //                                                   TextStyle(
                      //                                                 fontWeight:
                      //                                                     FontWeight
                      //                                                         .w700,
                      //                                                 fontSize:
                      //                                                     10.sp,
                      //                                                 color: MyTheme
                      //                                                     .ContainerUnSelectedColor,
                      //                                               ),
                      //                                             ),
                      //                                             Padding(
                      //                                               padding: EdgeInsets
                      //                                                   .only(
                      //                                                       top: 0.0
                      //                                                           .h),
                      //                                               child: Text(
                      //                                                 '/${_homePageController.getflashsellproduct!.result![index].weight1} gm',
                      //                                                 style:
                      //                                                     TextStyle(
                      //                                                   fontWeight:
                      //                                                       FontWeight
                      //                                                           .w400,
                      //                                                   fontSize:
                      //                                                       8.sp,
                      //                                                   color: Colors
                      //                                                       .grey
                      //                                                       .shade200,
                      //                                                 ),
                      //                                               ),
                      //                                             ),
                      //                                           ],
                      //                                         ),
                      //                                       ),
                      //
                      //                                       Spacer(),
                      //                                       Container(
                      //                                         height:
                      //                                             size.height *
                      //                                                 0.033,
                      //                                         width: 23.w,
                      //                                         decoration:
                      //                                             BoxDecoration(
                      //                                           borderRadius:
                      //                                               BorderRadius
                      //                                                   .circular(
                      //                                                       20),
                      //                                         ),
                      //                                         child: InkWell(
                      //                                           ///TODO: here we have to change the code add to cart..............prince
                      //                                           onTap: () {
                      //                                             ///this is the thing to thing to you that how can you add the item to add to cart api send by the help of id
                      //                                             controller.addtocartApi(
                      //                                                 _homePageController
                      //                                                     .getflashsellproduct!
                      //                                                     .result![
                      //                                                         index]
                      //                                                     .id);
                      //
                      //                                             ///
                      //                                           },
                      //                                           child:
                      //                                               RaisedGradientButton(
                      //                                             //height: 3.3.h,
                      //                                             //width: 23.9.w,
                      //                                             child: Text(
                      //                                               'Add To Cart',
                      //                                               style: TextStyle(
                      //                                                   color: Colors
                      //                                                       .black,
                      //                                                   fontWeight:
                      //                                                       FontWeight
                      //                                                           .w800,
                      //                                                   fontSize:
                      //                                                       8.sp),
                      //                                             ),
                      //                                             gradient:
                      //                                                 LinearGradient(
                      //                                               colors: <
                      //                                                   Color>[
                      //                                                 Color(
                      //                                                     0xff3a923b),
                      //                                                 Color(
                      //                                                     0xffb5d047)
                      //                                                 //Colors.green,
                      //                                                 //Colors.cyan.shade400
                      //                                               ],
                      //                                             ),
                      //                                             onPressed: () {
                      //                                               // cartController.addProduct(
                      //                                               //     Productss
                      //                                               //         .products[index]);
                      //                                               controller.addtocartApi(_homePageController
                      //                                                   .getflashsellproduct!
                      //                                                   .result![
                      //                                                       index]
                      //                                                   .id);
                      //                                               print(
                      //                                                   'Add To cart');
                      //                                             },
                      //                                           ),
                      //                                         ),
                      //                                       ),
                      //
                      //                                       // InkWell(
                      //                                       //   onTap: () {
                      //                                       //     cartController.addProduct(Productss.products[index]);
                      //                                       //   },
                      //                                       //   child: Container(
                      //                                       //     height: 3.3.h,
                      //                                       //     width: 23.9.w,
                      //                                       //     decoration: BoxDecoration(
                      //                                       //         //color: MyTheme.loginbuttonColor,
                      //                                       //         gradient: MyTheme.gradient4,
                      //                                       //         borderRadius: BorderRadius.only(
                      //                                       //           bottomRight: Radius.circular(5),
                      //                                       //           bottomLeft: Radius.circular(5),
                      //                                       //         )),
                      //                                       //     child: Center(
                      //                                       //       child: Text(
                      //                                       //         'Add To Cart',
                      //                                       //         style: TextStyle(
                      //                                       //           color: Colors.white,
                      //                                       //           fontWeight: FontWeight.w500,
                      //                                       //           fontSize: 8.sp,
                      //                                       //         ),
                      //                                       //       ),
                      //                                       //     ),
                      //                                       //   ),
                      //                                       // ),
                      //                                     ],
                      //                                   ),
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //           );
                      //         })),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: size.height * 0.034,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: MyTheme.containergradient,
                            //gradient: MyTheme.gradient2,
                          ),
                          //color: MyTheme.loginPageBoxColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 0.4.h),
                            child: Text(
                              'Our Offers',
                              style: TextStyle(
                                color: Colors.black,
                                //color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w700,
                                fontSize: 11.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: size.height * 0.18,
                          decoration: BoxDecoration(color: Color(0xffE8F9FD)),

                          //width: double.infinity,
                          child: ListView.builder(
                              itemCount:
                                  _homePageController.getouroffer!.result!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(
                                  () => (_homePageController.isLoading.value)
                                      ? Center(child: CircularProgressIndicator())
                                      : _homePageController.getouroffer!.result ==
                                              null
                                          ? Center(
                                              child: Text('No List'),
                                            )
                                          : PhysicalModel(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              color: Color(0xffeff8f5),
                                              elevation: 0.1,
                                              child: Padding(
                                                padding:
                                                     EdgeInsets.symmetric(horizontal: size.width*0.01),
                                                child: Container(
                                                  //height: 1.h,
                                                  width:
                                                      98.w, //size.width * 0.99,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    // color: MyTheme.ContainerUnSelectedColor,
                                                    // image: DecorationImage(
                                                    //   image:
                                                    //   NetworkImage(
                                                    //     base +
                                                    //         '${_homePageController.getouroffer!.result![index].promotionalBannerPath}',
                                                    //   ),
                                                    //   fit: BoxFit.fill,
                                                    // ),

                                                  ),
                                                  child: Center(
                                                      child:
                                                      CachedNetworkImage(
                                                        imageUrl: base + "${_homePageController.getouroffer!.result![index].promotionalBannerPath.toString()}",fit: BoxFit.cover,
                                                        placeholder: (context, url) => SizedBox(
                                                            height: 23.h,
                                                            width: 100
                                                                .w,
                                                            //width: 4.w,
                                                            child: Center(
                                                              child: Image.asset("lib/assets/asset/zif_loading6.gif",fit: BoxFit.fill,height: size.height*0.17,),
                                                              //CircularProgressIndicator()
                                                            )
                                                        ),
                                                        errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.red,),
                                                      ),

                                                      // FadeInImage.assetNetwork(
                                                      //   placeholder: 'lib/assets/asset/zif_loading.gif',fadeInCurve: Curves.linear,
                                                      //   image: base +'${_homePageController.getouroffer!.result![index].promotionalBannerPath}',fit: BoxFit.fill,
                                                      // )

                                                  ),

                                                ),
                                              ),
                                            ),
                                );
                              })),

                      ///from here we can see the method of future builder.....................
                      // FutureBuilder<List<ourOfferResult>>(
                      //     future: ourOfferData(),
                      //     builder: (context, snapshot) {
                      //       if (snapshot.hasData) {
                      //         var items = snapshot.data;
                      //         var base = 'https://api.gyros.farm/Images/';
                      //         return SizedBox(
                      //             height: size.height * 0.2,
                      //             //width: double.infinity,
                      //             child: ListView.builder(
                      //                 itemCount: items!.length,
                      //                 scrollDirection: Axis.horizontal,
                      //                 itemBuilder:
                      //                     (BuildContext context, int index) {
                      //                   return InkWell(
                      //                     onTap: () {},
                      //                     child: PhysicalModel(
                      //                       borderRadius: BorderRadius.circular(0),
                      //                       color: Color(0xffeff8f5),
                      //                       elevation: 0.1,
                      //                       child: Padding(
                      //                         padding: const EdgeInsets.all(2.0),
                      //                         child: Container(
                      //                           height: 15.h,
                      //                           width: 95.w, //size.width * 0.99,
                      //                           decoration: BoxDecoration(
                      //                             borderRadius:
                      //                                 BorderRadius.circular(5),
                      //                             // color: MyTheme.ContainerUnSelectedColor,
                      //                             image: DecorationImage(
                      //                               image: NetworkImage(
                      //                                 base +
                      //                                     '${items[index].promotionalBannerPath}',
                      //                               ),
                      //                               fit: BoxFit.fill,
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   );
                      //                 }));
                      //       } else if (snapshot.hasError) {
                      //         return Text("${snapshot.error}");
                      //       }
                      //       return Center(
                      //           child: CircularProgressIndicator(
                      //         color: Colors.white,
                      //       ));
                      //     })
                    ],
                  ),
                ),
      ),
        //: Center(child: CircularProgressIndicator())

    );
  }
}
//Model

// ourOffers model
