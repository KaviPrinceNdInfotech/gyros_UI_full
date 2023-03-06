import 'package:flutter/material.dart';
// import 'package:get_x_latihan/models/product.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/1_widgets/cart_cardss.dart';
import 'package:gyros_app/constants/shared_car_page_constant.dart';
import 'package:gyros_app/controllers/cart_controllers.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find();

  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greyColor2,
        appBar: AppBar(
          elevation: 0,
          leading: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.green,
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Cart',
            style: TextStyle(color: Colors.green),
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(24, 30, 24, 0),
          child: Stack(
            children: [
              ListView(
                children: [
                  GetX<CartController>(builder: (controller) {
                    return Column(
                        children: cartController.cartItems
                            .map((e) => Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: CartCArd(
                                  function1: () {
                                    cartController.increasQty(e);
                                  },
                                  function2: () {
                                    cartController.decreasqty(cart: e);
                                  },
                                  product: e,
                                )))
                            .toList());
                  }),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(top: 3),
                    color: greyColor2,
                    width: double.infinity,
                    height: 120,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total', style: TextStyle(fontSize: 18)),
                            GetBuilder<CartController>(builder: (controller) {
                              return Text(
                                'Rs ${controller.count2}',
                                style: TextStyle(fontSize: 20),
                              );
                            }),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: MyTheme.gradient2,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Center(
                            child: Text(
                              'Checkout',
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
