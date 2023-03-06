import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/cart_modell/product_model.dart';
import 'package:gyros_app/view/cart_new_section/product_details/product_detail_controllerss/cart_new_controler.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';

class AddToCartPage extends StatelessWidget {
  AddToCartPage({Key? key, required this.product}) : super(key: key);

  final ProductModel product;
  CartNewController _cartNewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MyTheme.defaultPading),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _cartNewController.addItemInCart(product);
              //_cartNewController.numOfItems.(product);
            },
            child: Container(
              margin: EdgeInsets.only(right: MyTheme.defaultPading),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color(int.parse(product.color.toString())),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Color(int.parse(product.color.toString()))),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                        Color(int.parse(product.color.toString())))),
                child: Text(
                  'Buy Now'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
