import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/cart_modell/product_model.dart';
import 'package:gyros_app/view/cart_new_section/product_details/cart_lists/cart_list.dart';
import 'package:gyros_app/view/cart_new_section/product_details/product_detail_body/product_details_body.dart';
import 'package:gyros_app/view/cart_new_section/product_details/product_detail_controllerss/cart_new_controler.dart';
import 'package:gyros_app/view/cart_new_section/product_details/product_detail_controllerss/fav_counter_controller.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({Key? key, required this.product}) : super(key: key);
  final ProductModel product;
  FavCounterController _favCounterController = Get.find();
  CartNewController _cartNewController = Get.find();

  @override
  Widget build(BuildContext context) {
    //Todo initialise quantity here so it becomes 1 going back after detail page
    //Todo here if you have any function to increase in quantity then you have to increase no of items
    _cartNewController.initliaseQuantity();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(int.parse(product.color!)),
      appBar: buildAppbar(),
      body: ProductDetailsBody(
        product: product,
      ),
    );
  }

  buildAppbar() {
    return AppBar(
      backgroundColor: Color(int.parse(product.color!)),
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          )),
      actions: [
        Padding(
          padding: EdgeInsets.only(
            left: MyTheme.defaultPading,
            right: MyTheme.defaultPading,
            top: MyTheme.defaultPading,
          ),
          child:  Icon(Icons.shopping_cart),

    // Badge(
          //   badgeContent: Obx(
          //     () => Text(
          //       _favCounterController.numOfItem.value.toString(),
          //       style: TextStyle(
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          //   child: Icon(
          //     Icons.favorite,
          //     color: Colors.white,
          //   ),
          // ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => CartList(
                  product: product,
                ));
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: MyTheme.defaultPading,
              right: MyTheme.defaultPading,
              top: MyTheme.defaultPading,
            ),
            child: Icon(Icons.shopping_cart),
            // badges.Badge(
            //   badgeContent: Obx(
            //     () => Text(
            //       _cartNewController.totalQty.value.toString(),
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            //   child: Icon(
            //     Icons.shopping_cart_rounded,
            //     color: Colors.white,
            //   ),
            // ),
          ),
        ),
      ],
    );
  }
}
