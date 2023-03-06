import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gyros_app/cart_modell/product_model.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';

class ProductDetailsImageTitlePrice extends StatelessWidget {
  ProductDetailsImageTitlePrice({Key? key, required this.product})
      : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MyTheme.defaultPading),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name.toString(),
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MyTheme.defaultPading * 12,
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Price\n",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                          text: product.price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  width: MyTheme.defaultPading * 5,
                  //height: size.height * 0.6,
                ),
                Expanded(
                    child: Hero(
                  tag: product.id.toString(),
                  child: Image.asset(
                    product.image.toString(),
                    fit: BoxFit.fill,
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
