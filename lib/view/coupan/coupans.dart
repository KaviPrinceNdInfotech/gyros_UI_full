import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:get/get.dart';
import 'package:flutter_dash/flutter_dash.dart';
import '../../controllers/coupan/get_coupan_controller.dart';
import '../../controllers/coupan_post_controller/coupan_apply_controller.dart';
import '../../controllers/coupan_post_controller/coupan_post_controller.dart';
import '../../controllers/coupan_post_controller/coupan_text_controller.dart';
import '../../controllers/new_user_coupan_controller/new_user_coupan_controller.dart';



class Coupan extends StatelessWidget {
  const Coupan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CoupanController _coupanController = Get.put(CoupanController());
    CoupanListController _coupanListController = Get.put(CoupanListController());
    CoupanPostController _coupanPostController = Get.put(CoupanPostController());
    CoupanApplyController _coupanApplyController = Get.put(CoupanApplyController());
    CoupanTextController _coupanTextController = Get.put(CoupanTextController());

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Coupans' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)),
      ),
      body:
      SingleChildScrollView(
        child: Column(
            children: <Widget>[
              SizedBox(height: size.height*0.02,),
              Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:
                    Container(
                        height: size.height*0.8,
                        width: size.width*0.9,
                        // height: 550,
                        // width: 400,
                        decoration: BoxDecoration(
                            color: Color(0xffddebdd),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:  EdgeInsets.only(top: size.height*0.04, left: size.width*0.02),
                              // padding: const EdgeInsets.only(top: 30, left: 20),
                              child: Text('Available Offers' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: size.width*0.05 , ),
                              child: Divider(),
                            ),
                            SizedBox(
                              height: size.height*0.37,
                              width: size.width,
                              child: ListView.builder(
                                shrinkWrap: true,
                               //itemCount: _coupanListController.getaboutthecoupan!.result.length,
                             itemCount: 3,
                                  itemBuilder: (BuildContext context, int indexx){

                                  return Obx(
                                        () => (_coupanListController.isLoading.value)
                                        ? Center(child: CircularProgressIndicator())
                                        : _coupanListController.getaboutthecoupan!.result.isEmpty
                                        ? Center(
                                      child: Text('No data'),
                                    )
                                 : Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:  EdgeInsets.only(top: size.height*0.01 , left: size.width*0.05),
                                                    child: DottedBorder(
                                                      dashPattern: [4, 2],
                                                      strokeWidth: 1,
                                                      child: Container(
                                                        height: size.height*0.05,
                                                        width: size.width*0.4,
                                                        // height: 40,
                                                        // width: 160,
                                                        color: Color(0xfff7cec8),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:  EdgeInsets.only(left: size.width*0.01 , ),
                                                              child: Text('${_coupanListController.getaboutthecoupan!.result[indexx].couponCode.toString()}',

                                                                style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                                                            ),

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.only(right: size.width*0.01 , top: size.height*0.03),
                                                    child: InkWell(
                                                      onTap: (){

                                                      },
                                                        child: Text('APPLY' , style: TextStyle(color: Colors.red , fontSize: 18 , fontWeight: FontWeight.bold),)),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only( top: size.height*0.03 , left: size.width*0.04 ,),
                                                // padding:  EdgeInsets.only(left: 10 , top: 10),
                                                child: Text('${_coupanListController.getaboutthecoupan!.result[indexx].name.toString()}',
                                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.green),
                                                ),
                                              ),
                                            ],
                                          ),
                                  );
                                }
                              ),
                            ),
//SizedBox(height: size.height*0.02,),
///Second coupan for new user
                            SizedBox(
                              height: size.height*0.1,
                              width: size.width,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 1,
                                   //itemCount: _coupanController.getcoupanproduct?.result?.length,
                                  itemBuilder: (BuildContext context, int indexx){

                                    return Obx(
                                          () => (_coupanController.isLoading.value)
                                          ? Center(child: CircularProgressIndicator())
                                          : _coupanController.getcoupanproduct!.result!.isEmpty
                                          ? Center(
                                        child: Text('No data'),
                                      )

                                      : Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:  EdgeInsets.only(top: size.height*0.02 , left: size.width*0.05),
                                                child: DottedBorder(
                                                  dashPattern: [4, 2],
                                                  strokeWidth: 1,
                                                  child: Container(
                                                    height: size.height*0.05,
                                                    width: size.width*0.4,
                                                    // height: 40,
                                                    // width: 160,
                                                    color: Color(0xfff7cec8),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:  EdgeInsets.only(left: size.width*0.01 , ),
                                                          child: Text(_coupanController.getcoupanproduct!.result![indexx].coupon.toString(),

                                                            style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                                                        ),
                                                        Dash(
                                                            direction: Axis.vertical,
                                                            length: size.height*0.05,
                                                           // dashLength: 15,
                                                            ),
                                                        Padding(
                                                          padding:  EdgeInsets.only(right: size.width*0.02),
                                                          child: Text(_coupanController.getcoupanproduct!.result![indexx].couponCode.toString(),

                                                            style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(right: size.width*0.01 , top: size.height*0.03),
                                                //padding:  EdgeInsets.only(right: 10 , top: 30),
                                                child: InkWell(
                                                  onTap: (){
                                                    _coupanApplyController.applycoupanApi();
                                                  },
                                                    child: Text('APPLY' , style: TextStyle(color: Colors.green , fontSize: 18 , fontWeight: FontWeight.bold),)),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.only( top: size.height*0.02 ,left: size.width*0.04 ),
                                            // padding:  EdgeInsets.only(left: 10 , top: 10),
                                            child: Text(_coupanController.getcoupanproduct!.result![indexx].name.toString(),
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                              ),
                            ),

                           // SizedBox(height: size.height*0.04,),
                            Padding(
                              padding:  EdgeInsets.only(left: size.width*0.01 , right: size.width*0.01),
                              child: DottedLine(

                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: 8 , left: 10 , bottom: 2),
                              child: Text('Got a coupan code? Enter it here' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15
                              ),),
                            ),
                            //api
                            Padding(
                              padding:  EdgeInsets.all(10.0),
                              child: Container(
                                color: Colors.white,
                                child: TextFormField(
                                    //_coupanTextController.textcoupanApi();
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      labelText: 'Enter Coupan code'
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: size.width*0.08, right: size.width*0.08 , top: size.height*0.01),
                              child: InkWell(
                               onTap: (){
                                 _coupanPostController.postcoupanApi(

                                 );
                               },
                                child: Container(
                                  width: double.infinity,
                                  height: size.height * 0.065,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(
                                                0xff3a923b),
                                            Color(
                                                0xffb5d047),
                                          ]),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 0),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          //color: darkShadow,
                                        ),
                                        BoxShadow(
                                          offset: Offset(-1, -1),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          //color: lightShadow,
                                        ),
                                      ]
                                  ),
                                  child: Center(
                                    child: Text(
                                      'SUBMIT',
                                      style: TextStyle(
                                        fontSize: size.width * 0.049,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
              ),


            ],

        ),
      ),


                );


  }
}

