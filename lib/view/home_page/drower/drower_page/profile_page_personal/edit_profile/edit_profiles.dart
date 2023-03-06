import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/constants/buttons/customs_buttons.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/widgets/text_field_decorator.dart';
import 'package:gyros_app/widgets/user_text_field.dart';
import 'package:sizer/sizer.dart';

class EditProfiless extends StatelessWidget {
  final _formkeys = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passsController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  // String userIdErrorText = 'User Id Can not found';
  // String userIdHinttext = 'Enter User Id';
  // Color UserIdHintTextColor = AppColors.themecolors;
  // IconData useridTextFieldPrefixicon = Icons.person;
  // Color userIdErrorTextColor = AppColors.themecolors;
  // Color useridTextFieldPrefixIconColor = AppColors.themecolors;
  EditProfiless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Edit Profile',
          style: TextStyle(
              color: AppColors.themecolors, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
            onTap: () {
              Get.back();
              // _homePageController.toggle(index);
              //Get.to(() => WalkTracking());
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.themecolors,
            )),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formkeys,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                  // image: DecorationImage(
                  //     image: NetworkImage(
                  //         'https://images.pexels.com/photos/7267055/pexels-photo-7267055.jpeg?auto=compress&cs=tinysrgb&w=600'
                  //         //'https://images.pexels.com/photos/8805182/pexels-photo-8805182.jpeg?auto=compress&cs=tinysrgb&w=600'
                  //         //'https://images.pexels.com/photos/6280438/pexels-photo-6280438.jpeg?auto=compress&cs=tinysrgb&w=600'
                  //         //'https://images.pexels.com/photos/6280438/pexels-photo-6280438.jpeg?auto=compress&cs=tinysrgb&w=600'
                  //         //'https://images.pexels.com/photos/6280388/pexels-photo-6280388.jpeg?auto=compress&cs=tinysrgb&w=600'
                  //         //'https://images.pexels.com/photos/6674392/pexels-photo-6674392.jpeg?auto=compress&cs=tinysrgb&w=600'
                  //         //'https://images.pexels.com/photos/4258186/pexels-photo-4258186.jpeg?auto=compress&cs=tinysrgb&w=600',
                  //         //'https://images.unsplash.com/photo-1590779033100-9f60a05a013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
                  //         //'https://img.freepik.com/free-photo/fresh-vegetables-with-price-tags-shelf-grocery-store-supermarket_342744-1397.jpg?w=1800&t=st=1656765079~exp=1656765679~hmac=960f81d4a643d71d68c26c50e5b182ce5cee8ee12935b54cbf72f66ea89c3425'
                  //         //'https://images.unsplash.com/photo-1608686207856-001b95cf60ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80'
                  //         //'https://img.freepik.com/free-photo/woman-with-tablet-buying-healthy-food-supermarket-grocery-store_342744-1110.jpg?t=st=1656747606~exp=1656748206~hmac=cad4fcedf9befb2991319f1634acc32b038e0757fc8cb569c84777d87febd9be&w=1800'
                  //         // 'https://images.unsplash.com/photo-1579113800032-c38bd7635818?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
                  //         //'https://images.wallpapersden.com/image/download/las-vegas-night-hotel_Zmxtbm6UmZqaraWkpJRmbmdlrWZlbWU.jpg'
                  //         //'https://i.pinimg.com/originals/01/96/c1/0196c1f3432b1a2ebac601dadb7b92cd.jpg'
                  //         ),
                  //     fit: BoxFit.fitHeight)
                  ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        image: DecorationImage(
                          image: AssetImage('lib/assets/asset/guser_logo.png'),
                          fit: BoxFit.fitWidth,
                        ),
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
                    height: 1.h,
                  ),

                  TextFieldDecorator(
                    child: UserIdTextField(
                      // useridTextFieldPrefixicon
                      useridController: nameController,
                      userIdErrorText: 'Name can not be empty',
                      userIdHintText: 'Edit Name',
                      userIdHintTextColor: AppColors.themecolors,
                      userIdErrorTextColor: AppColors.themecolors,
                      useridTextFieldPrefixIcon: Icons.person,
                      useridTextFieldPrefixIconColor: AppColors.themecolors,

                      onUseridValueChange: (value) {},
                    ),
                  ),

                  SizedBox(
                    height: 0.h,
                  ),

                  TextFieldDecorator(
                    child: UserIdTextField(
                      // useridTextFieldPrefixicon
                      useridController: emailController,
                      userIdErrorText: 'Email can not be empty',
                      userIdHintText: 'Edit Email',
                      userIdHintTextColor: AppColors.themecolors,
                      userIdErrorTextColor: AppColors.themecolors,
                      useridTextFieldPrefixIcon: Icons.email,
                      useridTextFieldPrefixIconColor: AppColors.themecolors,

                      onUseridValueChange: (value) {},
                    ),
                  ),

                  TextFieldDecorator(
                    child: UserIdTextField(
                      // useridTextFieldPrefixicon
                      useridController: mobileController,
                      userIdErrorText: 'Mobile can not be empty',
                      userIdHintText: 'Edit Mobile',
                      userIdHintTextColor: AppColors.themecolors,
                      userIdErrorTextColor: AppColors.themecolors,
                      useridTextFieldPrefixIcon: Icons.phone_android,
                      useridTextFieldPrefixIconColor: AppColors.themecolors,

                      onUseridValueChange: (value) {},
                    ),
                  ),

                  SizedBox(
                    height: 0.h,
                  ),

                  TextFieldDecorator(
                    child: UserIdTextField(
                      // useridTextFieldPrefixicon
                      useridController: passsController,
                      userIdErrorText: 'Area can\'t',
                      userIdHintText: 'Edit Area',
                      userIdHintTextColor: AppColors.themecolors,
                      userIdErrorTextColor: AppColors.themecolors,
                      useridTextFieldPrefixIcon: Icons.location_city,
                      useridTextFieldPrefixIconColor: AppColors.themecolors,

                      onUseridValueChange: (value) {},
                    ),
                  ),

                  TextFieldDecorator(
                    child: UserIdTextField(
                      // useridTextFieldPrefixicon
                      useridController: confirmController,
                      userIdErrorText: 'Pin can not be empty',
                      userIdHintText: 'Enter Your Pin',
                      userIdHintTextColor: AppColors.themecolors,
                      userIdErrorTextColor: AppColors.themecolors,
                      useridTextFieldPrefixIcon: Icons.fiber_pin_rounded,
                      useridTextFieldPrefixIconColor: AppColors.themecolors,

                      onUseridValueChange: (value) {},
                    ),
                  ),

                  SizedBox(
                    height: 1.h,
                  ),

                  CustomButtom(
                    buttonColor: MyTheme.loginbuttonColor,
                    buttontext: 'UPDATE',
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    handleButtonClick: () {
                      //Get.to(() => NavBar());
                    },
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
