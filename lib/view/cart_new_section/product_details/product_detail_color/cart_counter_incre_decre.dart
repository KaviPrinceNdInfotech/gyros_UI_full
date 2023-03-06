import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/cart_modell/product_model.dart';
import 'package:gyros_app/view/cart_new_section/product_details/product_detail_controllerss/cart_new_controler.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';

class CartCounter extends StatelessWidget {
  CartCounter({Key? key, required this.product}) : super(key: key);
  CartNewController _cartNewController = Get.find();

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(Icons.remove, () {
          _cartNewController.removeItem();
        }),

        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MyTheme.defaultPading,
              vertical: MyTheme.defaultPading),

          //Todo here we will use getx ..........

          child: GetX<CartNewController>(
            init: CartNewController(),
            builder: (val) => Text(
              _cartNewController.numOfItems.toString(),
            ),
          ),
        ),
        buildOutlineButton(Icons.add, () {
          _cartNewController.addItem();
        }),
        // buildIco
      ],
    );
  }

  buildOutlineButton(IconData icon, Function press) {
    return Container(
      height: 32,
      width: 40,
      decoration: BoxDecoration(
        color: Color(int.parse(product.color.toString())),
        borderRadius: BorderRadius.circular(30),
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            elevation: 20,
            minimumSize: Size(100, 50),
            shadowColor: Color(
              int.parse(product.color.toString()),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: () {
          press();
        },
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}
