import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../widgets/cart_product2.dart';
import '../widgets/catalog_product.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Screen 1'),
        actions: [
          InkWell(
              onTap: () {
                Get.to(() => Cartproducts());
              },
              child: Icon(Icons.shopping_cart)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 217, child: CatalogProducts()),
            ElevatedButton(
              onPressed: () => Get.to(() =>
                  //MyCart()),
                  Cartproducts()),
              child: Text('Add to Cart'),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
