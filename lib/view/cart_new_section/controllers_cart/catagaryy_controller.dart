import 'package:get/get.dart';

class Categorycontroller extends GetxController {
  var currentIndex = 0.obs;

  List<String> categoryList = [
    'Ghee',
    'Honey',
    'variable',
    'Pulses',
    'Oil',
    'Milk',
    'Curd',
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
