import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';

class ProductDetailColorDot extends StatelessWidget {
  ProductDetailColorDot(
      {Key? key, required this.color, this.isSelected = false})
      : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      margin: EdgeInsets.only(
          top: MyTheme.defaultPading * 0.5,
          left: MyTheme.defaultPading * 0.5,
          right: MyTheme.defaultPading * 0.5),
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isSelected ? color : Colors.transparent),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
