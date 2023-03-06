import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gyros_app/cart_modell/product_model.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';

class ProductDescription extends StatelessWidget {
  ProductDescription({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MyTheme.defaultPading * 2),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Text(
          product.des.toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
