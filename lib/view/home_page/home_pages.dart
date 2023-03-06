import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/view/home_page/drower/drower.dart';
import 'package:gyros_app/view/home_page/home_page_model/categoryModel.dart';
import 'package:gyros_app/view/home_page/slider_crusial.dart';
import 'package:gyros_app/view/model_cart_practice/controllers/cart_controllersss.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/flash_sale_product_by_id_controllers/flash_product_by_id_controller.dart';
import '../../controllers/sub_catagary_controllers/sub_cat_id_controllers.dart';
import '../login_page/login_with_email/login_email.dart';
import '../model_cart_practice/widgets/gradient_button.dart';
import 'home_page_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  CartController controller = Get.put(CartController());
  HomePageController _homePageController = Get.put(HomePageController());
  SubCatByIdController _subCatByIdController = Get.put(SubCatByIdController());
  FlashProductByIdController _flashProductByIdController =
      Get.put(FlashProductByIdController());
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
          'lib/assets/asset/guser_logo.png',
          // color: AppColors.themecolors,
          height: 13.h,
          width: 35.w,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: InkWell(
              onTap: () {
                Get.to(() => LoginEmailPage());
                //Get.to(() => ShopingBagsEmpty());
              },
              child: Icon(
                Icons.shopping_cart,
                color: Colors.green,
              ),
            ),
          ),

          ///here search page for your identification.......
        ],
        leading: InkWell(
            onTap: () {
              Get.to(LoginEmailPage());
              // _key.currentState!.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: AppColors.themecolors,
            )),
      ),
      drawer: MainDrawer(),
      body: Obx(
        () => (_homePageController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            // : controller.cartListModel!.result!.isEmpty
            //     ? Center(
            //         child: Text('No List'),
            //       )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.25,
                      width: double.infinity,
                      color: Colors.greenAccent,
                      child: MySlider(),
                    ),
                    SizedBox(
                      // height: 33.5.h,
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio: 5 / 2,
                                  mainAxisExtent: size.height * 0.09,
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 0),
                          itemCount: _homePageController
                              .getcatagartlist!.result!.length,
                          //items?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Obx(
                              () => (_homePageController.isLoading.value)
                                  ? Center(child: CircularProgressIndicator())
                                  : _homePageController
                                          .getcatagartlist!.result!.isEmpty
                                      ? Center(
                                          child: Text('No List'),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.005,
                                              vertical: size.height * 0.002),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(LoginEmailPage());
                                              // _homePageController.toggle(index);
                                              // if (index == 0) {
                                              //   Get.to(() => CatagaryListSubcatagary());
                                              //   //Get.to(() => BestSeller());
                                              //   //Get.to(() => WaterTracking());
                                              // } else if (index == 1) {
                                              //   Get.to(() => CatagaryListSubcatagary());
                                              // }
                                              // /*else if (index == 2) {
                                              //       Get.to(() => CowGhee());
                                              //       //Get.to(() => WalkTracking());
                                              //     } else if (index == 3) {
                                              //       Get.to(() => Oil());
                                              //     } else if (index == 4) {
                                              //       Get.to(() => Spices());
                                              //       //Get.to(() => WalkTracking());
                                              //     } else if (index == 5) {
                                              //       Get.to(() => Honey());
                                              //       //Get.to(() => WalkTracking());
                                              //     } else if (index == 6) {
                                              //       Get.to(() => Pulses());
                                              //       //Get.to(() => WalkTracking());
                                              //     } else if (index == 7) {
                                              //       Get.to(() => Sattu());
                                              //       //Get.to(() => WalkTracking());
                                              //     } else if (index == 8) {
                                              //       Get.to(() => CupponsPage());
                                              //     } else if (index == 9) {
                                              //       Get.to(() => GiftBox());
                                              //
                                              //       //Get.to(() => WalkTracking());
                                              //     } else if (index == 10) {
                                              //       Get.to(() => Sweets());
                                              //       //Get.to(() => BestSeller());
                                              //       //Get.to(() => WalkTracking());
                                              //     } else if (index == 11) {
                                              //       Get.to(() => Jeggary());
                                              //       //Get.to(() => WalkTracking());
                                              //     }*/
                                            },
                                            child: PhysicalModel(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: _homePageController
                                                          .selectedIndex
                                                          .value ==
                                                      index
                                                  ? MyTheme.containercolor7
                                                  : MyTheme.containercolor7,

                                              //: Color(0xffeff8f5),
                                              elevation: 0.1,
                                              child: Container(
                                                height: 10.h,
                                                width: 20.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: _homePageController
                                                              .selectedIndex
                                                              .value ==
                                                          index
                                                      ? Colors.white12
                                                      : Colors.white12,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.network(
                                                      base +
                                                          '${_homePageController.getcatagartlist!.result![index].imageName.toString()}',
                                                      fit: BoxFit.fill,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        //if image not comming in catagary then we have to purchase

                                                        return Icon(
                                                          Icons.error,
                                                          color: Colors.grey,
                                                        );
                                                      },

                                                      height:
                                                          size.height * 0.056,
                                                      width: size.width * 0.15,
                                                      // color: _homePageController
                                                      //             .selectedIndex
                                                      //             .value ==
                                                      //         index
                                                      //     ? Colors.white
                                                      //     : MyTheme.ThemeColors
                                                    ),
                                                    Center(
                                                        child: SizedBox(
                                                      width: size.width * 0.25,
                                                      child: Center(
                                                        child: Text(
                                                          _homePageController
                                                              .getcatagartlist!
                                                              .result![index]
                                                              .categoryName
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 8.sp,
                                                              color: MyTheme
                                                                  .ContainerUnSelectedColor
                                                              // _homePageController
                                                              //             .selectedIndex
                                                              //             .value ==
                                                              //         index
                                                              //     ? MyTheme.ThemeColors
                                                              //     : MyTheme.ThemeColors
                                                              ),
                                                        ),
                                                      ),
                                                    )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                            );
                          }),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: size.height * 0.034,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          //color: MyTheme.containercolor15
                          gradient: MyTheme.gradient2,
                        ),
                        //color: MyTheme.loginPageBoxColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 0.4.h),
                          child: Text(
                            'Flash Sale',
                            style: TextStyle(
                              color: Colors.white,

                              //color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.w700,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: size.height * 0.29,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _homePageController
                                .getflashsellproduct!.result!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => (_homePageController.isLoading.value)
                                    ? Center(child: CircularProgressIndicator())
                                    : _homePageController.getflashsellproduct!
                                            .result!.isEmpty
                                        ? Center(
                                            child: Text('No List'),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(1.0),
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
                                                  color:
                                                      MyTheme.containercolor7,
                                                  //gradient: MyTheme.gradient12
                                                ),
                                                child: Column(
                                                  //mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Container(
                                                        height: 3.1.h,
                                                        width: 22.w,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: MyTheme
                                                                    .containercolor16,

                                                                //Colors.blueGrey.shade300,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          5),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20),
                                                                )),
                                                        child: Center(
                                                          child: Text(
                                                            _homePageController
                                                                .getflashsellproduct!
                                                                .result![index]
                                                                .sellerOption
                                                                .toString(),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 9.sp,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 0.7.h,
                                                    ),
                                                    PhysicalModel(
                                                      shadowColor: Colors.green,
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      elevation: 5,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Get.to(() =>
                                                              LoginEmailPage());
                                                          //Navigator.of(context).push(_createRoute());

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
                                                                    2.0),
                                                            child:
                                                                Image.network(
                                                              base +
                                                                  '${_homePageController.getflashsellproduct!.result![index].productImage.toString()}',
                                                              fit: BoxFit.fill,
                                                              errorBuilder:
                                                                  (context,
                                                                      error,
                                                                      stackTrace) {
                                                                //if image not comming in catagary then we have to purchase

                                                                return Icon(
                                                                  Icons.error,
                                                                  color: Colors
                                                                      .grey,
                                                                );
                                                              },

                                                              height:
                                                                  size.height *
                                                                      0.04,
                                                              // color: _homePageController
                                                              //             .selectedIndex
                                                              //             .value ==
                                                              //         index
                                                              //     ? Colors.white
                                                              //     : MyTheme.ThemeColors
                                                            ),
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
                                                                  1.7.w),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: size.width *
                                                                0.31,
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
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 9.sp,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Save${_homePageController.getflashsellproduct!.result![index].discount.toString()}%",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 10.sp,
                                                              color: Colors
                                                                  .yellow
                                                                  .shade500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          size.height * 0.01,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  1.8.w),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            //width: 21.w,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  '₹${_homePageController.getflashsellproduct!.result![index].price}' +
                                                                      "",
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        10.sp,
                                                                    color: MyTheme
                                                                        .ContainerUnSelectedColor,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top: 0.0
                                                                              .h),
                                                                  child: Text(
                                                                    '/${_homePageController.getflashsellproduct!.result![index].weight1} gm',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          8.sp,
                                                                      color: Colors
                                                                          .grey
                                                                          .shade200,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),

                                                          Spacer(),
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
                                                                Get.to(() =>
                                                                    LoginEmailPage());

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
                                                                      fontWeight:
                                                                          FontWeight
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
                                                                    //Colors.green,
                                                                    //Colors.cyan.shade400
                                                                  ],
                                                                ),
                                                                onPressed: () {
                                                                  // cartController.addProduct(
                                                                  //     Productss
                                                                  //         .products[index]);
                                                                  Get.to(() =>
                                                                      LoginEmailPage());
                                                                  print(
                                                                      'Add To cart');
                                                                },
                                                              ),
                                                            ),
                                                          ),

                                                          // InkWell(
                                                          //   onTap: () {
                                                          //     cartController.addProduct(Productss.products[index]);
                                                          //   },
                                                          //   child: Container(
                                                          //     height: 3.3.h,
                                                          //     width: 23.9.w,
                                                          //     decoration: BoxDecoration(
                                                          //         //color: MyTheme.loginbuttonColor,
                                                          //         gradient: MyTheme.gradient4,
                                                          //         borderRadius: BorderRadius.only(
                                                          //           bottomRight: Radius.circular(5),
                                                          //           bottomLeft: Radius.circular(5),
                                                          //         )),
                                                          //     child: Center(
                                                          //       child: Text(
                                                          //         'Add To Cart',
                                                          //         style: TextStyle(
                                                          //           color: Colors.white,
                                                          //           fontWeight: FontWeight.w500,
                                                          //           fontSize: 8.sp,
                                                          //         ),
                                                          //       ),
                                                          //     ),
                                                          //   ),
                                                          // ),
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
                    SizedBox(
                      height: 00.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: size.height * 0.034,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: MyTheme.gradient2,
                        ),
                        //color: MyTheme.loginPageBoxColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 0.4.h),
                          child: Text(
                            'Purchase your first product',
                            style: TextStyle(
                              color: Colors.white,

                              //color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.w700,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: size.height * 0.19,
                        //width: double.infinity,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _homePageController
                                .getfirstorderbanner!.result.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => (_homePageController.isLoading.value)
                                    ? Center(child: CircularProgressIndicator())
                                    : _homePageController
                                            .getfirstorderbanner!.result.isEmpty
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
                                            child: PhysicalModel(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              color: _homePageController
                                                          .selectedIndex
                                                          .value ==
                                                      index
                                                  ? MyTheme.ThemeColors
                                                  : Color(0xffeff8f5),
                                              elevation: 0.1,
                                              child: Container(
                                                height: 23.h,
                                                width:
                                                    100.w, //size.width * 0.99,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  color: MyTheme
                                                      .ContainerUnSelectedColor,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      base +
                                                          '${_homePageController.getfirstorderbanner!.result[index].imagePath}',
                                                    ),
                                                    fit: BoxFit.fill,
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
                          gradient: MyTheme.gradient2,
                        ),
                        //color: MyTheme.loginPageBoxColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 0.4.h),
                          child: Text(
                            'Our Products',
                            style: TextStyle(
                              color: Colors.white,

                              //color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.w700,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: size.height * 0.29,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _homePageController
                                .getflashsellproduct!.result!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => (_homePageController.isLoading.value)
                                    ? Center(child: CircularProgressIndicator())
                                    : _homePageController.getflashsellproduct!
                                            .result!.isEmpty
                                        ? Center(
                                            child: Text('No List'),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(1.0),
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
                                                  color:
                                                      MyTheme.containercolor7,
                                                  //gradient: MyTheme.gradient12
                                                ),
                                                child: Column(
                                                  //mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            height: 3.1.h,
                                                            width: 22.w,
                                                            decoration:
                                                                BoxDecoration(
                                                                    //color: Colors.black,
                                                                    color: MyTheme
                                                                        .containercolor16,

                                                                    //Colors.blueGrey.shade300,
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
                                                                _homePageController
                                                                    .getflashsellproduct!
                                                                    .result![
                                                                        index]
                                                                    .sellerOption
                                                                    .toString(),
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
                                                          ),
                                                        ),
                                                        // Container(
                                                        //   height: 10,
                                                        //   width: 40,
                                                        //   color: Colors.black,
                                                        //   child: Text("hello"),
                                                        // )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 0.7.h,
                                                    ),
                                                    PhysicalModel(
                                                      shadowColor: Colors.green,
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      elevation: 5,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Get.to(() =>
                                                              LoginEmailPage());
                                                          //Navigator.of(context).push(_createRoute());

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
                                                                    2.0),
                                                            child:
                                                                Image.network(
                                                              base +
                                                                  '${_homePageController.getflashsellproduct!.result![index].productImage.toString()}',
                                                              fit: BoxFit.fill,
                                                              errorBuilder:
                                                                  (context,
                                                                      error,
                                                                      stackTrace) {
                                                                //if image not comming in catagary then we have to purchase

                                                                return Icon(
                                                                  Icons.error,
                                                                  color: Colors
                                                                      .grey,
                                                                );
                                                              },

                                                              height:
                                                                  size.height *
                                                                      0.04,
                                                              // color: _homePageController
                                                              //             .selectedIndex
                                                              //             .value ==
                                                              //         index
                                                              //     ? Colors.white
                                                              //     : MyTheme.ThemeColors
                                                            ),
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
                                                                  1.7.w),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: size.width *
                                                                0.31,
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
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 9.sp,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Save${_homePageController.getflashsellproduct!.result![index].discount.toString()}%",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 10.sp,
                                                              color: Colors
                                                                  .yellow
                                                                  .shade500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          size.height * 0.01,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  1.8.w),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            //width: 21.w,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  '₹${_homePageController.getflashsellproduct!.result![index].price}' +
                                                                      "",
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        10.sp,
                                                                    color: MyTheme
                                                                        .ContainerUnSelectedColor,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top: 0.0
                                                                              .h),
                                                                  child: Text(
                                                                    '/${_homePageController.getflashsellproduct!.result![index].weight1} gm',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          8.sp,
                                                                      color: Colors
                                                                          .grey
                                                                          .shade200,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),

                                                          Spacer(),
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
                                                                Get.to(() =>
                                                                    LoginEmailPage());

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
                                                                      fontWeight:
                                                                          FontWeight
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
                                                                        0xffb5d047)
                                                                    //Colors.green,
                                                                    //Colors.cyan.shade400
                                                                  ],
                                                                ),
                                                                onPressed: () {
                                                                  // cartController.addProduct(
                                                                  //     Productss
                                                                  //         .products[index]);
                                                                  Get.to(() =>
                                                                      LoginEmailPage());
                                                                  print(
                                                                      'Add To cart');
                                                                },
                                                              ),
                                                            ),
                                                          ),

                                                          // InkWell(
                                                          //   onTap: () {
                                                          //     cartController.addProduct(Productss.products[index]);
                                                          //   },
                                                          //   child: Container(
                                                          //     height: 3.3.h,
                                                          //     width: 23.9.w,
                                                          //     decoration: BoxDecoration(
                                                          //         //color: MyTheme.loginbuttonColor,
                                                          //         gradient: MyTheme.gradient4,
                                                          //         borderRadius: BorderRadius.only(
                                                          //           bottomRight: Radius.circular(5),
                                                          //           bottomLeft: Radius.circular(5),
                                                          //         )),
                                                          //     child: Center(
                                                          //       child: Text(
                                                          //         'Add To Cart',
                                                          //         style: TextStyle(
                                                          //           color: Colors.white,
                                                          //           fontWeight: FontWeight.w500,
                                                          //           fontSize: 8.sp,
                                                          //         ),
                                                          //       ),
                                                          //     ),
                                                          //   ),
                                                          // ),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: size.height * 0.034,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: MyTheme.gradient2,
                        ),
                        //color: MyTheme.loginPageBoxColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 0.4.h),
                          child: Text(
                            'Our Offers',
                            style: TextStyle(
                              color: Colors.white,
                              //color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.w700,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: size.height * 0.2,
                        //width: double.infinity,
                        child: ListView.builder(
                            itemCount:
                                _homePageController.getouroffer!.result!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => (_homePageController.isLoading.value)
                                    ? Center(child: CircularProgressIndicator())
                                    : _homePageController
                                            .getouroffer!.result!.isEmpty
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
                                                  const EdgeInsets.all(2.0),
                                              child: Container(
                                                height: 15.h,
                                                width:
                                                    95.w, //size.width * 0.99,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  // color: MyTheme.ContainerUnSelectedColor,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      base +
                                                          '${_homePageController.getouroffer!.result![index].promotionalBannerPath}',
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
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
        //: Center(child: CircularProgressIndicator())
      ),
    );
  }
}
