import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/constants/buttons/customs_buttons.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/view/home_page/home_pages.dart';
import 'package:gyros_app/view/login_page/login_with_email/login_email.dart';
import 'package:gyros_app/view/signup/signup_page.dart';
import 'package:sizer/sizer.dart';

import 'login_otp/login_mobile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.themecolors,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1616344091740-af6b6859bb01?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fGhvbmV5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                      //'https://images.unsplash.com/photo-1579113800032-c38bd7635818?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
                      //'https://img.freepik.com/free-photo/woman-with-tablet-buying-healthy-food-supermarket-grocery-store_342744-1110.jpg?t=st=1656747606~exp=1656748206~hmac=cad4fcedf9befb2991319f1634acc32b038e0757fc8cb569c84777d87febd9be&w=1800'
                      //'https://images.unsplash.com/photo-1579113800032-c38bd7635818?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
                      //'https://images.wallpapersden.com/image/download/las-vegas-night-hotel_Zmxtbm6UmZqaraWkpJRmbmdlrWZlbWU.jpg'
                      //'https://i.pinimg.com/originals/01/96/c1/0196c1f3432b1a2ebac601dadb7b92cd.jpg'
                      ),
                  fit: BoxFit.fitHeight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 10.h,
              // ),
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Image.asset('lib/assets/asset/guser_logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),

              Text(
                'Choose an options.',
                style: GoogleFonts.actor(
                  color: Colors.white,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),

              CustomButtom(
                buttonColor: MyTheme.loginbuttonColor,
                buttontext: 'SIGN IN',

                textColor: Colors.white,
                //Theme.of(context).colorScheme.onPrimary,
                handleButtonClick: loginButtonClickHandler,
              ),

              SizedBox(
                height: 2.h,
              ),

              CustomButtom(
                buttonColor: MyTheme.loginbuttonColor,
                buttontext: 'LOGIN WITH OTP',

                textColor: Colors.white,
                //Theme.of(context).colorScheme.onPrimary,
                handleButtonClick: loginButtonClickHandlerOTP,
              ),

              SizedBox(
                height: 15,
              ),

              CustomButtom(
                buttonColor: MyTheme.signUpButtonColor,
                buttontext: 'SIGNUP',
                textColor: Colors.white,
                // textColor: Theme.of(context).colorScheme.primary,
                handleButtonClick: signupButtonClickHandler,
              ),

              SizedBox(
                height: 15,
              ),

              CustomButtom(
                buttonColor: MyTheme.containercolor7,
                buttontext: 'SKIP',
                textColor: Colors.white,
                //Theme.of(context).colorScheme.onPrimary,
                handleButtonClick: loginButtonClickHandlerPhone,
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  loginButtonClickHandlerPhone() {
    print("Login Phone Clicked");
    Get.to(() => HomePage());
  }

  loginButtonClickHandler() {
    print("Login Clicked");
    Get.to(() => LoginEmailPage());

    ///login main page api with future builder below page........
    //Get.to(LoginMainPage());
  }

  loginButtonClickHandlerOTP() {
    print("Login Clicked");
    Get.to(() => LoginPhoneEmail());

    ///login main page api with future builder below page........
    //Get.to(LoginMainPage());
  }

  signupButtonClickHandler() {
    print("Signup Button Clicked");
    Get.to(SignUp());
  }
}
