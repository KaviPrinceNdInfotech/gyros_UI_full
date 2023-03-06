import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/constants/buttons/customs_buttons.dart';
import 'package:gyros_app/controllers/login_controllerss/login_controllerssss.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/view/forget_password/forget_passwords.dart';
import 'package:gyros_app/view/signup/signup_page.dart';
import 'package:gyros_app/widgets/circular_loader.dart';
import 'package:sizer/sizer.dart';

import 'login_email_controller.dart';

class LoginEmailPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController useridController = TextEditingController();
  TextEditingController passController = TextEditingController();
  LoginEmailController _loginEmailController = Get.find();
  NavController _navController = Get.find();
  LoginPageController _loginPageController = Get.find();

  LoginEmailPage({Key? key}) : super(key: key);

  // void login(String email, password) async {
  //   try {
  //     var response = await post(
  //         Uri.parse("https://api.gyros.farm/api/AdminApi/LoginWithEmail"),
  //         body: {
  //           'Email': email,
  //           'PassWord': password,
  //         });
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       if (data['Status'] == 200) {
  //         _toast(data);
  //         Get.to(() => NavBar());
  //       } else {
  //         _toast(data);
  //       }
  //     } else {
  //       Fluttertoast.showToast(
  //           msg: 'Login Failed',
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 3,
  //           backgroundColor: Colors.grey,
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //     }
  //   } catch (e) {
  //     print('Error');
  //     print(e.toString());
  //   }
  // }
  //
  // _toast(data) {
  //   return Fluttertoast.showToast(
  //       msg: '${data['Message']}',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 3,
  //       backgroundColor: Colors.grey,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _loginPageController.loginFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1627154424678-0d3909874daa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGhvbmV5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1400&q=60'
                          ),
                      fit: BoxFit.fill)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                    height: 6.h,
                  ),

                  Text(
                    'Login With Your Email.',
                    style: GoogleFonts.actor(
                      color: Colors.white,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.h),
                    child: Text(
                      "Enter Your Email and start purchasing with Gyros.",
                      style: GoogleFonts.actor(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
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
                    height: 6.h,
                  ),

                  ///todo from here email....
                  Form(
                    key: _loginEmailController.loginEmailFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Container(
                          width: size.width * 0.8,
                          height: size.height * 0.13,
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding:
                              EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                          decoration: BoxDecoration(
                            //color: MyTheme.loginPageBoxColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            controller: _loginEmailController.Email,

                            validator: (value) {
                              return _loginEmailController
                                  .validateEmail(value!);
                            },
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
                                Icons.email,
                                color: MyTheme.ThemeColors,
                              ),
                              hintText: 'Enter Your Email',
                              hintStyle: TextStyle(color: MyTheme.ThemeColors),
                            ),
                            keyboardType: TextInputType.emailAddress,
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
                          ),
                        ),

                        SizedBox(
                          height: 0.h,
                        ),

                        ///here from password.......
                        Container(
                          width: size.width * 0.8,
                          height: size.height * 0.13,
                          margin: EdgeInsets.symmetric(vertical: 2),
                          padding:
                              EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                          decoration: BoxDecoration(
                            //color: MyTheme.loginPageBoxColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Obx(
                            () => TextFormField(
                              //keyboardType: TextInputType.visiblePassword,
                              //obscureText: true,
                              obscureText: _loginPageController.isVisible.value,
                              controller: _loginEmailController.PassWord,

                              validator: (value) {
                                return _loginEmailController
                                    .validatePassword(value!);
                              },
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

                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _loginPageController.isVisible.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  color: MyTheme.ThemeColors,
                                  onPressed: () {
                                    _loginPageController.isVisible.value =
                                        !_loginPageController.isVisible.value;
                                    print('hello prefix');
                                    //TODO : will use getx here.............
                                  },
                                ),

                                hintText: 'Enter Your Password',
                                hintStyle:
                                    TextStyle(color: MyTheme.ThemeColors),
                              ),
                              onSaved: (value) {
                                _loginPageController.password = value!;
                              },
                              // onChanged: (value) {
                              //   onUserPassValueChange(value);
                              // },
                              //
                              // onUserPassValueChange: (value) {
                              //   print('Pass Value $value');
                              // },
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Please enter Password';
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.h,
                  ),
                  CustomButtom(
                    buttonColor: MyTheme.loginbuttonColor,
                    buttontext: 'LOGIN',
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    handleButtonClick: () {
                      CallLoader.loader();
                      _loginEmailController.checkLogin();
                      // if (_formKey.currentState!.validate()) {
                      //   login(useridController.text.toString(),
                      //       passController.text.toString());
                      // }
                      ///
                      // _loginPageController.checkLogin();
                      // _navController.tabindex(0);
                      // Get.to(() => NavBar());
                      // //Get.to(() => NavBar());
                    },
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => Forgetpasswords());
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            //background: AppColors.themecolors,
                            //backgroundColor: Colors.grey.shade700,
                            color: AppColors.themecolors,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Don\'t have account ?',
                        style: TextStyle(
                          //backgroundColor: Colors.grey.shade700,
                          color: Colors.black,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => SignUp());
                        },
                        child: Text(
                          ' Sign Up',
                          style: TextStyle(
                            //backgroundColor: Colors.grey.shade700,
                            color: AppColors.themecolors,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
