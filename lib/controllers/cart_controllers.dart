import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:gyros_app/constants/shared_car_page_constant.dart';
import 'package:gyros_app/models/cart_model.dart';
import 'package:gyros_app/models/product_model.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import '../models/list_of_cart_model_api.dart';
import '../services/api_provider.dart';
import '../view/model_cart_practice/widgets/cart_product2.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxBool isLoading = true.obs;
  String cartlistid = '';
  String productid = '';
  // final cart = Cart(product: prduc).obs;

  var cartItems = <Cart>[].obs;
  int get count => cartItems.length;
  var count2 = 0.0;
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.product.price * item.qty);

  void addToCart(Product product) {
    try {
      if (isAlredyAdded(product)) {
        Get.snackbar("cek your cart", "${product.productName} is alredy added",
            backgroundColor: mainColor, duration: Duration(seconds: 1));
        print('udah di added');
      } else {
        var uuid = Uuid();
        String itemId = uuid.v4();
        cartItems.add(Cart(
          id: itemId,
          product: product,
          qty: 1,
        ));
        getTotalsMount();
        update();
      }
    } catch (e) {}
  }

  ////
  CartListModel? cartListModel;
  void CartListgApi() async {
    isLoading(true);

    cartListModel = await ApiProvider.GetCartApi();
    if (cartListModel != null) {
      //Get.to(() => ItemDetailss());
      isLoading(false);

      //Get.to(()=>Container());
    }
  }



  void addtocartApi(var Id) async {
    //CallLoader.loader();
    isLoading(true);
    http.Response r = await ApiProvider.AddToCartApi(Id);

    if (r.statusCode == 200 || r.statusCode != 200) {
      CartListgApi();


      ///TODO: we can navigate directly this page through this navigation with add to cart with Id.
      Get.to(
            () => Cartproducts(), //next page class
        duration: Duration(
            milliseconds: 300), //duration of transitions, default 1 sec
        transition:
        // Transition.leftToRight //transition effect
        // Transition.fadeIn
        //Transition.size
        Transition.zoom,
      );

      //CallLoader.hideLoader();
      //isLoading(false);
    }
  }

  bool isAlredyAdded(Product product) =>
      cartItems.where((item) => item.product.id == product.id).isNotEmpty;

  void decreasqty({
    required Cart cart,
  }) {
    if (cart.qty == 1) {
      removeCart(cart);

      Get.snackbar("berhasil", "item berhasil terhapus",
          duration: Duration(seconds: 1));
    } else {
      int index = cartItems.indexWhere((e) => e.id == cart.id);
      cartItems[index].qty = --cart.qty;
      getTotalsMount();
      update();
    }
  }

  void increasQty(Cart cart) {
    if (cart.qty >= 1) {
      cart.toggleDone();
      getTotalsMount();
      update();
    }
  }

  void removeCart(Cart cart) {
    cartItems.remove(cart);
    getTotalsMount();
    update();
  }

  void getTotalsMount() {
    double totalamount =
        cartItems.fold(0, (sum, item) => sum + item.product.price * item.qty);
    count2 = totalamount;
  }
}



//////////////////////////////////////////////////////////////////////Back up code of original code
// import 'package:get/get.dart';
// import 'package:get/state_manager.dart';
// import 'package:gyros_app/constants/shared_car_page_constant.dart';
// import 'package:gyros_app/models/cart_model.dart';
// import 'package:gyros_app/models/product_model.dart';
// import 'package:uuid/uuid.dart';
// import 'package:http/http.dart' as http;
// import '../models/list_of_cart_model_api.dart';
// import '../services/api_provider.dart';
// import '../view/model_cart_practice/widgets/cart_product2.dart';
//
// class CartController extends GetxController {
//   static CartController instance = Get.find();
//   RxBool isLoading = true.obs;
//   String cartlistid = '';
//   String productid = '';
//   // final cart = Cart(product: prduc).obs;
//
//   var cartItems = <Cart>[].obs;
//   int get count => cartItems.length;
//   var count2 = 0.0;
//   double get totalPrice =>
//       cartItems.fold(0, (sum, item) => sum + item.product.price * item.qty);
//
//   void addToCart(Product product) {
//     try {
//       if (isAlredyAdded(product)) {
//         Get.snackbar("cek your cart", "${product.productName} is alredy added",
//             backgroundColor: mainColor, duration: Duration(seconds: 1));
//         print('udah di added');
//       } else {
//         var uuid = Uuid();
//         String itemId = uuid.v4();
//         cartItems.add(Cart(
//           id: itemId,
//           product: product,
//           qty: 1,
//         ));
//         getTotalsMount();
//         update();
//       }
//     } catch (e) {}
//   }
//
//   ////
//   CartListModel? cartListModel;
//   void CartListgApi() async {
//     isLoading(true);
//
//     cartListModel = await ApiProvider.GetCartApi();
//     if (cartListModel != null) {
//       //Get.to(() => ItemDetailss());
//       isLoading(false);
//
//       //Get.to(()=>Container());
//     }
//   }
//
//
//
//   void addtocartApi(var Id) async {
//     //CallLoader.loader();
//     isLoading(true);
//     http.Response r = await ApiProvider.AddToCartApi(Id);
//
//     if (r.statusCode == 200) {
//       CartListgApi();
//
//
//       ///TODO: we can navigate directly this page through this navigation with add to cart with Id.
//       Get.to(
//             () => Cartproducts(), //next page class
//         duration: Duration(
//             milliseconds: 300), //duration of transitions, default 1 sec
//         transition:
//         // Transition.leftToRight //transition effect
//         // Transition.fadeIn
//         //Transition.size
//         Transition.zoom,
//       );
//
//       //CallLoader.hideLoader();
//       //isLoading(false);
//     }
//   }
//
//   bool isAlredyAdded(Product product) =>
//       cartItems.where((item) => item.product.id == product.id).isNotEmpty;
//
//   void decreasqty({
//     required Cart cart,
//   }) {
//     if (cart.qty == 1) {
//       removeCart(cart);
//
//       Get.snackbar("berhasil", "item berhasil terhapus",
//           duration: Duration(seconds: 1));
//     } else {
//       int index = cartItems.indexWhere((e) => e.id == cart.id);
//       cartItems[index].qty = --cart.qty;
//       getTotalsMount();
//       update();
//     }
//   }
//
//   void increasQty(Cart cart) {
//     if (cart.qty >= 1) {
//       cart.toggleDone();
//       getTotalsMount();
//       update();
//     }
//   }
//
//   void removeCart(Cart cart) {
//     cartItems.remove(cart);
//     getTotalsMount();
//     update();
//   }
//
//   void getTotalsMount() {
//     double totalamount =
//     cartItems.fold(0, (sum, item) => sum + item.product.price * item.qty);
//     count2 = totalamount;
//   }
// }
