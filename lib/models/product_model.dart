import 'package:get/state_manager.dart';

class Product {
  int id;
  String productName;
  String productImage;
  String productDescription;
  double price;

  Product({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.productDescription,
    required this.price,
  });

  final isFavorite = false.obs;
}
