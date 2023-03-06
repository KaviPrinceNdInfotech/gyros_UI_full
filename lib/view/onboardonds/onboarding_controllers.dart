import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:gyros_app/view/login_page/login_pagee.dart';

import 'onboarding_models.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  // forwardAction() {
  //   if (isLastPage) {
  //     //pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  //     Get.to(() => LoginPage());
  //     //LoginPage();
  //     //go to home page
  //   } else
  //     pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  // }

  forwardAct() {
    if (isLastPage)
      Get.to(() => LoginPage());
    else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('lib/assets/asset/75687-grocery.json', 'Order Your Items',
        'Now you can order Items any time  right from your mobile.'),
    OnboardingInfo(
        'lib/assets/asset/92187-healthy-food-courier-fight-againts-covid-viruses.json',
        'Safe Food',
        'We send  fresh and pure item '),
    OnboardingInfo('lib/assets/asset/85315-delivery-boy.json', 'Quick Delivery',
        'Orders your favorite items expected delivery in 20 minutes.'),
  ];
}
