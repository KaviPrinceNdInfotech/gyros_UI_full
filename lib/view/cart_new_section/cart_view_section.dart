import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_navbar.dart';
import 'package:gyros_app/view/cart_new_section/product_details/product_detailss.dart';
import 'package:gyros_app/view/cart_new_section/widget_class/class_cart_component.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';

import 'controllers_cart/product_controller.dart';

class CartPageView extends StatelessWidget {
  CartPageView({Key? key}) : super(key: key);

  ProductController _productController = Get.put(ProductController());
  NavController _navController = Get.find();

  //Categorycontroller _categorycontroller = Get.put(Categorycontroller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            _navController.tabindex(0);
            Get.to(() => NavBar());
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: MyTheme.ThemeColors,
          ),
        ),
        elevation: 0,
        title: Text(
          'Product',
          style: TextStyle(
            color: MyTheme.ThemeColors,
            fontWeight: FontWeight.bold,
          ),
          // style: Theme.of(context)
          //     .textTheme
          //     .headline5!
          //     .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        //Theme.of(context).colorScheme.onPrimary,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //CategoryClass(),
              Obx(() => _productController.isDataloadingCompleated.value == true
                  ? Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MyTheme.defaultPading,
                            horizontal: MyTheme.defaultPading),
                        child: GridView.builder(
                            itemCount: _productController.product.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: MyTheme.defaultPading,
                                    crossAxisSpacing: MyTheme.defaultPading,
                                    childAspectRatio: 0.65,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              var currentProduct =
                                  _productController.product[index];
                              return ItemCard(
                                currentProduct: currentProduct,
                                cardClickHandler: () {
                                  Get.to(() => ProductDetailPage(
                                        product: currentProduct,
                                      ));
                                },
                              );
                            }),
                      ),
                    )
                  : CircularProgressIndicator(
                      color: Colors.redAccent,
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
