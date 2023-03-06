import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/view/model_cart_practice/controllers/cart_controllersss.dart';
import 'package:gyros_app/view/model_cart_practice/procucts_cart_modelss.dart';
import 'package:gyros_app/view/model_cart_practice/widgets/gradient_button.dart';
import 'package:sizer/sizer.dart';

import 'item_details_pageee/item_details_catagary.dart';
//import 'package:shoping_cart_get_x/controllers/cart_controller.dart;

class CatalogProducts extends StatelessWidget {
  const CatalogProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: size.height * 0.32,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Productss.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CatalogProductCart(index: index);
                  })),
        ],
      ),
    );
  }
}

class CatalogProductCart extends StatelessWidget {
  final cartController = Get.put(CartController());
  final int index;
  CatalogProductCart({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {
            // _homePageController.toggle(index);
            if (index == 0) {
              //Get.to(() => ManPage());
              //Get.to(() => BestSeller());
              //Get.to(() => WaterTracking());
            } else if (index == 1) {
              //Get.to(() => ManPage());
            } else if (index == 2) {
              //Get.to(() => BestSeller());
              //Get.to(() => WalkTracking());
            } else if (index == 3) {
              //Get.to(() => WalkTracking());
            } else if (index == 4) {
              //Get.to(() => BestSeller());
              //Get.to(() => WalkTracking());
            }
          },
          child: PhysicalModel(
            borderRadius: BorderRadius.circular(5),
            color: MyTheme.ThemeColors,
            elevation: 0.1,
            child: Container(
              height: 26.h,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
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
                  SizedBox(
                    height: 0.7.h,
                  ),
                  PhysicalModel(
                    shadowColor: Colors.green,
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                    elevation: 5,
                    child: InkWell(
                      onTap: () {
                        //Navigator.of(context).push(_createRoute());

                        Get.to(
                          () => ItemDetailss(
                              // name: Productss.products[index].name,
                              // price: Productss.products[index].price,
                              // weight: Productss.products[index].weight,
                              // imageUrl: Productss.products[index].imageUrl,
                              // description: Productss.products[index].descriptions,
                              // color: Productss.products[index].color,
                              // id: Productss.products[index].id,

                              // index: index,

                              //cartController.products[index].toString(),

                              // product:pr,
                              ), //next page class
                          duration: Duration(
                              milliseconds:
                                  500), //duration of transitions, default 1 sec
                          transition:
                              // Transition.leftToRight //transition effect
                              // Transition.fadeIn
                              //Transition.size
                              Transition.zoom,
                        );
                      },
                      child: Container(
                        height: size.height * 0.15,
                        width: size.width * 0.33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          // border: Border.all(
                          //     color: AppColors.themecolors),
                          image: DecorationImage(
                              image: AssetImage(
                                  Productss.products[index].imageUrl),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(
                            Productss.products[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.9.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.7.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Productss.products[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 11.sp,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Save${Productss.products[index].discount}%",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            color: Colors.red.shade300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "₹${Productss.products[index].oldprice.toString()}",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w500,
                          fontSize: 7.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.8.w),
                    child: Row(
                      children: [
                        SizedBox(
                          //width: 21.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '₹${Productss.products[index].price.toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                  color: MyTheme.loginbuttonColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0.3.h),
                                child: Text(
                                  '/${Productss.products[index].weight} gm',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 7.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Spacer(),
                        Container(
                          height: 3.3.h,
                          width: 23.5.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: InkWell(
                            onTap: () {
                              // cartController
                              //     .addProduct(Productss.products[index]);
                            },
                            child: RaisedGradientButton(
                              //height: 3.3.h,
                              //width: 23.9.w,
                              child: Text(
                                'Add To Cart',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 8.sp),
                              ),
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Colors.green,
                                  Colors.cyan.shade400
                                ],
                              ),
                              onPressed: () {
                                // cartController
                                //     .addProduct(Productss.products![index]);
                                print('Add To cart');
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
      ),

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     CircleAvatar(
      //       radius: 40,
      //       backgroundImage: AssetImage(
      //         Productss.products[index].imageUrl,
      //       ),
      //     ),
      //     SizedBox(
      //       width: 30,
      //     ),
      //     Expanded(
      //         child: Text(
      //       Productss.products[index].name,
      //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      //     )),
      //     Expanded(child: Text('${Productss.products[index].price}')),
      //     IconButton(
      //       onPressed: () {
      //         cartController.addProduct(Productss.products[index]);
      //       },
      //       icon: Icon(Icons.add_shopping_cart),
      //     ),
      //   ],
      // ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ItemDetailss(
          // name: Productss.products[index].name,
          // price: Productss.products[index].price,
          // weight: Productss.products[index].weight,
          // imageUrl: Productss.products[index].imageUrl,
          // description: Productss.products[index].descriptions,
          // color: Productss.products[index].color,
          // id: Productss.products[index].id,

          //index: index,

          //cartController.products[index].toString(),

          // product:pr,
          ),
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
