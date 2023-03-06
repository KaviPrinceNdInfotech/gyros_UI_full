import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gyros_app/cart_modell/product_model.dart';

class FavCounterController extends GetxController {
  var numOfItem = 0.obs;

  var favList = <ProductModel>[].obs;

  void addFavItemToList(ProductModel product) {
    if (!favList.contains(product)) {
      favList.add(product);

      numOfItem++;
    } else {
      Get.snackbar(
        'Already there',
        'You already Liked this Item!!',
        backgroundColor: Color(int.parse(product.color.toString())),
        snackPosition: SnackPosition.TOP,
        borderColor: Colors.indigo,
        borderRadius: 10,
        colorText: Colors.black,
        borderWidth: 2,
        barBlur: 0,
      );
    }
  }
}
