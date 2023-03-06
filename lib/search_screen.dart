import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:gyros_app/view/botttom_nav_bar/bottom_navbar.dart';
import 'package:gyros_app/view/cart_new_section/controllers_cart/product_controller.dart';
import 'package:gyros_app/view/home_page/home_page_controller.dart';
import 'package:gyros_app/view/home_page/profile/home_page_practice.dart';
import 'controllers/flash_sale_product_by_id_controllers/flash_product_by_id_controller.dart';
import 'controllers/new_detail_controller.dart';
import 'getProductController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';


class SearchScreen extends StatelessWidget {

  SearchScreen({Key? key}) : super(key: key);
  NewController _newProductByIdController = Get.put(NewController());
  NavController _navController = Get.put(NavController(), permanent: false);
  HomePageController _homePageController = Get.put(HomePageController());
  FlashProductByIdController _flashProductByIdController =
  Get.put(FlashProductByIdController());
  final ProductssController _controller = Get.put(ProductssController());
  var base = 'https://api.gyros.farm/Images/';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
       // backgroundColor: appTheme,
        body: Obx((() => (_controller.isLoading.value)
            ? Center(
          child: CircularProgressIndicator(),
        )
            : SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 20,
                // ),
                Container(
                  height: size.height * 0.20,
                  //width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[Color(0xff3a923b) ,Color(0xffb5d047) ]
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: GestureDetector(
                              onTap: (){
                                _navController.tabindex(0);
                                Get.to(() => NavBar());
                              },
                              child: SizedBox(
                                height: size.height*0.1,
                                width:  size.width*0.1,
                                // height: 40,
                                // width: 40,
                                // child: ElevatedButton(
                                //   onPressed: () {
                                //     // Add your onPressed code here!
                                //   },
                                //   style: ButtonStyle(
                                //     backgroundColor: Colors.white70,
                                //   ),
                                //
                                //
                                //   child:  Icon(Icons.arrow_back_ios_outlined , color: Colors.white),
                                // ),
                              ),
                            ),
                          ),
                          // Image.asset("lib/assets/app_icon/guser_logo.png")
                          Container(
                            height: size.height*0.1,
                            width: size.width*0.8,
                            // height: 80,
                            // width: 100,
                            color: Colors.transparent,
                            child: Image.asset("lib/assets/asset/guser_logo.png"),

                          ),
                        ],
                      ),

                      Padding(
                        padding:  EdgeInsets.only(
                          top: 80 ,
                          left: 40,
                          // top: 80 ,
                          // left: 40,
                        ),
                        child: Container(
                          height:  size.height * 0.06,
                          width:  size.height * 0.40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              //border: Border.all(),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: 8),
                            child: TextField(
                              onChanged: (value) => _controller.filterProducts(value),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search Item",  hintStyle: TextStyle(color: Colors.blue),
                                  suffixIcon: InkWell(
                                    // onTap: (() {
                                    //   _controller.getResults();
                                    // }),
                                      child: Icon(Icons.search , color: Colors.blue,))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // SizedBox(
                //   height: 40,
                // ),
                _controller.foundProducts.value.isEmpty
                    ? Center(child: Text("No Result Found"))
                    : SizedBox(
                      height: size.height*0.67,
                      child: ListView.builder(
                        shrinkWrap: true,
                        //physics: NeverScrollableScrollPhysics(),
                        itemCount: _controller.foundProducts.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left: 20 , right: 20 , bottom: 10 , top: 10),
                                child: Container(
                                  height: size.height * 0.12,
                                  //height: 80,

                                  width: size.height * 0.86,
                                  decoration: BoxDecoration(
                                    // color: Colors.grey,
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5.3,
                                            color: Colors.blueGrey)
                                      ]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:  EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: (){
                                            _newProductByIdController
                                                .productid =
                                                _homePageController
                                                    .getflashsellproduct!
                                                    .result![
                                                index]
                                                    .id
                                                    .toString();
                                            _newProductByIdController
                                               .newproductbyIdApi();
                                            // _flashProductByIdController
                                            //     .productid =
                                            //     _homePageController
                                            //         .getflashsellproduct!
                                            //         .result![
                                            //     index]
                                            //         .id
                                            //         .toString();
                                            // _flashProductByIdController
                                            //     .flashproductbyIdApi();
                                          },
                                          child: Container(
                                            height: size.height * 0.1,
                                            //height: 100,
                                            child: Image.network(base +
                                                '${_controller.foundProducts[index].productImage}'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                        // height: 10,
                                      ),
                                      Container(
                                        // height: 28,
                                        // width: 180,
                                        height: size.height * 0.04,
                                        width: size.height * 0.3,

                                        child: Center(
                                          child: AutoSizeText(
                                            "${_controller.foundProducts[index].productName}",
                                            style: GoogleFonts.actor(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 20,
                              // )
                            ],
                          );
                        }),
                      ),
                    )
              ],
            ),
          ),
        ))));
  }
}