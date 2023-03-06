import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/constants/buttons/customs_buttons.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/view/login_page/login_pagee.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/otp_timer_controller/otp_timer_controllerss.dart';
import '../../controllers/sign_up_controller/sign_up_controllers.dart';

class SignUp extends StatelessWidget {
  //final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passsController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();

  OtpTimerController _timeController = Get.put(OtpTimerController());

  SignUpPageController _signUpPageController = Get.put(SignUpPageController());
  SignUp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _signUpPageController.signupform,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1618411640018-972400a01458?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHN3ZWV0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1400&q=60'
                      ),
                      fit: BoxFit.fill)),
              child: SingleChildScrollView(
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
                    SizedBox(
                      height: 2.h,
                    ),
                    Column(
                      children: [
                        //todo  name field
                        Container(
                          width: size.width * 0.8,
                          height: size.height * 0.125,
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          decoration: BoxDecoration(
                            //color: MyTheme.loginPageBoxColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            controller: _signUpPageController.Name,

                            validator: (value) {
                              return _signUpPageController.validatename(value!);
                            },
                            style: TextStyle(
                              color: MyTheme.ThemeColors,
                            ),
                            cursorColor: MyTheme.ThemeColors,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: MyTheme.ThemeColors,
                                ),
                              ),
                              errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700),
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
                                borderSide: BorderSide(
                                    width: 2, color: MyTheme.ThemeColors),
                              ),
                              //labelText: "Email",
                              prefixIcon: Icon(
                                Icons.person_rounded,
                                color: MyTheme.ThemeColors,
                              ),
                              hintText: 'Enter Your Name',
                              hintStyle: TextStyle(color: MyTheme.ThemeColors),
                            ),
                            //         onSaved: (value){
                            //           _signUpPageController.Name = value!;
                            //
                            // },
                            //keyboardType: TextInputType.emailAddress,
                          ),
                        ),

                        ///todo here phone......
                        Container(
                          width: size.width * 0.8,
                          height: size.height * 0.125,
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding:
                              EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                          decoration: BoxDecoration(
                            //color: MyTheme.loginPageBoxColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            maxLength: 10,
                            controller: _signUpPageController.Mobile_No,

                            validator: (value) {
                              return _signUpPageController
                                  .validatePhone(value!);
                            },
                            keyboardType: TextInputType.phone,
                            // validator: (value) {
                            //   if (value!.isEmpty || value.length < 10) {
                            //     return 'Please enter Contact number';
                            //   }
                            //   return null;
                            // },
                            style: TextStyle(
                              color: MyTheme.ThemeColors,
                            ),
                            cursorColor: MyTheme.ThemeColors,
                            decoration: InputDecoration(
                              counterText: "",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: MyTheme.ThemeColors,
                                ),
                              ),
                              errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700),
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
                                borderSide: BorderSide(
                                    width: 2, color: MyTheme.ThemeColors),
                              ),
                              //labelText: "Email",
                              prefixIcon: Icon(
                                Icons.phone_android_outlined,
                                color: MyTheme.ThemeColors,
                              ),
                              hintText: 'Enter Your Phone',
                              hintStyle: TextStyle(color: MyTheme.ThemeColors),
                            ),
                          ),
                        ),

                        ///todo email field......
                        Container(
                          width: size.width * 0.8,
                          height: size.height * 0.125,
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding:
                              EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                          decoration: BoxDecoration(
                            //color: MyTheme.loginPageBoxColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            controller: _signUpPageController.Email_Id,

                            validator: (value) {
                              return _signUpPageController
                                  .validateEmail(value!);
                            },
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return "Enter email address";
                            //   }
                            //   String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                            //       "\\@" +
                            //       "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                            //       "(" +
                            //       "\\." +
                            //       "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                            //       ")+";
                            //   RegExp regExp = new RegExp(p);
                            //   if (regExp.hasMatch(value)) {
                            //     return null;
                            //   }
                            //   return 'Email is not valid';
                            // },
                            style: TextStyle(
                              color: MyTheme.ThemeColors,
                            ),
                            cursorColor: MyTheme.ThemeColors,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: MyTheme.ThemeColors,
                                ),
                              ),
                              errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700),
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
                                borderSide: BorderSide(
                                    width: 2, color: MyTheme.ThemeColors),
                              ),
                              //labelText: "Email",
                              prefixIcon: Icon(
                                Icons.email_rounded,
                                color: MyTheme.ThemeColors,
                              ),
                              hintText: 'Enter Your Email',
                              hintStyle: TextStyle(color: MyTheme.ThemeColors),
                            ),
                            //keyboardType: TextInputType.emailAddress,
                          ),
                        ),

                        ///todo here password................
                        Container(
                          width: size.width * 0.8,
                          height: size.height * 0.125,
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding:
                              EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                          decoration: BoxDecoration(
                            //color: MyTheme.loginPageBoxColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            controller: _signUpPageController.PassWord,

                            validator: (value) {
                              return _signUpPageController
                                  .validatePassword(value!);
                            },
                            // controller: _passsController,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter Password';
                            //   }
                            //   return null;
                            // },
                            style: TextStyle(
                              color: MyTheme.ThemeColors,
                            ),
                            cursorColor: MyTheme.ThemeColors,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: MyTheme.ThemeColors,
                                ),
                              ),
                              errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700),
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
                                borderSide: BorderSide(
                                    width: 2, color: MyTheme.ThemeColors),
                              ),
                              //labelText: "Email",
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: MyTheme.ThemeColors,
                              ),
                              hintText: 'Enter Your password',
                              hintStyle: TextStyle(color: MyTheme.ThemeColors),
                            ),
                          ),
                        ),

                        ///todo here confirm password..........
                        Container(
                          width: size.width * 0.8,
                          height: size.height * 0.120,
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding:
                              EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                          decoration: BoxDecoration(
                            //color: MyTheme.loginPageBoxColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            controller: _signUpPageController.ConfirmPassWord,

                            validator: (value) {
                              return _signUpPageController
                                  .validateConfirmPassword(value!);
                            },
                            // controller: _confirmController,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter Confirm password';
                            //   }
                            //   return null;
                            // },
                            style: TextStyle(
                              color: MyTheme.ThemeColors,
                            ),
                            cursorColor: MyTheme.ThemeColors,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: MyTheme.ThemeColors,
                                ),
                              ),
                              errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700),
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
                                borderSide: BorderSide(
                                    width: 2, color: MyTheme.ThemeColors),
                              ),
                              //labelText: "Email",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: MyTheme.ThemeColors,
                              ),
                              hintText: 'ReEnter Your password',
                              hintStyle: TextStyle(color: MyTheme.ThemeColors),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 0.h,
                    ),
                    CustomButtom(
                      buttonColor: MyTheme.loginbuttonColor,
                      buttontext: 'Sign Up',
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      handleButtonClick: () {
                        //CallLoader.loader();
                        _signUpPageController.checkSignUp();
                        // if (_formKey.currentState!.validate()) {
                        //   register(
                        //       _nameController.text.toString(),
                        //       _emailController.text.toString(),
                        //       _passsController.text.toString(),
                        //       _passsController.text.toString(),
                        //       _confirmController.text.toString());
                        // }
                      },
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have account ?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => LoginPage());
                          },
                          child: Text(
                            ' Login',
                            style: TextStyle(
                              color: AppColors.themecolors,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
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
      ),
    );
  }
}
