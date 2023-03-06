// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gyros_app/constants/shared_car_page_constant.dart';
import 'package:gyros_app/controllers/cart_controllers.dart';
import 'package:gyros_app/controllers/product_controllers.dart';
import 'package:gyros_app/view/cart_page_practice/cart_page_practice.dart';
import 'package:sizer/sizer.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor2,
      body: Stack(
        children: [
          SafeArea(
              child: Container(
            margin: EdgeInsets.only(top: 50, left: 24, right: 24, bottom: 50),
            child: GetX<ShoppingController>(builder: (controller) {
              return StaggeredGridView.countBuilder(
                //scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                itemCount: controller.products.length,
                crossAxisSpacing: 16,
                itemBuilder: (contex, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: GestureDetector(
                      onTap: () {
                        // cartController.addToCart(controller.products[index]);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 13,
                          right: 13,
                        ),
                        height: 187,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: 130,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(
                                    controller.products[index].productImage),
                                fit: BoxFit.fitWidth,
                              )),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              controller.products[index].productName,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              controller.products[index].productDescription,
                              style: TextStyle(fontSize: 7.sp),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: 26.w,
                                    height: 4.w,
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text:
                                                  'Rs. ${controller.products[index].price}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10)),
                                          TextSpan(
                                              text: '/500g',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10,
                                                  color: Colors.green)),
                                        ],
                                      ),
                                    )

                                    // Text(
                                    //   'Rs. ${controller.products[index].price}\$/500gm',
                                    //   style: TextStyle(
                                    //       color: Colors.black45, fontSize: 10),
                                    // ),
                                    ),
                                Container(
                                  height: 4.h,
                                  width: 8.w,
                                  // decoration: BoxDecoration(
                                  //   image: DecorationImage(
                                  //       image: AssetImage(
                                  //           'lib/assets/asset/cook_gyros.png')),
                                  //
                                  //   // color: Colors.amber,
                                  // ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        cartController.addToCart(
                                            controller.products[index]);
                                      },
                                      icon: Icon(
                                        Icons.add_shopping_cart,
                                        color: Colors.red,
                                        size: 15.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              );
            }),
          )),
          SafeArea(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 8, 24, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //   Image(
                      //       height: 24,
                      //       width: 24,
                      //       image: AssetImage('lib/assets/asset/guser_logo.png')
                      //   ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            size: 20.sp,
                            color: Colors.green,
                          )),
                      Stack(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.shopping_cart),
                            onPressed: () {
                              Get.to(() => CartPage());
                            },
                          ),
                          Positioned(
                            top: 3,
                            right: 5,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.blue, shape: BoxShape.circle),
                              child: Center(
                                child:
                                    GetX<CartController>(builder: (controller) {
                                  return Text(
                                    controller.count.toString(),
                                    style: TextStyle(color: Colors.white),
                                  );
                                }),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 20, bottom: 28),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Container(
                  //         padding:
                  //             EdgeInsets.only(top: 13, left: 17, bottom: 13),
                  //         height: 50,
                  //         width: MediaQuery.of(context).size.width - 119,
                  //         decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(8))),
                  //         child: Row(
                  //           children: [
                  //             Icon(Icons.search),
                  //             SizedBox(width: 9),
                  //             Text(
                  //               'Search',
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //           height: 50,
                  //           width: 53,
                  //           decoration: BoxDecoration(
                  //             color: Colors.blue,
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(8)),
                  //             // image: DecorationImage(
                  //             //     image: AssetImage(
                  //             //         'lib/assets/asset/guser_logo.png')
                  //             // ),
                  //           ),
                  //           child: Center(
                  //               child: Icon(
                  //             Icons.dashboard_outlined,
                  //             size: 15.sp,
                  //             color: Colors.black,
                  //           )))
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       Container(
                  //           height: 26,
                  //           padding: EdgeInsets.all(4),
                  //           decoration: BoxDecoration(
                  //               borderRadius:
                  //                   BorderRadius.all(Radius.circular(8)),
                  //               color: Colors.blue),
                  //           child: Text('All')),
                  //       Container(
                  //           height: 26,
                  //           padding: EdgeInsets.all(4),
                  //           decoration: BoxDecoration(
                  //               borderRadius:
                  //                   BorderRadius.all(Radius.circular(8)),
                  //               color: Colors.white),
                  //           child: Text('Adidas')),
                  //       Container(
                  //           height: 26,
                  //           padding: EdgeInsets.all(4),
                  //           decoration: BoxDecoration(
                  //               borderRadius:
                  //                   BorderRadius.all(Radius.circular(8)),
                  //               color: Colors.white),
                  //           child: Text('Converse')),
                  //       Container(
                  //           height: 26,
                  //           padding: EdgeInsets.all(4),
                  //           decoration: BoxDecoration(
                  //               borderRadius:
                  //                   BorderRadius.all(Radius.circular(8)),
                  //               color: Colors.white),
                  //           child: Text('New Balance')),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
