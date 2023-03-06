import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                color: Colors.redAccent,
              ),
              Container(
                height: 100.h,
                width: 100.w,
                color: Colors.green,
              ),
              Container(
                height: 100.h,
                width: 100.w,
                color: Colors.orange,
              ),
            ],
          )
        ],
      ),
    );
  }
}
