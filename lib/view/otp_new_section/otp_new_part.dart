import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
//import 'package:flutter_otp_text_field/flutter_otp_text_fieldpackage:get/get_instance/src/extension_instance.dart';
//import 'package:heath/all_screens/login_screen/controllers/login_mobile_conttroller.dart';
//import 'package:heath/constant_file/constant_colors.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/otp_new_controller/otp_new_controler.dart';
import '../../controllers/phone_login_controllerr/phone_login_controllers.dart';

//import 'otp_verify_controller.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({Key? key}) : super(key: key);

  LoginMobileController _loginMobileController = Get.find();

  //LoginMobileController loginMobileController = Get.find();
  OtpVerifyController _otpVerifyController = Get.put(OtpVerifyController());
  bool firstbox = false;
  //get otp => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1587985399301-ec1cfb049c9f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                      // 'https://images.unsplash.com/photo-1555516474-f30ac966572f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80'
                      // 'https://images.unsplash.com/photo-1543544171-1d597a130cca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
                      //'https://images.unsplash.com/photo-1568041002045-27791242a745?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1820&q=80'
                      ),
                  fit: BoxFit.fill)),

          ///color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.15,
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
              Spacer(),
              Text(
                'OTP VERIFICATION',
                style: GoogleFonts.roboto(
                  fontSize: size.height * 0.034,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              // Container(
              //   height: 30.h,
              //   child: Lottie.asset(
              //     'lib/assets/asset/4430-phone-number-verification.json',
              //     height: 400.0,
              //
              //     ///repeat: true,
              //     // reverse: true,
              //     //animate: true,
              //   ),
              // ),
              // SizedBox(
              //   height: 60,
              // ),
              Spacer(),
              Container(
                height: size.width * 0.8,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),

                  color: MyTheme.ThemeColors,
                  //color: Colors.cyan,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Verification',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Enter OTP sent to your registered mobile number',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 11.h,
                        width: 90.w,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: OtpTextField(
                            keyboardType: TextInputType.number,
                            fillColor: Colors.white,
                            filled: true,
                            fieldWidth: 70,

                            numberOfFields: 4,
                            borderColor: Color(0xFF512DA8),
                            //set to true to show as box or false to show as dash
                            showFieldAsBox: true,
                            //runs when a code is typed in
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                              _otpVerifyController.callOtpApi(verificationCode);
                              /* showDialog(
                                  context: context,
                                  builder: (context){
                                    return AlertDialog(
                                      title: Text("Verification Code"),
                                      content: Text('Code entered is $verificationCode'),
                                    );
                                  }
                              );*/
                            }, // end onSubmit
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                          //_otpVerifyController.callOtpApi(verificationCode);
                        },
                        child: Container(
                          height: 4.5.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            color: MyTheme.containercolor13,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0.15, 0))
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Resend',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.035,
                              ),
                            ),
                            //"Continue".text.bold.center.size(14).make()
                          ),
                        ),
                      ),
                      //     .onTap(() {
                      //   //Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsProfile()));
                      // }
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
