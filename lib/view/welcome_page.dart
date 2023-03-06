import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/view/login_page/login_pagee.dart';
import 'package:sizer/sizer.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6), () {
      //here we have to navigate the main page next..........
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.themecolors,
      body: Stack(
        children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://i.pinimg.com/originals/31/09/73/31097321d200c996254670c2acfaac53.gif',
                      // 'https://images.ctfassets.net/a0g66secw40o/5arUfHMk7uuWeWe4g4yg0Y/7a3d60804f27fb5dab65ac0d397003a0/AU_Q3_Social_Facebook_V2.gif'
                      //'https://2obtaz1watdk1gq96f1dhka8-wpengine.netdna-ssl.com/wp-content/uploads/2019/08/18137427_web1_m-beets.jpg'
                      //'https://i.pinimg.com/originals/07/a1/b8/07a1b85ed52b683a37d0715b28e864b2.gif'
                      // 'https://img.freepik.com/free-photo/choosing-best-vegetables-shelf-grocery-store_342744-1115.jpg?t=st=1656746828~exp=1656747428~hmac=6e80766578c68d5cd19da1d4de3eb74a91d84b9b8b59786f786c01181cbe39ba&w=1800'
                      //'https://img.freepik.com/free-photo/flat-lay-assortment-vegetables_23-2148853350.jpg?w=1800'
                      //'https://img.freepik.com/free-photo/top-view-assortment-vegetables-paper-bag_23-2148853335.jpg?t=st=1656746481~exp=1656747081~hmac=4c5c0504f193e1c836d363ee6c0f332a452d6c2beaa7640b49fdb3b220247cc5&w=1800'
                      // 'https://images.unsplash.com/photo-1608686207856-001b95cf60ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80'
                      //'https://images.unsplash.com/photo-1584473457406-6240486418e9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
                      //'https://images.unsplash.com/photo-1579113800032-c38bd7635818?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                      // 'https://images.wallpapersden.com/image/download/las-vegas-night-hotel_Zmxtbm6UmZqaraWkpJRmbmdlrWZlbWU.jpg'
                      //'https://images.unsplash.com/photo-1628102491629-778571d893a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                      // 'https://static.onecms.io/wp-content/uploads/sites/28/2021/01/04/base-grand-hyatt-JUMP0121.jpg'
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 18.h,
                      ),
                      // Lottie.asset(
                      //   'lib/assets/asset/53616-shopping-list.json',
                      //   height: size.height * 0.5,
                      //   width: size.width * 0.7,
                      //   //repeat: false,
                      //   //reverse: false,
                      //   //animate: false,
                      // ),
                      // Image.network(
                      //   'https://thumbs.gfycat.com/HarmfulDefiniteKoalabear-max-1mb.gif',
                      //   height: 40.h,
                      //   width: 65.w,
                      // ),
                      // Lottie.asset(
                      //   'assets/LottieLogo1.json',
                      // ),

                      Container(
                        height: 29.h,
                        width: 72.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          //AppColors.themecolors,
                        ),
                        child: Image.asset(
                          'lib/assets/asset/guser_logo.png',
                          height: 29.h,
                          width: 70.w,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      if (Platform.isIOS)
                        const CupertinoActivityIndicator(
                          radius: 20,
                        )
                      else
                        const CircularProgressIndicator(
                          color: Colors.white,
                        ),

                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  signupButtonClickHandler() {
    print("Signup Button Clicked");
    Get.to(() => LoginPage());
  }
}
