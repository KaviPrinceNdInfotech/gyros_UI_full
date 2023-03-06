import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/phone_login_controllerr/phone_login_controllers.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:sizer/sizer.dart';
// import 'package:sms_autofill/sms_autofill.dart';
// import 'package:sms_autofill/sms_autofill.dart';

// class LoginPhoneEmail extends StatefulWidget {
//   LoginPhoneEmail({Key? key}) : super(key: key);
//
//   @override
//   _LoginPhoneEmailState createState() => _LoginPhoneEmailState();
// }
//
// class _LoginPhoneEmailState extends State<LoginPhoneEmail> {

class LoginPhoneEmail extends StatelessWidget {
  LoginPhoneEmail({Key? key}) : super(key: key);

  LoginMobileController _loginMobileController = Get.find();


  // ///demo for auto fill otp
  // void submit() async {
  //   if (_loginMobileController.MobileOrEmail.text == "") return;
  //
  //   var appSignatureID = await SmsAutoFill.getAppSignature;
  //   Map sendOtpData = {
  //     "mobile_number" : _loginMobileController.MobileOrEmail.text,
  //     "app_Signature_id" : appSignatureID
  //   };
  //   print(sendOtpData);
  //   Get.to(Second());
  // }

  @override
  Widget build(BuildContext context) {
    //new RefreshIndicatorState(key: new GlobalKey<RefreshIndicatorState>();
    Size size = MediaQuery.of(context).size;

    //final _formkeyphonesss = GlobalKey<RefreshIndicatorState>();
    TextEditingController mobileController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7f6fb),
      body: Obx(
        () => _loginMobileController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _loginMobileController.MobileLoginFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      height: size.height,
                      width: size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1564417947365-8dbc9d0e718e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fG9yZ2FuaWMlMjBmYXJtaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1400&q=60'),
                              fit: BoxFit.fill)),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 3.h,
                            ),
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
                              height: 24,
                            ),
                            Text(
                              'Login With Us',
                              style: GoogleFonts.actor(
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Enter your phone or Email we'll send you a verification code so we know you're real",
                              style: GoogleFonts.alatsi(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 28,
                            ),
                            Container(
                              height: size.height * 0.33,
                              padding: EdgeInsets.all(28),
                              decoration: BoxDecoration(
                                color: Colors.white30,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://images.unsplash.com/photo-1641806120672-643a30aeda7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGJsdXJyJTIwYmFjZ3JvdW5kJTIwZ3JlZW58ZW58MHx8MHx8&auto=format&fit=crop&w=1400&q=60'
                                        // 'https://images.unsplash.com/photo-1492892132812-a00a8b245c45?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGJsdXJyJTIwYmFja2dyb3VuZCUyMGluJTIwb3JnYW5pYyUyMGRlYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=1400&q=60'
                                        // 'https://images.unsplash.com/photo-1653585759494-c5582e011cfc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGJsdXIlMjBpbWFnZSUyMG5hdHVyZSUyMGJhY2tncm91bmR8ZW58MHx8MHx8&auto=format&fit=crop&w=1400&q=60'
                                        //'https://images.unsplash.com/photo-1529480852540-6dd8e89ea2d3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OXw1Mjg2MDN8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60'
                                        //'https://images.unsplash.com/photo-1532190761747-215949f288d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGJsdXIlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1400&q=60'),
                                        ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 1.h,
                                  ),

                                  Container(
                                    width: size.width * 0.8,
                                    height: size.height * 0.125,
                                    margin: EdgeInsets.symmetric(vertical: 0),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1, horizontal: 0),
                                    decoration: BoxDecoration(
                                      //color: MyTheme.loginPageBoxColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: TextFormField(
                                      //maxLength: 10,
                                      controller:
                                          _loginMobileController.MobileOrEmail,

                                      validator: (value) {
                                        return _loginMobileController
                                            .validatePhone(value!);
                                      },
                                      //keyboardType: TextInputType.phone,
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
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: MyTheme.ThemeColors),
                                        ),
                                        //labelText: "Email",
                                        prefixIcon: Icon(
                                          Icons.perm_device_info_sharp,
                                          color: MyTheme.ThemeColors,
                                        ),
                                        hintText: 'Enter Phone / Email',
                                        hintStyle: TextStyle(
                                            color: MyTheme.ThemeColors),
                                      ),
                                    ),
                                  ),

                                  // TextFieldDecorator(
                                  //   child: UserMobileTextField(
                                  //     // useridTextFieldPrefixicon
                                  //     userMobileController: mobileController,
                                  //     userMobileErrorText: 'Phone Can not found',
                                  //     userMobileHintText: 'Enter Phone Number',
                                  //     userMobileHintTextColor: AppColors.themecolors,
                                  //     userMobileErrorTextColor: AppColors.themecolors,
                                  //     userMobileTextFieldPrefixIcon: '+91',
                                  //     userMobileTextFieldPrefixIconColor:
                                  //         AppColors.themecolors,
                                  //
                                  //     onUserMobileValueChange: (value) {},
                                  //   ),
                                  // ),
                                  // // SizedBox(
                                  // //   height: 0.h,
                                  // // ),
                                  // // TextFormField(
                                  // //   keyboardType: TextInputType.number,
                                  // //   style: TextStyle(
                                  // //     fontSize: 18,
                                  // //     fontWeight: FontWeight.bold,
                                  // //   ),
                                  // //   decoration: InputDecoration(
                                  // //     enabledBorder: OutlineInputBorder(
                                  // //         borderSide: BorderSide(color: Colors.black12),
                                  // //         borderRadius: BorderRadius.circular(10)),
                                  // //     focusedBorder: OutlineInputBorder(
                                  // //         borderSide: BorderSide(color: Colors.black12),
                                  // //         borderRadius: BorderRadius.circular(10)),
                                  // //     prefix: Padding(
                                  // //       padding: EdgeInsets.symmetric(horizontal: 8),
                                  // //       child: Text(
                                  // //         '+91 ',
                                  // //         style: TextStyle(
                                  // //           fontSize: 18,
                                  // //           fontWeight: FontWeight.bold,
                                  // //         ),
                                  // //       ),
                                  // //     ),
                                  // //     // suffixIcon: Icon(
                                  // //     //   Icons.check_circle,
                                  // //     //   color: Colors.green,
                                  // //     //   size: 32,
                                  // //     // ),
                                  // //   ),
                                  // // ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Container(
                                    width: size.width * 0.8,
                                    decoration: BoxDecoration(
                                      color: MyTheme.loginbuttonColor,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: ElevatedButton(
                                      //key: _formkeyphones,
                                      onPressed: () {
                                        // CallLoader.loader();
                                        _loginMobileController
                                            .checkMobileLogin();
                                        // Navigator.of(context).push(
                                        //   MaterialPageRoute(
                                        //       builder: (context) => Otp()),
                                        // );
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
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(14.0),
                                        child: Text(
                                          'Send',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
