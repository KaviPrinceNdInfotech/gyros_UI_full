import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gyros_app/view/login_page/login_pagee.dart';

//import 'package:gyros_app/widgets/circular_loader.dart';

import '../botttom_nav_bar/bottom_navbar.dart';
import '../intro_screen/intro_video/intro_video_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var prefs = GetStorage();
    String? checkToken = prefs.read('token');
    print(checkToken);
    if (checkToken != null) {
      token = checkToken;
    }
    Timer(
        Duration(seconds: 6),
        token != ''
            ? () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => NavBar()))
            : () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  ///TODO: _navController.tabindex(0);
  ///this is the problem we are using main thing in indexing loosing .

  @override
  Widget build(BuildContext context) {
    return IntroVideo();
  }
}

String? emailStore = '';
String? token = '';
