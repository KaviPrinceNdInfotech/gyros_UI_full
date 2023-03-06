import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/otp_timer_controller/otp_timer_controllerss.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:sizer/sizer.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key, required this.MobileOrEmail}) : super(key: key);
  final MobileOrEmail;

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  NavController _navController = Get.find();
  OtpTimerController _otpTimerController = Get.put(OtpTimerController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff7f6fb),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1541784421976-587c2f74e656?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80'
                        //'https://images.unsplash.com/photo-1528132596460-787bb7adfd5f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGdyZWVuJTIwb3JnYW5pYyUyMGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=1400&q=60'
                        //'https://images.unsplash.com/photo-1505764706515-aa95265c5abc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGdyZWVuJTIwb3JnYW5pYyUyMGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=1400&q=60'
                        // 'https://images.unsplash.com/photo-1485527172732-c00ba1bf8929?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Z3JlZW4lMjBvcmdhbmljJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1400&q=60'
                        ),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 30,
                          color: AppColors.themecolors,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'lib/assets/asset/guser_logo.png',
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Verification',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Enter your OTP code number",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Container(
                      height: size.height * 0.3,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1584730480181-a431e7934ea1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NnwxMTQ1Mjk4N3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=1400&q=60'
                                // 'https://images.unsplash.com/photo-1492453117483-3f94a0f36365?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
                                //'https://images.unsplash.com/photo-1541784421976-587c2f74e656?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80'
                                //'https://images.unsplash.com/photo-1485527172732-c00ba1bf8929?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Z3JlZW4lMjBvcmdhbmljJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1400&q=60',
                                //'https://images.unsplash.com/photo-1505764706515-aa95265c5abc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGdyZWVuJTIwb3JnYW5pYyUyMGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=1400&q=60'
                                ),
                            fit: BoxFit.fill),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int i = 0; i < 4; i++)
                                    OtpInput(
                                        controller: _otpTimerController.otp[i],
                                        autoFocus: i == 0 ? true : false,
                                        validator:
                                            _otpTimerController.otpValidator)

                                  // _textFieldOTP(first: true, last: false),
                                  // _textFieldOTP(first: false, last: false),
                                  // _textFieldOTP(first: false, last: false),
                                  // _textFieldOTP(first: false, last: true),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // _navController.tabindex(0);
                                  // Get.to(() => NavBar());
                                  ///here we have thing to changed..................................
                                  // _otpTimerController.otpdigits();
                                  // _otpTimerController.checkValidation(
                                  //     MobileOrEmail().toString());
                                  ///TODO: changed 2 december..............
                                  _otpTimerController.otpdigits();
                                  _otpTimerController.checkValidation(
                                      MobileOrEmail!.toString());
                                },
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(14.0),
                                  child: Text(
                                    'Verify',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Didn't you receive any code?",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        "Resend New Code",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreen,
                        ),
                        textAlign: TextAlign.center,
                      ),
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

  Widget _textFieldOTP(
      {required bool first, last, controller, autoFocus, validator}) {
    return Container(
      //color: Colors.white38,
      height: 65,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          //style: TextStyle(color: AppColors.themecolors),
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,

          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.themecolors),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.white70),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.lightGreen),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}

class MobileOrEmail {}

class OtpInput extends StatelessWidget {
  const OtpInput(
      {Key? key,
      required this.controller,
      required this.autoFocus,
      required this.validator})
      : super(key: key);

  final bool autoFocus;
  final TextEditingController controller;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.014),
      child: SizedBox(
        height: size.height * 0.075,
        width: size.width * 0.148,
        child: PhysicalModel(
          color: Color(0xfff5f5f5),
          shape: BoxShape.circle,
          elevation: 2,
          child: Container(
            height: size.height * 0.075,
            width: size.width * 0.148,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 4),
              shape: BoxShape.circle,
              color: Color(0xfff5f5f5),

              //borderRadius: BorderRadius.circular(5)
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                cursorColor: AppColors.golden,
                cursorHeight: size.height * 0.04,
                cursorWidth: size.width * 0.007,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 11, horizontal: -11.w),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  hintText: '',
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                  counterText: '',
                  focusColor: Colors.black,
                ),
                autofocus: autoFocus,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: controller,
                validator: validator,
                maxLength: 1,
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
