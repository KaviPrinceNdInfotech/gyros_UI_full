// import 'package:equatable/equatable.dart';

import 'package:gyros_app/models/product_model.dart';

class Cart {
  String id;
  Product product;
  int qty;

  Cart({this.id = "", required this.product, this.qty = 0});

  Cart copyWith({
    required String id,
    required Product product,
    required int qty,
  }) =>
      Cart(id: id, product: product, qty: qty);

  /// here we will find add plus minus.........
  List<Object> get props => [id, qty, product];

  void toggleDone() {
    qty++;
  }

  void decreaseDown() {
    qty--;
  }
}
