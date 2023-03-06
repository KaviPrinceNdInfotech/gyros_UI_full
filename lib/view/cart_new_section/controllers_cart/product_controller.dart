import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gyros_app/cart_modell/product_model.dart';

class ProductController extends GetxController {
  var product = <ProductModel>[].obs;
  var isDataloadingCompleated = false.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    fetchdata();
  }

  Future<void> fetchdata() async {
    var productjson =
        await rootBundle.loadString("lib/assets/json/pdoducy.json");

    var decodeData = jsonDecode(productjson);

    print(decodeData);

    product.value =
        List.from(decodeData).map((e) => ProductModel.fromJson(e)).toList();
    //List.from(decodeData).map((e) => ProductModel.fromMap(e)).toList();
    isDataloadingCompleated.value = true;
  }

  void destroy() {
    product.value = [];
  }
}
