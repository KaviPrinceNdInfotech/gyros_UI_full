import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/constants/buttons/customs_buttons.dart';
import 'package:gyros_app/controllers/reset_password/reset_ps_email_controllers.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/view/reset_password/forget_email_code.dart';
import 'package:sizer/sizer.dart';

class Forgetpasswords extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  ResetEmailController _resetEmailController = Get.find();
  Forgetpasswords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _resetEmailController.resetEmailFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1610508500445-a4592435e27e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
                          // 'https://images.unsplash.com/photo-1605194000384-439c3ced8d15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                          // 'https://images.unsplash.com/photo-1605276277265-84f97980a425?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                          //'https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3dlZXRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                          //'https://images.unsplash.com/photo-1551844547-043f512dc4d9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHN3ZWV0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'
                          //'https://images.unsplash.com/photo-1471943311424-646960669fbc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
                          //'https://images.pexels.com/photos/7267050/pexels-photo-7267050.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
                          //'https://images.pexels.com/photos/6280388/pexels-photo-6280388.jpeg?auto=compress&cs=tinysrgb&w=600'
                          //'https://images.pexels.com/photos/6674392/pexels-photo-6674392.jpeg?auto=compress&cs=tinysrgb&w=600'
                          //'https://images.pexels.com/photos/4258186/pexels-photo-4258186.jpeg?auto=compress&cs=tinysrgb&w=600',
                          //'https://images.unsplash.com/photo-1590779033100-9f60a05a013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
                          //'https://img.freepik.com/free-photo/fresh-vegetables-with-price-tags-shelf-grocery-store-supermarket_342744-1397.jpg?w=1800&t=st=1656765079~exp=1656765679~hmac=960f81d4a643d71d68c26c50e5b182ce5cee8ee12935b54cbf72f66ea89c3425'
                          //'https://images.unsplash.com/photo-1608686207856-001b95cf60ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80'
                          //'https://img.freepik.com/free-photo/woman-with-tablet-buying-healthy-food-supermarket-grocery-store_342744-1110.jpg?t=st=1656747606~exp=1656748206~hmac=cad4fcedf9befb2991319f1634acc32b038e0757fc8cb569c84777d87febd9be&w=1800'
                          // 'https://images.unsplash.com/photo-1579113800032-c38bd7635818?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
                          //'https://images.wallpapersden.com/image/download/las-vegas-night-hotel_Zmxtbm6UmZqaraWkpJRmbmdlrWZlbWU.jpg'
                          //'https://i.pinimg.com/originals/01/96/c1/0196c1f3432b1a2ebac601dadb7b92cd.jpg'
                          ),
                      fit: BoxFit.fill)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
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
                  // Lottie.asset(
                  //   'lib/assets/asset/76899-delivery-grocery-and-food.json',
                  //   height: size.height * 0.4,
                  //   width: size.width * 0.9,
                  //   //repeat: false,
                  //   //reverse: false,
                  //   //animate: false,
                  // ),

                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Enter Your Email address',
                    style: GoogleFonts.actor(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.h),
                    child: Text(
                      "We'll send you a verification code on your email",
                      style: GoogleFonts.actor(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.13,
                    margin: EdgeInsets.symmetric(vertical: 0),
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                    decoration: BoxDecoration(
                      //color: MyTheme.loginPageBoxColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      style: TextStyle(
                        color: MyTheme.ThemeColors,
                      ),
                      cursorColor: MyTheme.ThemeColors,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 3,
                            color: MyTheme.ThemeColors,
                          ),
                        ),
                        errorStyle: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w700),
                        //border: InputBorder.none,
                        fillColor: MyTheme.loginPageBoxColor,
                        filled: true,
                        focusColor: MyTheme.loginPageBoxColor,
                        border: OutlineInputBorder(
                          //borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 2, color: MyTheme.ThemeColors),
                        ),
                        //labelText: "Email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: MyTheme.ThemeColors,
                        ),
                        hintText: 'Enter Your Email',
                        hintStyle: TextStyle(color: MyTheme.ThemeColors),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: _resetEmailController.emailController,
                      onSaved: (value) {
                        _resetEmailController.email = value!;
                      },
                      validator: (value) {
                        return _resetEmailController.validateEml(value!);
                      },
                    ),
                  ),

                  // TextFieldDecorator(
                  //   child: UserIdTextField(
                  //     // useridTextFieldPrefixicon
                  //     useridController: emailController,
                  //     userIdErrorText: 'Email can not be empty',
                  //     userIdHintText: 'Enter Email',
                  //     userIdHintTextColor: AppColors.themecolors,
                  //     userIdErrorTextColor: AppColors.themecolors,
                  //     useridTextFieldPrefixIcon: Icons.email,
                  //     useridTextFieldPrefixIconColor: AppColors.themecolors,
                  //
                  //     onUseridValueChange: (value) {},
                  //   ),
                  // ),

                  // TextFieldDecorator(
                  //   child: UserIdTextField(
                  //     // useridTextFieldPrefixicon
                  //     useridController: otpController,
                  //     userIdErrorText: 'Pin can not be empty',
                  //     userIdHintText: 'Enter Your Pin',
                  //     userIdHintTextColor: AppColors.themecolors,
                  //     userIdErrorTextColor: AppColors.themecolors,
                  //     useridTextFieldPrefixIcon: Icons.pin,
                  //     useridTextFieldPrefixIconColor: AppColors.themecolors,
                  //
                  //     onUseridValueChange: (value) {},
                  //   ),
                  // ),

                  SizedBox(
                    height: 1.h,
                  ),

                  CustomButtom(
                    buttonColor: MyTheme.loginbuttonColor,
                    buttontext: 'Next',
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    handleButtonClick: () {
                      Get.to(() => EmailCode());
                    },
                  ),
                  SizedBox(
                    height: 1.h,
                  ),

                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Container(
                  //     height: 6.h,
                  //     width: 65.w,
                  //     decoration: BoxDecoration(
                  //       border:
                  //           Border.all(color: AppColors.themecolors, width: 1),
                  //     ),
                  //     child: Center(
                  //       child: TextField(
                  //         cursorColor: AppColors.themecolors,
                  //         style: TextStyle(
                  //             color: AppColors.themecolors, fontSize: 10.sp),
                  //         decoration: InputDecoration(
                  //           fillColor: Colors.grey.shade200,
                  //           contentPadding: EdgeInsets.symmetric(
                  //               vertical: 1.7.h, horizontal: 2.w),
                  //           // border: OutlineInputBorder(
                  //           //     borderRadius: BorderRadius.circular(0),
                  //           //     borderSide: BorderSide(
                  //           //       color: Colors.red,
                  //           //       width: 1,
                  //           //     )),
                  //           hintText: 'Name',
                  //           hintStyle: TextStyle(
                  //               color: Colors.grey,
                  //               fontSize: 10.sp,
                  //               fontWeight: FontWeight.w500),
                  //
                  //           disabledBorder: InputBorder.none,
                  //           border: InputBorder.none,
                  //           filled: true,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Container(
                  //     height: 6.h,
                  //     width: 65.w,
                  //     decoration: BoxDecoration(
                  //       border:
                  //           Border.all(color: AppColors.themecolors, width: 1),
                  //     ),
                  //     child: Center(
                  //       child: TextField(
                  //         obscureText: true,
                  //         cursorColor: AppColors.themecolors,
                  //         style: TextStyle(
                  //             color: AppColors.themecolors, fontSize: 10.sp),
                  //         decoration: InputDecoration(
                  //           fillColor: Colors.grey.shade200,
                  //           contentPadding: EdgeInsets.symmetric(
                  //               vertical: 1.7.h, horizontal: 2.w),
                  //           // border: OutlineInputBorder(
                  //           //     borderRadius: BorderRadius.circular(0),
                  //           //     borderSide: BorderSide(
                  //           //       color: Colors.red,
                  //           //       width: 1,
                  //           //     )),
                  //           hintText: 'Password',
                  //           hintStyle: TextStyle(
                  //               color: Colors.grey,
                  //               fontSize: 10.sp,
                  //               fontWeight: FontWeight.w500),
                  //
                  //           disabledBorder: InputBorder.none,
                  //           border: InputBorder.none,
                  //           filled: true,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 5.h,
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     // Get.to(() => HomePage());
                  //   },
                  //   child: Container(
                  //       height: 6.h,
                  //       width: 65.w,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //             color: AppColors.themecolors, width: 1),
                  //         color: AppColors.themecolors,
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           'Login',
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 10.sp,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       )),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
