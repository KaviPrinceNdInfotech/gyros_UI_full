import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/add_address_cotroller/add_adress_controller.dart';
import 'package:gyros_app/controllers/address_list_controller/address_list_controllers.dart';
import 'package:gyros_app/controllers/check_out_controller/check_out_controlles.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/view/model_cart_practice/viewss/adress_pagess/add_address_order.dart';
import 'package:sizer/sizer.dart';

class AddressList extends StatefulWidget {
  AddressList({Key? key}) : super(key: key);

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  AddressListController _addressListController =
      Get.put(AddressListController());
  AddAdressController _addAdressController = Get.put(AddAdressController());
  //CheckoutController _checkoutController = Get.put(CheckoutController());
  _loaddata() async {
    await Get.find<AddressListController>().addaddressModel;
  }

  RxBool isLoading = false.obs;
  // _loaddata() async {

  CheckoutController _checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    _loaddata();
    Size size = MediaQuery.of(context).size;
    //_loaddata();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              ///nov 11.........
              //Navigator.pop(context);
              //Get.to(() => Cartproducts());
              //Get.to(() => TotalPrice());
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.themecolors,
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Address List',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.themecolors,
            ),
          ),
          centerTitle: true,
        ),
        body:
            // GetBuilder<AddressListController>(
            //       init: AddressListController(),
            //       builder: (value) =>

            Obx(
          () => (_addressListController.isLoading.value)
              ? Center(child: CircularProgressIndicator())
              : _addressListController.addaddressModel!.result == null
                  //isEmpty
                  ? Center(
                      child: Text('No Data'),
                    )
                  : Column(
                      children: [
                        Container(
                          height: size.height * 0.78,
                          width: size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1611072295125-59681c5402ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
                                      //'https://images.unsplash.com/photo-1613408181923-f058a1b0e00c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw5NDY4NjEwfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=700&q=60'
                                      // 'https://images.unsplash.com/photo-1563898655817-170c8a11efdf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
                                      ),
                                  fit: BoxFit.cover)),
                          child: SizedBox(
                            height: size.height,
                            width: size.width,
                            ///TODO: here get builder.....you have to integrate.............
                            child: GetBuilder<AddressListController>(
                              init: AddressListController(),
                              builder: (value) => ListView.builder(
                                  itemCount: _addressListController.addaddressModel!.result!.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3.w, vertical: 0.9.h),
                                      child: InkWell(
                                        onTap: () {
                                          ///..........................................new..............



                                          _checkoutController.addressid = _addressListController.addaddressModel!.result![index].id.toString();
                                          _checkoutController.addressidApi();

                                          ///..........................................new..............
                                           _checkoutController.getcheckoutApi();
                                          _checkoutController.update();

                                          //_addressListController.toggle(index);

                                          // if (index == 0) {
                                          //   Get.to(() => TotalPrice());
                                          //   //Get.to(() => BestSeller());
                                          //   //Get.to(() => WaterTracking());
                                          // } else if (index == 1) {
                                          //   Get.to(() => TotalPrice());
                                          //   //Get.to(() => DateOfBirth());
                                          // } else if (index == 2) {
                                          //   Get.to(() => TotalPrice());
                                          //   //Get.to(() => BestSeller());
                                          //   //Get.to(() => WalkTracking());
                                          // } else if (index == 3) {
                                          //   Get.to(() => TotalPrice());
                                          //   //Get.to(() => WalkTracking());
                                          // } else if (index == 4) {
                                          //   Get.to(() => TotalPrice());
                                          //   //Get.to(() => WalkTracking());
                                          // }
                                        },
                                        child: PhysicalModel(
                                          color: Colors.white,
                                          shadowColor: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          elevation: 8,
                                          child: Container(
                                            height: size.height * 0.29,
                                            //color: Colors.white,
                                            decoration: BoxDecoration(
                                              gradient: MyTheme.gradient4,
                                              // _addressListController
                                              //             .selectedIndex.value ==
                                              //         index
                                              //     ? MyTheme.gradient4
                                              //     : MyTheme.gradient4,
                                              ///todo: gradient............
                                              // LinearGradient(
                                              //         begin:
                                              //             Alignment.centerLeft,
                                              //         end:
                                              //             Alignment.centerRight,
                                              //         colors: [
                                              //           Colors.grey.shade400,
                                              //           Colors.black87
                                              //         ],
                                              //       ),
                                              //gradient: MyTheme.gradient4

                                              // color:
                                              //     _addressListController.selectedIndex.value ==
                                              //             index
                                              //         ? Colors.lightBlue.shade200
                                              //
                                              //         : Colors.grey,
                                              border: Border.all(
                                                color: Colors.black26,
                                                // _addressListController
                                                //             .selectedIndex.value ==
                                                //         index
                                                //     ? Colors.white
                                                //     : Colors.black12,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ///here you can write value with index...........
                                                      // Container(
                                                      //   height:
                                                      //       size.height * 0.03,
                                                      //   width:
                                                      //       size.width * 0.06,
                                                      //   decoration:
                                                      //       BoxDecoration(
                                                      //     shape:
                                                      //         BoxShape.circle,
                                                      //     gradient: MyTheme
                                                      //         .sweepGradient1,
                                                      //   ),
                                                      //   child: Center(
                                                      //     child: Text(
                                                      //       //''
                                                      //       //"${_addressListController.addaddressModel!.result![index].toString()}",
                                                      //       '${index + 1}',
                                                      //       style: TextStyle(
                                                      //         fontSize: 12.sp,
                                                      //         fontWeight:
                                                      //             FontWeight
                                                      //                 .bold,
                                                      //         color:
                                                      //             Colors.black,
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      Text(
                                                        'Name:',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.5.h,
                                                      ),
                                                      Text(
                                                        'Mobile: ',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.5.h,
                                                      ),
                                                      Text(
                                                        'State: ',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.5.h,
                                                      ),
                                                      Text(
                                                        'City: ',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.5.h,
                                                      ),
                                                      Text(
                                                        'Area: ',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.5.h,
                                                      ),
                                                      Text(
                                                        'Pin Code: ',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.4.h,
                                                      ),
                                                      SizedBox(
                                                        height: 0.65.h,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // Text(
                                                      //   '',
                                                      //   style: TextStyle(
                                                      //     color: AppColors
                                                      //         .themecolors,
                                                      //     fontSize: 11.sp,
                                                      //     fontWeight:
                                                      //         FontWeight.bold,
                                                      //   ),
                                                      // ),
                                                      SizedBox(
                                                        height: 1.8.h,
                                                      ),
                                                      Text(
                                                        _addressListController
                                                            .addaddressModel!
                                                            .result![index]
                                                            .name
                                                            .toString(),
                                                        //'delhi',
                                                        // _addressListController.addaddressModel!.result![index].city.toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      Text(
                                                        _addressListController
                                                            .addaddressModel!
                                                            .result![index]
                                                            .mobile
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      Text(
                                                        _addressListController
                                                            .addaddressModel!
                                                            .result![index]
                                                            .state
                                                            .toString(),
                                                        //'New Ashok Nagar',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.9.h,
                                                      ),
                                                      Text(
                                                        _addressListController
                                                            .addaddressModel!
                                                            .result![index]
                                                            .city
                                                            .toString(),
                                                        //'New Ashok nagar Market',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.9.h,
                                                      ),
                                                      Text(
                                                        _addressListController
                                                            .addaddressModel!
                                                            .result![index]
                                                            .area
                                                            .toString(),

                                                        //'Noida Sector 15 Metro station',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.9.h,
                                                      ),
                                                      Text(
                                                        _addressListController
                                                            .addaddressModel!
                                                            .result![index]
                                                            .pinCode
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.02,
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
                                  }),
                            ),
                          ),
                        ),
                        //Spacer(),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                          width: size.width * 0.7,
                          decoration: BoxDecoration(
                            color: MyTheme.loginbuttonColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ElevatedButton(
                            //key: _formkeyphones,

                            onPressed: () {
                              ///TODO: here change will be on 14 nov.......
                              ///
                              //_addAdressController.postaddresssApi();
                              ///till here...............................
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => AddAddress()),
                              );
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Text(
                                'Add Address',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                      ],
                    ),
        ));
  }
}
