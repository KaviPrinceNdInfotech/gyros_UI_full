// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import '../apiProviderImage.dart';
//
// import '../models/productDetailsModel.dart';
// import '../view/model_cart_practice/widgets/item_details_pageee/item_details_catagary.dart';
// import '../widgets/circular_loader.dart';
//
//
//
// class ProductDetailController extends GetxController {
//   RxInt selectedimg = 0.obs;
//   RxInt selectedprice = 0.obs;
//   RxBool isLoading = true.obs;
//   RxBool rating1 = false.obs;
//   RxBool rating2 = false.obs;
//   RxBool rating3 = false.obs;
//   RxBool rating4 = false.obs;
//   RxBool rating5 = false.obs;
//   var ratings = 0.0.obs;
//
//   void getImage(ImageSource imageSource) async {
//     final pickedFiles = await ImagePicker().pickImage(source: imageSource);
//     if (pickedFiles != null) {
//       selectedPath.value = pickedFiles.path;
//     } else {
//       Get.snackbar("Error", "No image Selected",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.blueGrey[100]);
//     }
//   }
//
//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController mobile = TextEditingController();
//   TextEditingController description = TextEditingController();
//
//   TextEditingController title = TextEditingController();
//   GlobalKey<FormState> reviewKey = GlobalKey<FormState>();
//   var selectedPath = ''.obs;
//   GetProductDetailModel? getProductDetailModel;
//   void getProductDetailsApi(var id) async {
//     Get.to(() => ItemDetailss());
//     isLoading(true);
//     getProductDetailModel = await ApiProviders.getProductDetails(id);
//     if (getProductDetailModel != null) {
//       isLoading(false);
//     }
//   }
//
//   // ======== Add Review ========= //
//   void addProductReviewApi(
//       //     var name,
//       // var email,
//       // var title,
//       // var description,
//       // var mobile,
//       // var rating1,
//       // var rating2,
//       // var rating3,
//       // var rating4,
//       // var rating5,
//       // var imagePath
//       )async {
//     CallLoader.loader();
//     http.Response r = await ApiProviders.postReview(
//         name.text,
//         email.text,
//         title.text,
//         description.text,
//         mobile.text,
//         rating1.value,
//         rating2.value,
//         rating3.value,
//         rating4.value,
//         rating5.value,
//         selectedPath.value);
//
//     if (r.statusCode == 200) {
//       CallLoader.hideLoader();
//     } else {
//       CallLoader.hideLoader();
//     }
//   }
// }

/// Todo
















import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../apiProviderImage.dart';
import '../models/productDetailsModel.dart';
import 'package:rating_dialog/rating_dialog.dart';
import '../view/model_cart_practice/widgets/item_details_pageee/item_details_catagary.dart';
import '../widgets/circular_loader.dart';


class ProductDetailController extends GetxController {
  RxInt selectedimg = 0.obs;
  RxInt selectedprice = 0.obs;
  RxBool isLoading = true.obs;
  RxBool rating1 = false.obs;
  RxBool rating2 = false.obs;
  RxBool rating3 = false.obs;
  RxBool rating4 = false.obs;
  RxBool rating5 = false.obs;

  var ratings = 0.0.obs;

  addReview() {
    Get.dialog(
      RatingDialog(
          title: Text("data"),
          starColor: Colors.amber,
          submitButtonText: "Post Review",
          onSubmitted: (response) {
            print(ratings.value);
          }),
    );
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController imagePath = TextEditingController();
  TextEditingController imagebase = TextEditingController();
  //TextEditingController title = TextEditingController();
  GlobalKey<FormState> reviewKey = GlobalKey<FormState>();

  var selectedPath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFiles = await ImagePicker().pickImage(source: imageSource);
    if (pickedFiles != null) {
      selectedPath.value = pickedFiles.path;
    } else {
      Get.snackbar("Error", "No image Selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueGrey[100]);
    }
  }

  RxInt star = 1.obs;

  GetProductDetailModel? getProductDetailModel;
  void getProductDetailsApi(var id) async {
    Get.to(() => ItemDetailss());
    isLoading(true);
    getProductDetailModel = await ApiProviders.getProductDetails(id);
    if (getProductDetailModel != null) {
      isLoading(false);
    }
  }

  // ======== Add Review ========= //
  void addProductReviewApi(
      // var name,
      // var email,
      // var title,
      // var description,
      // var mobile,
      // var rating1,
      // var rating2,
      // var rating3,
      // var rating4,
      // var rating5,
      // var imagePath
      ) async {
    CallLoader.loader();

     // http.Response r = await ApiProviders.postReview(
     //    name.text,
     //     mobile.text,
     //    email.text,
     //     description.text,
     //    title.text,
     //     rating1.value,
     //    rating2.value,
     //    rating3.value,
     //    rating4.value,
     //    rating5.value,
     //
     //    selectedPath.value
     // );

    http.Response r = await ApiProviders.postReview(
        name.text,
        mobile.text,
        email.text,
        description.text,
        title.text,
        rating1.value,
        rating2.value,
        rating3.value,
        rating4.value,
        rating5.value,
        // productid.text,
        imagePath.text,
        imagebase.text
       // selectedPath.value
    );

    if (r.statusCode == 200) {
      CallLoader.hideLoader();

    } else {
      CallLoader.hideLoader();
    }
  }
}
