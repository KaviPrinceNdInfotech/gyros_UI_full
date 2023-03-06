import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/cart_modell/product_model.dart';
import 'package:gyros_app/view/cart_new_section/product_details/product_detail_controllerss/fav_counter_controller.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:sizer/sizer.dart';

import 'cart_counter_incre_decre.dart';

class ProductCounterWithFavIcon extends StatelessWidget {
  ProductCounterWithFavIcon({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  FavCounterController _favCounterController = Get.find();

  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MyTheme.defaultPading, vertical: MyTheme.defaultPading),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CartCounter(product: product),
          InkWell(
            onTap: () {
              _favCounterController.addFavItemToList(product);

              print("liked");
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
