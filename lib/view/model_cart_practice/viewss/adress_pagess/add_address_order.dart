import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/add_address_cotroller/add_adress_controller.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/widgets/circular_loader.dart';
import 'package:sizer/sizer.dart';

import '../../../../controllers/address_list_controller/address_list_controllers.dart';

class AddAddress extends StatelessWidget {
  AddAddress({Key? key}) : super(key: key);
  AddAdressController _addAdressController = Get.put(AddAdressController());
  AddressListController _addressListController =
      Get.put(AddressListController());

  //AddAddressController _addAddressController = Get.put(AddAddressController());

  FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.themecolors,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Add Address',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.themecolors,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _addAdressController.AddressFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1628444756989-ea3f47c0ebb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
                    //'https://images.unsplash.com/photo-1491147334573-44cbb4602074?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
                    //'https://images.unsplash.com/photo-1623944653453-307cf0d6057c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
                    ),
                fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 6.h,
                ),

                ///todo from here name.............................

                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.11,
                  margin: EdgeInsets.symmetric(vertical: 0),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  decoration: BoxDecoration(
                    //color: MyTheme.loginPageBoxColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: _addAdressController.Name,
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
                        Icons.person_rounded,
                        color: MyTheme.ThemeColors,
                      ),
                      hintText: 'Enter Your Name',
                      hintStyle: TextStyle(color: MyTheme.ThemeColors),
                    ),
                    //keyboardType: TextInputType.emailAddress,

                    validator: (value) {
                      return _addAdressController.validateFullname(value!);
                    },
                    // onSaved: (value) {
                    //   _addAdressController.validateFullname = value!;
                    // },
                  ),
                ),

                ///todo from here mobile....

                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.11,
                  margin: EdgeInsets.symmetric(vertical: 0),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
                          width: 2,
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
                        Icons.phone_android_outlined,
                        color: MyTheme.ThemeColors,
                      ),
                      hintText: 'Enter Your Mobile',
                      hintStyle: TextStyle(color: MyTheme.ThemeColors),
                    ),
                    controller: _addAdressController.Mobile,
                    // onSaved: (value) {
                    //   _addAdressController.mobilenumber = value!;
                    // },
                    validator: (value) {
                      return _addAdressController.validateMobile(value!);
                    },
                  ),
                ),

                ///todo from here state........

                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.11,
                  margin: EdgeInsets.symmetric(vertical: 0),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
                          width: 2,
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
                        Icons.real_estate_agent,
                        color: MyTheme.ThemeColors,
                      ),
                      hintText: 'Enter Your State',
                      hintStyle: TextStyle(color: MyTheme.ThemeColors),
                    ),
                    controller: _addAdressController.State,
                    // onSaved: (value) {
                    //   _addAdressController.enterstate = value!;
                    // },
                    validator: (value) {
                      return _addAdressController.validateState(value!);
                    },
                  ),
                ),

                ///todo from here city....

                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.11,
                  margin: EdgeInsets.symmetric(vertical: 0),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
                          width: 2,
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
                        Icons.location_city_outlined,
                        color: MyTheme.ThemeColors,
                      ),
                      hintText: 'Enter Your City',
                      hintStyle: TextStyle(color: MyTheme.ThemeColors),
                    ),
                    controller: _addAdressController.City,
                    // onSaved: (value) {
                    //   _addAdressController.entercity = value!;
                    // },
                    validator: (value) {
                      return _addAdressController.validateCity(value!);
                    },
                  ),
                ),

                ///todo from here area....

                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.11,
                  margin: EdgeInsets.symmetric(vertical: 0),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
                          width: 2,
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
                        Icons.home_work,
                        color: MyTheme.ThemeColors,
                      ),
                      hintText: 'Enter Your Area',
                      hintStyle: TextStyle(color: MyTheme.ThemeColors),
                    ),
                    controller: _addAdressController.Area,
                    // onSaved: (value) {
                    //   _addAdressController.enterarea = value!;
                    // },
                    validator: (value) {
                      return _addAdressController.validateArea(value!);
                    },
                  ),
                ),

                ///todo from here home....

                // Container(
                //   width: size.width * 0.8,
                //   height: size.height * 0.11,
                //   margin: EdgeInsets.symmetric(vertical: 0),
                //   padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                //   decoration: BoxDecoration(
                //     //color: MyTheme.loginPageBoxColor,
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   child: TextFormField(
                //     style: TextStyle(
                //       color: MyTheme.ThemeColors,
                //     ),
                //     cursorColor: MyTheme.ThemeColors,
                //     decoration: InputDecoration(
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //         borderSide: BorderSide(
                //           width: 2,
                //           color: MyTheme.ThemeColors,
                //         ),
                //       ),
                //       errorStyle: TextStyle(
                //           color: Colors.red, fontWeight: FontWeight.w700),
                //       //border: InputBorder.none,
                //       fillColor: MyTheme.loginPageBoxColor,
                //       filled: true,
                //       focusColor: MyTheme.loginPageBoxColor,
                //       border: OutlineInputBorder(
                //         //borderSide: BorderSide.none,
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       errorBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //         borderSide:
                //             BorderSide(width: 2, color: MyTheme.ThemeColors),
                //       ),
                //       //labelText: "Email",
                //       prefixIcon: Icon(
                //         Icons.home,
                //         color: MyTheme.ThemeColors,
                //       ),
                //       hintText: 'Enter Your Home',
                //       hintStyle: TextStyle(color: MyTheme.ThemeColors),
                //     ),
                //     controller: _addAdressController.enterhomeController,
                //     onSaved: (value) {
                //       _addAdressController.enterhome = value!;
                //     },
                //     validator: (value) {
                //       return _addAdressController.validateHome(value!);
                //     },
                //   ),
                // ),

                ///todo from here pin....

                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.11,
                  margin: EdgeInsets.symmetric(vertical: 0),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
                          width: 2,
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
                        Icons.padding,
                        color: MyTheme.ThemeColors,
                      ),
                      hintText: 'Enter Your Pin',
                      hintStyle: TextStyle(color: MyTheme.ThemeColors),
                    ),
                    controller: _addAdressController.PinCode,
                    // onSaved: (value) {
                    //   _addAdressController.enterpin = value!;
                    // },
                    validator: (value) {
                      return _addAdressController.validatePin(value!);
                    },
                  ),
                ),

                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 1.h),
                //   child: Container(
                //     child: Theme(
                //       data: Theme.of(context)
                //           .copyWith(splashColor: Colors.transparent),
                //       child: TextFormField(
                //         style:
                //             TextStyle(fontSize: 14, color: MyTheme.ThemeColors),
                //         cursorColor: MyTheme.ThemeColors,
                //         cursorHeight: 2.h,
                //         controller: _addAdressController.fullnameController,
                //
                //         //validator: _signupFormController.validateName,
                //
                //         // textAlignVertical: TextAlignVertical.center,
                //         decoration: InputDecoration(
                //           contentPadding: EdgeInsets.symmetric(vertical: 1.9.h),
                //           border: InputBorder.none,
                //           focusedBorder: InputBorder.none,
                //
                //           prefixIcon: Padding(
                //             padding: const EdgeInsets.all(4.0),
                //             child: Icon(
                //               Icons.account_circle_outlined,
                //               size: 18,
                //               color: MyTheme.ThemeColors,
                //             ),
                //             // Image.asset(
                //             //   'lib/assets/asset/user.png',
                //             //   height: 2.h,
                //             //   width: 4.w,
                //             //   color: Colors.grey.shade400,
                //             // ),
                //           ),
                //           //Icon(Icons.person,color: Colors.grey.shade700,),
                //           hintText: 'Full Name',
                //           hintStyle: GoogleFonts.poppins(
                //               color: MyTheme.ThemeColors,
                //               letterSpacing: 1,
                //               fontWeight: FontWeight.w400,
                //               fontSize: 12),
                //           labelStyle: TextStyle(
                //               color: myFocusNode.hasFocus
                //                   ? Colors.blue
                //                   : Colors.grey.shade200),
                //           enabledBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 0, color: Colors.green),
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //         ),
                //       ),
                //     ),
                //
                //     decoration: BoxDecoration(
                //         borderRadius:
                //             new BorderRadius.all(new Radius.circular(8)),
                //         color: Colors.grey.shade200),
                //     width: 290,
                //     height: 6.h,
                //     //margin: new EdgeInsets.fromLTRB(20, 20, 20, 210),
                //     //padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                //   ),
                // ),
                // SizedBox(
                //   height: 2.h,
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 1.h),
                //   child: Container(
                //     child: Theme(
                //       data: Theme.of(context)
                //           .copyWith(splashColor: Colors.transparent),
                //       child: TextFormField(
                //         style:
                //             TextStyle(fontSize: 14, color: MyTheme.ThemeColors),
                //         cursorColor: MyTheme.ThemeColors,
                //         cursorHeight: 2.h,
                //         controller: _addAdressController.mobilenumberController,
                //
                //         //validator: _signupFormController.validateName,
                //
                //         // textAlignVertical: TextAlignVertical.center,
                //         decoration: InputDecoration(
                //           contentPadding: EdgeInsets.symmetric(vertical: 1.9.h),
                //           border: InputBorder.none,
                //           focusedBorder: InputBorder.none,
                //
                //           prefixIcon: Padding(
                //             padding: const EdgeInsets.all(4.0),
                //             child: Icon(
                //               Icons.phone_android_outlined,
                //               size: 18,
                //               color: MyTheme.ThemeColors,
                //             ),
                //             // Image.asset(
                //             //   'lib/assets/asset/user.png',
                //             //   height: 2.h,
                //             //   width: 4.w,
                //             //   color: Colors.grey.shade400,
                //             // ),
                //           ),
                //           //Icon(Icons.person,color: Colors.grey.shade700,),
                //           hintText: "Mobile Number",
                //           hintStyle: GoogleFonts.poppins(
                //               color: MyTheme.ThemeColors,
                //               letterSpacing: 1,
                //               fontWeight: FontWeight.w400,
                //               fontSize: 12),
                //           labelStyle: TextStyle(
                //               color: myFocusNode.hasFocus
                //                   ? Colors.blue
                //                   : Colors.red),
                //           enabledBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 0, color: Colors.green),
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //           disabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(width: 2, color: Colors.red),
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //         ),
                //       ),
                //     ),
                //
                //     decoration: BoxDecoration(
                //         borderRadius:
                //             new BorderRadius.all(new Radius.circular(8)),
                //         color: Colors.grey.shade200),
                //     width: 290,
                //     height: 6.h,
                //     //margin: new EdgeInsets.fromLTRB(20, 20, 20, 210),
                //     //padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                //   ),
                // ),
                // SizedBox(
                //   height: 2.h,
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 1.h),
                //   child: Container(
                //     child: Theme(
                //       data: Theme.of(context)
                //           .copyWith(splashColor: Colors.transparent),
                //       child: TextFormField(
                //         style:
                //             TextStyle(fontSize: 14, color: MyTheme.ThemeColors),
                //         cursorColor: MyTheme.ThemeColors,
                //         cursorHeight: 2.h,
                //         controller: _addAdressController.enterstateController,
                //
                //         //validator: _signupFormController.validateName,
                //
                //         // textAlignVertical: TextAlignVertical.center,
                //         decoration: InputDecoration(
                //           contentPadding: EdgeInsets.symmetric(vertical: 1.8.h),
                //           border: InputBorder.none,
                //           focusedBorder: InputBorder.none,
                //
                //           prefixIcon: Padding(
                //             padding: const EdgeInsets.all(4.0),
                //             child: Icon(
                //               Icons.my_location_rounded,
                //               size: 18,
                //               color: MyTheme.ThemeColors,
                //             ),
                //             // Image.asset(
                //             //   'lib/assets/asset/user.png',
                //             //   height: 2.h,
                //             //   width: 4.w,
                //             //   color: Colors.grey.shade400,
                //             // ),
                //           ),
                //           //Icon(Icons.person,color: Colors.grey.shade700,),
                //           hintText: "Enter State",
                //           hintStyle: GoogleFonts.poppins(
                //               color: MyTheme.ThemeColors,
                //               letterSpacing: 1,
                //               fontWeight: FontWeight.w400,
                //               fontSize: 12),
                //           labelStyle: TextStyle(
                //               color: myFocusNode.hasFocus
                //                   ? Colors.blue
                //                   : Colors.red),
                //           enabledBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 0, color: Colors.green),
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //           disabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(width: 2, color: Colors.red),
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //         ),
                //       ),
                //     ),
                //
                //     decoration: BoxDecoration(
                //         borderRadius:
                //             new BorderRadius.all(new Radius.circular(8)),
                //         color: Colors.grey.shade200),
                //     width: 290,
                //     height: 6.h,
                //     //margin: new EdgeInsets.fromLTRB(20, 20, 20, 210),
                //     //padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                //   ),
                // ),
                // SizedBox(
                //   height: 2.h,
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 1.h),
                //   child: Container(
                //     child: Theme(
                //       data: Theme.of(context)
                //           .copyWith(splashColor: Colors.transparent),
                //       child: TextFormField(
                //         style:
                //             TextStyle(fontSize: 14, color: MyTheme.ThemeColors),
                //         cursorColor: MyTheme.ThemeColors,
                //         cursorHeight: 2.h,
                //         controller: _addAdressController.entercityController,
                //
                //         //validator: _signupFormController.validateName,
                //
                //         // textAlignVertical: TextAlignVertical.center,
                //         decoration: InputDecoration(
                //           contentPadding: EdgeInsets.symmetric(vertical: 1.8.h),
                //           border: InputBorder.none,
                //           focusedBorder: InputBorder.none,
                //
                //           prefixIcon: Padding(
                //             padding: const EdgeInsets.all(4.0),
                //             child: Icon(
                //               Icons.location_city,
                //               size: 18,
                //               color: MyTheme.ThemeColors,
                //             ),
                //             // Image.asset(
                //             //   'lib/assets/asset/user.png',
                //             //   height: 2.h,
                //             //   width: 4.w,
                //             //   color: Colors.grey.shade400,
                //             // ),
                //           ),
                //           //Icon(Icons.person,color: Colors.grey.shade700,),
                //           hintText: "Enter City",
                //           hintStyle: GoogleFonts.poppins(
                //               color: MyTheme.ThemeColors,
                //               letterSpacing: 1,
                //               fontWeight: FontWeight.w400,
                //               fontSize: 12),
                //           labelStyle: TextStyle(
                //               color: myFocusNode.hasFocus
                //                   ? Colors.blue
                //                   : Colors.red),
                //           enabledBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 0, color: Colors.green),
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //           disabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(width: 2, color: Colors.red),
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //         ),
                //       ),
                //     ),
                //
                //     decoration: BoxDecoration(
                //         borderRadius:
                //             new BorderRadius.all(new Radius.circular(8)),
                //         color: Colors.grey.shade200),
                //     width: 290,
                //     height: 6.h,
                //     //margin: new EdgeInsets.fromLTRB(20, 20, 20, 210),
                //     //padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                //   ),
                // ),
                // SizedBox(
                //   height: 2.h,
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 1.h),
                //   child: Container(
                //     child: Theme(
                //       data: Theme.of(context)
                //           .copyWith(splashColor: Colors.transparent),
                //       child: TextFormField(
                //         style:
                //             TextStyle(fontSize: 14, color: MyTheme.ThemeColors),
                //         cursorColor: MyTheme.ThemeColors,
                //         cursorHeight: 2.h,
                //         controller: _addAdressController.enterareaController,
                //
                //         //validator: _signupFormController.validateName,
                //
                //         // textAlignVertical: TextAlignVertical.center,
                //         decoration: InputDecoration(
                //           contentPadding: EdgeInsets.symmetric(vertical: 1.9.h),
                //           border: InputBorder.none,
                //           focusedBorder: InputBorder.none,
                //
                //           prefixIcon: Padding(
                //             padding: const EdgeInsets.all(4.0),
                //             child: Icon(
                //               Icons.home_work,
                //               size: 18,
                //               color: MyTheme.ThemeColors,
                //             ),
                //             // Image.asset(
                //             //   'lib/assets/asset/user.png',
                //             //   height: 2.h,
                //             //   width: 4.w,
                //             //   color: Colors.grey.shade400,
                //             // ),
                //           ),
                //           //Icon(Icons.person,color: Colors.grey.shade700,),
                //           hintText: "Enter Area",
                //           hintStyle: GoogleFonts.poppins(
                //               color: MyTheme.ThemeColors,
                //               letterSpacing: 1,
                //               fontWeight: FontWeight.w400,
                //               fontSize: 12),
                //           labelStyle: TextStyle(
                //               color: myFocusNode.hasFocus
                //                   ? Colors.blue
                //                   : Colors.red),
                //           enabledBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 0, color: Colors.green),
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //           disabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(width: 2, color: Colors.red),
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //         ),
                //       ),
                //     ),
                //
                //     decoration: BoxDecoration(
                //         borderRadius:
                //             new BorderRadius.all(new Radius.circular(8)),
                //         color: Colors.grey.shade200),
                //     width: 290,
                //     height: 6.h,
                //     //margin: new EdgeInsets.fromLTRB(20, 20, 20, 210),
                //     //padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                //   ),
                // ),
                // SizedBox(
                //   height: 2.h,
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 1.h),
                //   child: Container(
                //     child: Theme(
                //       data: Theme.of(context)
                //           .copyWith(splashColor: Colors.transparent),
                //       child: TextFormField(
                //         style:
                //             TextStyle(fontSize: 14, color: MyTheme.ThemeColors),
                //         cursorColor: MyTheme.ThemeColors,
                //         cursorHeight: 2.h,
                //         controller: _addAdressController.enterhomeController,
                //
                //         //validator: _signupFormController.validateName,
                //
                //         // textAlignVertical: TextAlignVertical.center,
                //         decoration: InputDecoration(
                //           contentPadding: EdgeInsets.symmetric(vertical: 1.9.h),
                //           border: InputBorder.none,
                //           focusedBorder: InputBorder.none,
                //
                //           prefixIcon: Padding(
                //             padding: const EdgeInsets.all(4.0),
                //             child: Icon(
                //               Icons.home,
                //               size: 18,
                //               color: MyTheme.ThemeColors,
                //             ),
                //             // Image.asset(
                //             //   'lib/assets/asset/user.png',
                //             //   height: 2.h,
                //             //   width: 4.w,
                //             //   color: Colors.grey.shade400,
                //             // ),
                //           ),
                //           //Icon(Icons.person,color: Colors.grey.shade700,),
                //           hintText: "Enter Home",
                //           hintStyle: GoogleFonts.poppins(
                //               color: MyTheme.ThemeColors,
                //               letterSpacing: 1,
                //               fontWeight: FontWeight.w400,
                //               fontSize: 12),
                //           labelStyle: TextStyle(
                //               color: myFocusNode.hasFocus
                //                   ? Colors.blue
                //                   : Colors.red),
                //           enabledBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 0, color: Colors.green),
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //           disabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(width: 2, color: Colors.red),
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //         ),
                //       ),
                //     ),
                //
                //     decoration: BoxDecoration(
                //         borderRadius:
                //             new BorderRadius.all(new Radius.circular(8)),
                //         color: Colors.grey.shade200),
                //     width: 290,
                //     height: 6.h,
                //     //margin: new EdgeInsets.fromLTRB(20, 20, 20, 210),
                //     //padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                //   ),
                // ),
                // SizedBox(
                //   height: 2.h,
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 1.h),
                //   child: Container(
                //     child: Theme(
                //       data: Theme.of(context)
                //           .copyWith(splashColor: Colors.transparent),
                //       child: TextFormField(
                //         style:
                //             TextStyle(fontSize: 14, color: MyTheme.ThemeColors),
                //         cursorColor: MyTheme.ThemeColors,
                //         cursorHeight: 2.h,
                //         controller: _addAdressController.enterpinController,
                //
                //         //validator: _signupFormController.validateName,
                //
                //         // textAlignVertical: TextAlignVertical.center,
                //         decoration: InputDecoration(
                //           contentPadding: EdgeInsets.symmetric(vertical: 1.9.h),
                //           border: InputBorder.none,
                //           focusedBorder: InputBorder.none,
                //
                //           prefixIcon: Padding(
                //             padding: const EdgeInsets.all(4.0),
                //             child: Icon(
                //               Icons.pin_drop,
                //               size: 18,
                //               color: MyTheme.ThemeColors,
                //             ),
                //             // Image.asset(
                //             //   'lib/assets/asset/user.png',
                //             //   height: 2.h,
                //             //   width: 4.w,
                //             //   color: Colors.grey.shade400,
                //             // ),
                //           ),
                //           //Icon(Icons.person,color: Colors.grey.shade700,),
                //           hintText: "Enter Pin",
                //           hintStyle: GoogleFonts.poppins(
                //               color: MyTheme.ThemeColors,
                //               letterSpacing: 1,
                //               fontWeight: FontWeight.w400,
                //               fontSize: 12),
                //           labelStyle: TextStyle(
                //               color: myFocusNode.hasFocus
                //                   ? Colors.blue
                //                   : Colors.red),
                //           enabledBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 0, color: Colors.green),
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //           disabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(width: 2, color: Colors.red),
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //         ),
                //       ),
                //     ),
                //
                //     decoration: BoxDecoration(
                //         borderRadius:
                //             new BorderRadius.all(new Radius.circular(8)),
                //         color: Colors.grey.shade200),
                //     width: 290,
                //     height: 6.h,
                //     //margin: new EdgeInsets.fromLTRB(20, 20, 20, 210),
                //     //padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                //   ),
                // ),
                SizedBox(
                  height: 0.h,
                ),

                InkWell(
                  onTap: () {
                    CallLoader.loader();

                    _addAdressController.checkaddAdress();
                    //_addAdressController.update();
                    _addressListController.update();
                    _addressListController.addresListApi();
                  },
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: size.height * 0.05,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: MyTheme.loginbuttonColor,
                      ),
                      child: Center(
                          child: Text(
                        'Add Address',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    ),
                  ),
                ),
                // CustomButtom(
                //   buttonColor: MyTheme.loginbuttonColor,
                //   buttontext: 'Add Address',
                //   textColor: Theme.of(context).colorScheme.onPrimary,
                //   handleButtonClick: () {
                //     CallLoader.loader();
                //     _addAdressController.checkaddAdress();
                //     // if (_formKey.currentState!.validate()) {
                //     //   register(
                //     //       _nameController.text.toString(),
                //     //       _emailController.text.toString(),
                //     //       _passsController.text.toString(),
                //     //       _passsController.text.toString(),
                //     //       _confirmController.text.toString());
                //     // }
                //   },
                // ),
                // Container(
                //   width: size.width * 0.7,
                //   decoration: BoxDecoration(
                //     color: MyTheme.loginbuttonColor,
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //   child: ElevatedButton(
                //     //key: _formkeyphones,
                //     onPressed: () {
                //       _addAdressController.checkaddAdress();
                //       // Navigator.of(context).push(
                //       //   MaterialPageRoute(builder: (context) => AddressList()),
                //       // );
                //     },
                //     style: ButtonStyle(
                //       foregroundColor:
                //           MaterialStateProperty.all<Color>(Colors.white),
                //       backgroundColor:
                //           MaterialStateProperty.all<Color>(Colors.green),
                //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //         RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(8.0),
                //         ),
                //       ),
                //     ),
                //     child: Padding(
                //       padding: EdgeInsets.all(14.0),
                //       child: Text(
                //         'Add Address',
                //         style: TextStyle(fontSize: 14),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
