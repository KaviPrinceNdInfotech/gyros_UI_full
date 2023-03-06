// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:nike_shoe/Model/getProductModel.dart';
// // import 'package:nike_shoe/Services/api_Provider.dart';
//
// import 'api_provider.dart';
// import 'getProductModel.dart';
//
// class ProductssController extends GetxController {
//   RxBool isLoading = true.obs;
//   GetProductModel? getProductModel;
//   @override
//   onInit() {
//     getProductApi();
//
//     super.onInit();
//   }
//
//   void getProductApi() async {
//     isLoading(true);
//     getProductModel = await ApiProviders.getAllProduct();
//     if (getProductModel != null) {
//       isLoading(false);
//
//       foundProducts.value = getProductModel!.result!;
//     }
//   }
//
//   // List<Result>? allProduct;
//   // LevelUp() {
//   //   allProduct = getProductModel!.result!;
//   // }
//
//   RxList<Result> foundProducts = RxList<Result>([]);
//
//   void filterProducts(String searchproductName) {
//     List<Result> finalResults = [];
//     if (searchproductName.isEmpty) {
//       finalResults = getProductModel!.result!;
//     } else {
//       finalResults = getProductModel!.result!
//           .where((element) =>
//       // print(element.productName);
//       // print(productName);
//       // print(element.productName
//       //     .toString()
//       //     .toLowerCase()
//       //     .contains(productName.toString().toLowerCase().trim()));
//       element.productName
//           .toString()
//           .toLowerCase()
//           .contains(searchproductName.toString().toLowerCase().trim()))
//           .toList();
//     }
//     print(finalResults.length);
//     foundProducts.value = finalResults;
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'apiProviderImage.dart';
import 'api_provider.dart';
import 'getProductModel.dart';

class ProductssController extends GetxController {
  RxBool isLoading = true.obs;
  GetProductModel? getProductModel;
  @override
  onInit() {
    getProductApi();

    super.onInit();
  }

  void getProductApi() async {
    isLoading(true);
    getProductModel = await ApiProviders.getAllProduct();
    if (getProductModel != null) {
      isLoading(false);

      foundProducts.value = getProductModel!.result!;
    }
  }

  // List<Result>? allProduct;
  // LevelUp() {
  //   allProduct = getProductModel!.result!;
  // }

  RxList<Result> foundProducts = RxList<Result>([]);

  void filterProducts(String searchproductName) {
    List<Result> finalResults = [];
    if (searchproductName.isEmpty) {
      finalResults = getProductModel!.result!;
    } else {
      finalResults = getProductModel!.result!
          .where((element) =>
      // print(element.productName);
      // print(productName);
      // print(element.productName
      //     .toString()
      //     .toLowerCase()
      //     .contains(productName.toString().toLowerCase().trim()));
      element.productName
          .toString()
          .toLowerCase()
          .contains(searchproductName.toString().toLowerCase().trim()))
          .toList();
    }
    print(finalResults.length);
    foundProducts.value = finalResults;
  }
}
