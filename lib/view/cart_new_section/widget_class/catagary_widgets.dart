import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/view/cart_new_section/controllers_cart/catagaryy_controller.dart';
import 'package:sizer/sizer.dart';

class CategoryClass extends StatelessWidget {
  final Categorycontroller _categorycontroller = Get.put(Categorycontroller());
  CategoryClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _categorycontroller.categoryList.length,
          itemBuilder: (context, index) {
            return buildCategory(index);
          }),
    );
  }

  Widget buildCategory(int index) {
    return InkWell(
      onTap: () {
        _categorycontroller.changeIndex(index);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _categorycontroller.categoryList[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _categorycontroller.currentIndex.value == index
                      ? Colors.white
                      : Colors.white30,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                height: 2,
                width: 30,
                color: _categorycontroller.currentIndex.value == index
                    ? Colors.white
                    : Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
