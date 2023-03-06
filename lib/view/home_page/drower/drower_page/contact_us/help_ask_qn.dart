import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/post_query_controller/post_querry_controllerss.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:sizer/sizer.dart';

class HelpQuestion extends StatelessWidget {
  HelpQuestion({Key? key}) : super(key: key);

  PostQueryController _postQueryController = Get.put(PostQueryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _postQueryController.postqueryforms,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Submit Questions',
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
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://img.freepik.com/premium-photo/abstract-blur-background-from-hospital-clinic-interior-create-background-design-key-visual-layout_36051-730.jpg?w=2000'
                        //'https://images.unsplash.com/photo-1624380877099-99d6d23910c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
                        //'https://images.unsplash.com/photo-1516638489986-0c17c234db55?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
                        //'https://images.unsplash.com/photo-1657216328532-e03aaa13c089?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjZ8fGJhY2tncm91bmQlMjBibHVyJTIwaW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=1400&q=60'
                        // 'https://images.unsplash.com/photo-1613324158676-0d05c1cf917c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGJhY2tncm91bmQlMjBibHVyJTIwaW1hZ2V8ZW58MHx8MHx8&auto=format&fit=crop&w=1400&q=60'
                        //'https://images.unsplash.com/photo-1645224103587-0d4565e3f5b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80'
                        //'https://images.unsplash.com/photo-1653585759494-c5582e011cfc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1548&q=80'
                        //'https://wc.wallpaperuse.com/wallp/91-919482_s.jpg'
                        ),
                    fit: BoxFit.fill)),
            //color: Colors.purple,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Have a question for\n   Gyros services?',
                      style: GoogleFonts.akayaKanadaka(
                        color: Colors.green,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 20.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black38),
                        image: DecorationImage(
                          image: AssetImage(
                              'lib/assets/asset/75663-call-center-support-lottie-animation.gif'),
                          fit: BoxFit.fill,
                        ),
                        //color: Colors.blueAccent,
                      ),
                      //color: Colors.black,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      controller: _postQueryController.Name,
                      validator: (value) {
                        return _postQueryController.validatename(value!);
                      },
                      style: TextStyle(
                          fontSize: 14.0, height: 1.5, color: Colors.black),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 0.9),
                          ),
                          enabledBorder: OutlineInputBorder(),
                          hintText: 'Name',
                          hintStyle: TextStyle(fontSize: 15),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 4.0),
                          )),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    TextFormField(
                      controller: _postQueryController.Email,
                      validator: (value) {
                        return _postQueryController.validateEmail(value!);
                      },
                      style: TextStyle(
                          fontSize: 14.0, height: 1.5, color: Colors.black),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 0.9),
                          ),
                          enabledBorder: OutlineInputBorder(),
                          hintText: 'Email',
                          hintStyle: TextStyle(fontSize: 15),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 4.0),
                          )),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    TextFormField(
                      controller: _postQueryController.OrderNo,
                      validator: (value) {
                        return _postQueryController.validateOrderNo(value!);
                      },
                      style: TextStyle(
                          fontSize: 14.0, height: 1.5, color: Colors.black),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 0.9),
                          ),
                          enabledBorder: OutlineInputBorder(),
                          hintText: 'Order No',
                          hintStyle: TextStyle(fontSize: 15),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 4.0),
                          )),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    TextFormField(
                      controller: _postQueryController.Message,
                      validator: (value) {
                        return _postQueryController.validateMessage(value!);
                      },
                      maxLines: 4,
                      decoration: InputDecoration(
                          isDense: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 0.9),
                          ),
                          enabledBorder: OutlineInputBorder(),
                          hintText: 'Message',
                          hintStyle: TextStyle(fontSize: 15),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 5.0),
                          )),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    InkWell(
                      onTap: () {
                        _postQueryController.checkPostQuery();
                      },
                      child: Container(
                        height: 5.h, //half of the height size
                        width: size.width,
                        decoration: BoxDecoration(
                          gradient: MyTheme.gradient3,
                          //color: Colors.lightBlueAccent,
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(4),
                        ),

                        child: const Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
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

///todo next focus button in getx import 'package:flutter/cupertino.dart';
///
///
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import 'help_ask_controller.dart';
//
// class HelpQuestion extends StatelessWidget {
//   final HelpAskController _helpAskController = Get.put(HelpAskController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("List"),
//       ),
//       body: Container(
//         margin: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             GetBuilder<HelpAskController>(
//               builder: (value) => Focus(
//                 child: TextFormField(
//                   textInputAction: TextInputAction.next,
//                   decoration: InputDecoration(labelText: "Input 1"),
//                 ),
//                 onFocusChange: (hasFocus) {
//                   _helpAskController.isTextFiledFocus.value;
//                   //_helpAskController.isTextFiledFocus = hasFocus?
//                   // setState(() {
//                   //   isTextFiledFocus = hasFocus;
//                   // });
//                 },
//               ),
//             ),
//             TextFormField(
//               textInputAction: TextInputAction.next,
//               decoration: InputDecoration(labelText: "Input 1"),
//             ),
//             GetBuilder<HelpAskController>(
//                 builder: (value) => RaisedButton(
//                       color: _helpAskController.isTextFiledFocus.value
//                           ? Colors.pink
//                           : Colors.blue,
//                       child: Text("Ok"),
//                       onPressed: () {
//                         print("I am clicked");
//                       },
//                     ))
//           ],
//         ),
//       ),
//     );
//   }
// }
