import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key? key,
    required this.child,
    required this.gradient,
    this.width = 240,
    this.height = 70.0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.transparent,
                offset: Offset(0.0, 1.5),
                blurRadius: 2,
              ),
            ]),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          elevation: 0,
          child: InkWell(
              //onTap: () {},
              child: Center(
            child: child,
          )),
        ),
      ),
    );
  }
}
