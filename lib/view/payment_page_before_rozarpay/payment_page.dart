import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/constants/buttons/customs_buttons.dart';
import 'package:gyros_app/controllers/rozar_pay_controller/rozar_pay_controller.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/view/payment_page_before_rozarpay/payment_page_controller.dart';
import 'package:sizer/sizer.dart';

class PaymentPage extends StatelessWidget {
  PaymentController _paymentController = Get.put(PaymentController());
  NavController _navController = Get.find();

  PaymentPage({Key? key}) : super(key: key);
  final RozarPayController _rozarPayController = Get.put(RozarPayController());
  //Razorpay? razorpay;
  TextEditingController payment = new TextEditingController();
  FocusNode paymentt = FocusNode();
  var msg;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => paymentt.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _paymentController.paymentFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                height: size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            //'https://images.unsplash.com/photo-1506368249639-73a05d6f6488?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
                            //'https://images.unsplash.com/photo-1616344091740-af6b6859bb01?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fGhvbmV5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1400&q=60'
                            //'https://images.unsplash.com/photo-1555211652-5c6222f971bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDd8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                            'https://images.unsplash.com/photo-1627154424678-0d3909874daa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGhvbmV5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1400&q=60'
                            //'https://images.unsplash.com/photo-1590779033100-9f60a05a013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
                            //'https://img.freepik.com/free-photo/fresh-vegetables-with-price-tags-shelf-grocery-store-supermarket_342744-1397.jpg?w=1800&t=st=1656765079~exp=1656765679~hmac=960f81d4a643d71d68c26c50e5b182ce5cee8ee12935b54cbf72f66ea89c3425'
                            //'https://images.unsplash.com/photo-1608686207856-001b95cf60ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80'
                            //'https://img.freepik.com/free-photo/woman-with-tablet-buying-healthy-food-supermarket-grocery-store_342744-1110.jpg?t=st=1656747606~exp=1656748206~hmac=cad4fcedf9befb2991319f1634acc32b038e0757fc8cb569c84777d87febd9be&w=1800'
                            // 'https://images.unsplash.com/photo-1579113800032-c38bd7635818?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
                            //'https://images.wallpapersden.com/image/download/las-vegas-night-hotel_Zmxtbm6UmZqaraWkpJRmbmdlrWZlbWU.jpg'
                            //'https://i.pinimg.com/originals/01/96/c1/0196c1f3432b1a2ebac601dadb7b92cd.jpg'
                            ),
                        fit: BoxFit.fitHeight)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 0.0.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: size.height * 0.2,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image:
                                AssetImage('lib/assets/asset/guser_logo.png'),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),

                    Text(
                      'Enter Your Amount.',
                      style: GoogleFonts.actor(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
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
                      height: 3.h,
                    ),

                    ///todo from here payment....
                    Column(
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
                            controller: _paymentController.payment,

                            validator: (value) {
                              return _paymentController.validatePayment(value!);
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
                                Icons.currency_rupee,
                                color: MyTheme.ThemeColors,
                              ),
                              hintText: 'Enter Your amount',
                              hintStyle: TextStyle(color: MyTheme.ThemeColors),
                            ),
                            //keyboardType: TextInputType.emailAddress,
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
                      ],
                    ),
                    SizedBox(
                      height: 0.h,
                    ),
                    CustomButtom(
                      buttonColor: MyTheme.loginbuttonColor,
                      buttontext: 'PAY',
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      handleButtonClick: () {
                        _rozarPayController.openCheckout();
                        //CallLoader.loader();

                        ///_loginEmailController.checkLogin();
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
