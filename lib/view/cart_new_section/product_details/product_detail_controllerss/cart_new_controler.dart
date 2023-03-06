import 'package:get/get.dart';
import 'package:gyros_app/cart_modell/product_model.dart';

class CartNewController extends GetxController {
  var numOfItem = 0.obs;
  var numOfItems = 1.obs;
  var totalQty = 0.obs;
  var totalAmount = 0.obs;
  var cartItems = <ProductModel>[].obs;

  void removeItem() {
    if (numOfItems.value > 1) {
      numOfItems.value--;
    }
  }

  void addItem() {
    numOfItems.value++;
  }

  void addItemInCart(ProductModel product) {
    //final index = cartItems.indexWhere((element) => element.product == product);

    cartItems.add(product);

    totalQty.value = totalQty.value + numOfItems.value;
    numOfItems.value = 1;
    totalAmount.value = totalAmount.value +
        ((int.parse(product.price.toString())) * totalQty.value);
  }

  void initliaseQuantity() {
    numOfItems.value = 1;
  }
}
