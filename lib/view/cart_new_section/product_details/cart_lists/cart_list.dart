import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/cart_modell/product_model.dart';
import 'package:gyros_app/view/cart_new_section/product_details/product_detail_controllerss/cart_new_controler.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';

class CartList extends StatelessWidget {
  CartList({Key? key, required this.product}) : super(key: key);
  final ProductModel product;
  CartNewController _cartNewController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.75,
            width: double.infinity,
            child: ListView.builder(
                itemCount: _cartNewController.cartItems.length,
                itemBuilder: (context, index) {
                  var currentItem = _cartNewController.cartItems[index];
                  return Card(
                    clipBehavior: Clip.none,
                    color: Color(int.parse(product.color.toString())),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          currentItem.image.toString(),
                          width: 100,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text(
                            //   'Name:${product.name.toString()}',
                            //   style: TextStyle(color: Colors.white),
                            // ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Quantity ${_cartNewController.totalQty.value}',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MyTheme.defaultPading, right: MyTheme.defaultPading),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    'Total Amount:\n ${_cartNewController.totalAmount.value.toString()}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Text(
                  'Total Quantity:\n ${_cartNewController.totalQty.value as int}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
