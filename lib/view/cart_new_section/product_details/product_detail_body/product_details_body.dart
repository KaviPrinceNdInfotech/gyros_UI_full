import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gyros_app/cart_modell/product_model.dart';
import 'package:gyros_app/view/cart_new_section/product_details/add_to_cardss/add_to_cart_page.dart';
import 'package:gyros_app/view/cart_new_section/product_details/product_detail_color/product_color_size.dart';
import 'package:gyros_app/view/cart_new_section/product_details/product_detail_color/product_counter_with_fav.dart';
import 'package:gyros_app/view/cart_new_section/product_details/product_detail_color/product_description.dart';
import 'package:gyros_app/view/cart_new_section/product_details/product_detail_title_price/product_detail_title_price.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsBody extends StatelessWidget {
  ProductDetailsBody({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.29),
                  height: size.height * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(MyTheme.defaultPading),
                    child: Column(
                      children: [
                        ProductColorSize(product: product),
                        ProductDescription(product: product),
                        ProductCounterWithFavIcon(product: product),
                        AddToCartPage(product: product),
                      ],
                    ),
                  ),
                ),
                ProductDetailsImageTitlePrice(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
