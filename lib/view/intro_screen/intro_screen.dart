import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../onboardonds/onboarding_screens.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        //color: Colors.white,
        gradient: MyTheme.gradient1,
        // image: DecorationImage(
        //     image: NetworkImage(
        //         'https://img.freepik.com/free-photo/fresh-fruits-vegetables-reusable-green-shopping-bag-wood-table-with-supermarket-grocery-store-blurred-defocused-background_293060-4440.jpg?w=2000'),
        //     fit: BoxFit.fitHeight),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 23.h,
          ),
          Container(
            height: 30.h,
            width: 60.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: AnimatedSplashScreen(
              duration: 6000,
              splashIconSize: 270,
              splash: 'lib/assets/asset/guser_logo.png',
              nextScreen: OnboardingPage(),
              //LoginPage(),
              splashTransition: SplashTransition.rotationTransition,
              //pageTransitionType: PageTransitionType.scale,
              backgroundColor: Colors.transparent,
              //MyTheme.loginbuttonColor,
            ),
          ),
          Container(
            height: 30.h,
            child: SplashScreenView(
              navigateRoute: OnboardingPage(),
              //LoginPage(),
              duration: 6000,
              imageSize: 290,
              //imageSrc: "lib/assets/asset/guser_logo.png",
              text: "WELCOME \nTO \nGYROS",
              textType: TextType.ColorizeAnimationText,
              textStyle: TextStyle(
                  fontSize: 42.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'poppin',
                  foreground: Paint()
                    ..style = PaintingStyle.fill
                    ..strokeWidth = 8),
              colors: [
                Colors.yellow,
                Colors.green.shade500,
                Colors.green.shade500,
                Colors.white,
              ],
              backgroundColor: Colors.transparent,
              //MyTheme.loginbuttonColor,
            ),
          ),
        ],
      ),
    );
  }
}
