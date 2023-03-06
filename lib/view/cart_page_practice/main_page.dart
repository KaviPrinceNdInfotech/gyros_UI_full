import 'package:flutter/material.dart';
import 'package:gyros_app/1_widgets/custom_navbar.dart';
import 'package:gyros_app/view/cart_page_practice/shoping_page_practice.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: PageView(
            children: [
              ShoppingPage(),
            ],
          )),
          Align(alignment: Alignment.bottomCenter, child: CustomNavbar())
        ],
      ),
    );
  }
}
