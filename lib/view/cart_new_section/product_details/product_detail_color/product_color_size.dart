import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gyros_app/cart_modell/product_model.dart';
import 'package:sizer/sizer.dart';

class ProductColorSize extends StatelessWidget {
  ProductColorSize({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 44),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,

                ///todo from here you have color of project in raw.
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     'Color',
              //     style: TextStyle(fontSize: 25),
              //   ),
              // ),
              // Row(
              //   // crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     ProductDetailColorDot(
              //       color: Color(int.parse(product.color.toString())),
              //       isSelected: true,
              //     ),
              //     ProductDetailColorDot(
              //       color: Colors.orange,
              //     ),
              //     ProductDetailColorDot(
              //       color: Colors.grey,
              //     ),
              //   ],
              // ),
            ],
          ),
          // Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Weight\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                TextSpan(
                    text: "${product.size} gm",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
