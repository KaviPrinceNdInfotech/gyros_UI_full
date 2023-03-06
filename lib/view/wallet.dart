
///Wallet code
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gyros_app/controllers/wallet_rozar_pay/wallet_post_controller.dart';
import 'package:gyros_app/controllers/wallet_rozar_pay/wallet_rozar_pay_controller.dart';

import '../controllers/wallet/wallet_controller.dart';
class Wallet extends StatelessWidget {
 Wallet({Key? key}) : super(key: key);
  TextEditingController amount = TextEditingController();
 WalletController _walletController = Get.put(WalletController());
 WalletPostController _walletPostController = Get.put(WalletPostController());
 RozarwalletController _rozarwalletController = Get.put(RozarwalletController());
// final RozarwalletController _rozarPayController = Get.find();
  String text = "No Value Entered";
  @override
  Widget build(BuildContext context) {
    print("jdfkjsdfksldnsdjg: ${_walletPostController.Money.text}");
    // var prefs = GetStorage();
    // //saved amount..........
    // amount = prefs.read(_walletPostController.Money.text);
    // print('1111111111&&&&&&&okoko:${amount}');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title:  Padding(
            padding:  EdgeInsets.only(
              left: size.width*0.2
            ),
            child: Text('Wallet' , style:  TextStyle(
            fontWeight: FontWeight.bold , fontSize: 30
            ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient:
              LinearGradient(
                colors: <
                    Color>[
                  Color(
                      0xff3a923b),
                  Color(
                      0xffb5d047),
                ],
              ),
            ),
          ),
        ),
        body:

                // () => (_walletController.isLoading.value)
                //     ? Center(child: CircularProgressIndicator())
                // //: _walletController.getwalletlist!.result!.isEmpty
                //      // ignore: unnecessary_null_comparison
                //      :_walletController.getwalletlist!.result! == null //isEmpty
                //     ? Center(
                //         child: Text('No List'),
                //       )
                //     :


                Obx(
                        () => (_walletController.isLoading.value)
                        ? Center(child: CircularProgressIndicator())

                      //   :_walletController.getwalletlist!.result! == null //isEmpty
                      //   ? Center(
                      // child: Text('No List'),)

                  : SingleChildScrollView(
              child:
              Padding(
                  padding:  EdgeInsets.only(
                    top: size.height*0.05,
                    left: size.width*0.02,
                    right: size.width*0.02
                  ),
                  child: Container(
                    height: size.height,

                   // color: Colors.green,
                    child: Form(
                      key: _walletPostController.walletamountFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:  EdgeInsets.only(top: size.height*0.04, left: size.height*0.01),
                            // padding:  EdgeInsets.only(top: 20, left: 20),
                            child: Container(
                              child: Text('Add money to Gyros wallet:' ,
                                style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25),),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text('Available balance:' ,
                                    style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                                ),
                                ///wallet Amount
                                SizedBox(
                                  height: size.height*0.1,
                                  width: size.width*0.3,
                                 // color: Colors.red,
                                  child: ListView.builder(
                                    itemCount: 1,
                                  //itemCount: _walletController.getwalletlist?.result.length,
                                    itemBuilder: (BuildContext context , int index){
                                    print("kmmfmlmfklfm: ${_walletController.getwalletlist!.result[index].walletAmount!.toDouble()}");
                                      return
                                      Obx(

                                              () => (_walletController.isLoading.value)
                                              ? Center(child: CircularProgressIndicator())
                                              :_walletController.getwalletlist!.result.isEmpty
                                              ? Center(
                                            child: Text('No List'),
                                          )
                                                  :
                                              Padding(
                                                padding:  EdgeInsets.only(
                                                  top: size.height*0.02
                                                ),
                                                child: Container(
                                                  height: size.height*0.04,
                                                  width: size.width*0.15,
                                                  child: Center(child: Text('₹ ${_walletController.getwalletlist!.result[index].walletAmount!.toDouble()}' ,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold ,
                                                      color: Colors.white,
                                                      fontSize: 15
                                                  ),
                                                  )),

                                                  decoration: BoxDecoration(
                                                      gradient:
                                                      LinearGradient(
                                                        colors: <
                                                            Color>[
                                                          Color(
                                                              0xff3a923b),
                                                          Color(
                                                              0xffb5d047),
                                                        ],
                                                      ),
                                                      borderRadius: BorderRadius.circular(10)
                                                  ),
                                                ),
                                              ),

                                          //     Container(
                                          //   height: size.height*0.1,
                                          //   width: size.width*0.3,
                                          //  // color: Colors.red,
                                          //   child: Center(
                                          //     child: Text('₹ ${_walletController.getwalletlist!.result[index].walletAmount!.toDouble()}',
                                          //       //Text('₹ ${_walletController.getwalletlist?.result[index].walletAmount.toDouble()}',
                                          //
                                          //         style: TextStyle(
                                          //           fontSize: size.height*0.02,
                                          //           color: Colors.black,
                                          //         ),
                                          //       ),
                                          //   ),
                                          // ),
                                      );



                                    },
                                  ),
                                ),

                              ],
                            ),
                          ),

                          SizedBox(
                            height: size.height*0.02,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.04 , right: size.width*0.04),
                            child: TextFormField(
                              controller: _walletPostController.Money,
                              // _walletPostController.Money.text = '100';
                              validator: (value) {
                                return _walletPostController
                                    .validateAmount(value!);
                              },
                              textAlign: TextAlign. center,
                              decoration: InputDecoration(
                                  hintText: 'Enter Money'
                              ),
                            ),
                          ) ,

                          Padding(
                            padding:  EdgeInsets.only(top: size.height*0.04 , left: size.width*0.06 , right: size.width*0.06),
                            // padding: const EdgeInsets.only(top: 20 , left: 10 , right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  onTap: (){
                                    _walletPostController.Money.text = '100';
                                     //amount.text = '100';
                                  },
                                  child: Container(
                                    height: size.height*0.04,
                                    width: size.width*0.15,
                                    child: Center(child: Text('100' , style: TextStyle(
                                        fontWeight: FontWeight.bold ,
                                        color: Colors.white,
                                        fontSize: 15
                                    ),
                                    )),

                                    decoration: BoxDecoration(
                                        gradient:
                                        LinearGradient(
                                          colors: <
                                              Color>[
                                            Color(
                                                0xff3a923b),
                                            Color(
                                                0xffb5d047),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                ) ,
                                InkWell(
                                  onTap: (){
                                    _walletPostController.Money.text = '200';
                                   // amount.text = '200';
                                  },
                                  child: Container(
                                      height: size.height*0.04,
                                      width: size.width*0.15,
                                    child: Center(child: Text('200' , style: TextStyle(
                                        fontWeight: FontWeight.bold ,
                                        color: Colors.white,
                                        fontSize: 15
                                    ),)),

                                    decoration: BoxDecoration(
                                        gradient:
                                        LinearGradient(
                                          colors: <
                                              Color>[
                                            Color(
                                                0xff3a923b),
                                            Color(
                                                0xffb5d047),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    _walletPostController.Money.text = '500';
                                   // amount.text = '500';
                                  },
                                  child: Container(
                                    height: size.height*0.04,
                                    width: size.width*0.15,
                                    child: Center(child: Text('500' , style: TextStyle(
                                        fontWeight: FontWeight.bold ,
                                        color: Colors.white,
                                        fontSize: 15
                                    ),)),

                                    decoration: BoxDecoration(
                                        gradient:
                                        LinearGradient(
                                          colors: <
                                              Color>[
                                            Color(
                                                0xff3a923b),
                                            Color(
                                                0xffb5d047),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                ) ,
                                InkWell(
                                  onTap: (){
                                    _walletPostController.Money.text = '2000';
                                   // amount.text = '2000';
                                  },
                                  child: Container(
                                    height: size.height*0.04,
                                    width: size.width*0.15,
                                    child: Center(child: Text('2000' , style: TextStyle(
                                        fontWeight: FontWeight.bold ,
                                        color: Colors.white,
                                        fontSize: 15
                                    ),)),

                                    decoration: BoxDecoration(
                                        gradient:
                                        LinearGradient(
                                          colors: <
                                              Color>[
                                            Color(
                                                0xff3a923b),
                                            Color(
                                                0xffb5d047),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                ) ,

                              ],
                            ),
                          ),
                          SizedBox(height: 50,),
                          Center(
                            child: InkWell(
                              onTap: (){
                                print("jhgvjdfhvjkfhvfi: ${_walletPostController.Money.text}");
                                // var prefs = GetStorage();
                                // //saved amount..........
                                // amount = prefs.read(_walletPostController.Money.text);
                                // print('1111111111&&&&&&&okoko:${amount}');
                               // _walletPostController.walletPostApi();
                                ///..................................................1feb23
                               // _walletPostController.checkAmount();
                                ///..............................................
                                _rozarwalletController.openCheckout();

                              },
                              child: Container(
                                height: size.height*0.06,
                                width: size.width*0.9,
                                child: Center(
                                    child: Text('Add Money' , style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber
                                ),)),

                                decoration: BoxDecoration(

                                  border: Border.all(color: Colors.amber),

                                  borderRadius: BorderRadius.circular(20),
                                ),

                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
              )
          ),
                ),

      //
    );
  }
}







