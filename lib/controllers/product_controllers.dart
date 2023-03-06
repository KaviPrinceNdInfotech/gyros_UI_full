import 'package:get/state_manager.dart';
import 'package:gyros_app/models/product_model.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 2));
    var productResult = [
      Product(
          id: 1,
          price: 400,
          productDescription: 'Pure Ghee',
          productImage: 'lib/assets/asset/ghee_image.jpeg',
          productName: 'Ghee'),
      Product(
          id: 2,
          price: 100,
          productDescription: 'Mustard oil',
          productImage: 'lib/assets/asset/oil3.jpeg',
          productName: 'Oil'),
      Product(
          id: 3,
          price: 60.50,
          productDescription: 'Fresh Honey',
          productImage: 'lib/assets/asset/honey3.jpeg',
          productName: 'Honey'),
      Product(
          id: 4,
          price: 40,
          productDescription: 'Fresh Sweets',
          productImage: 'lib/assets/asset/sweet3.jpeg',
          productName: 'Sweets'),
      Product(
          id: 5,
          price: 80,
          productDescription: 'Fresh Sattu',
          productImage: 'lib/assets/asset/sattu4.jpeg',
          productName: 'Sattu'),
      Product(
          id: 6,
          price: 30,
          productDescription: 'Fresh Geggary',
          productImage: 'lib/assets/asset/gaggery2.jpeg',
          productName: 'Geggary'),
    ];

    products.value = productResult;
  }
}
