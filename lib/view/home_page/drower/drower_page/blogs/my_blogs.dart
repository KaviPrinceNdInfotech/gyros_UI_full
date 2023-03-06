import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/blog_list_controller.dart';
import 'package:sizer/sizer.dart';

class Blogss extends StatelessWidget {
  Blogss({Key? key}) : super(key: key);
  BlogListController _blogListController = Get.put(BlogListController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var base = 'https://api.gyros.farm/Images/';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Gyros Blogs',
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
      body: Obx(
        () => SafeArea(
          child: _blogListController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : _blogListController.blogmodel == null
                  ? Center(
                      child: Text('No Data'),
                    )
                  : Container(
                      height: size.height,
                      width: size.width,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.3,
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          //'https://cdn.shopify.com/s/files/1/0270/3346/9006/articles/pexels-lucky-trips-2802368_1_1200x.jpg'
                                          'https://images.unsplash.com/photo-1502086223501-7ea6ecd79368?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aW5kaWFuJTIwZmxhZyUyMHdpdGglMjBjaGlsZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1400&q=60'),
                                      fit: BoxFit.cover)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1.3.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // InkWell(
                                        //   onTap: () {
                                        //     Get.to(() => SearchPage());
                                        //   },
                                        //   child: Container(
                                        //     height: size.height * 0.05,
                                        //     width: size.width * 0.5,
                                        //     decoration: BoxDecoration(
                                        //       color: Colors.white,
                                        //       borderRadius:
                                        //           BorderRadius.circular(10),
                                        //     ),
                                        //     child: Row(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment
                                        //               .spaceBetween,
                                        //       children: [
                                        //         Padding(
                                        //           padding:
                                        //               const EdgeInsets.all(5.0),
                                        //           child: Text(
                                        //             'Search',
                                        //             style: TextStyle(
                                        //               fontSize: 10.sp,
                                        //               color: Colors.grey,
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         Container(
                                        //           height: size.height * 0.05,
                                        //           width: size.width * 0.11,
                                        //           decoration: BoxDecoration(
                                        //             color: Colors.green,
                                        //             borderRadius:
                                        //                 BorderRadius.circular(
                                        //                     10),
                                        //           ),
                                        //           child: Icon(
                                        //             Icons.search,
                                        //             color: Colors.white,
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                        SizedBox(
                                          // height: size.height * 0.25,
                                          //width: size.width * 0.5,
                                          child: Text(
                                            'Simple and \nTasty Healthy\n Recipes.',
                                            style: GoogleFonts.abrilFatface(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Latest',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.35,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      //4,
                                      _blogListController
                                          .blogmodel!.result!.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return SizedBox(
                                      height: size.height * 0.35,
                                      width: size.width * 0.4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Container(
                                              height: size.height * 0.19,
                                              width: size.width * 0.4,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        base +
                                                            '${_blogListController.blogmodel!.result![index].imagePath.toString()}',
                                                      ),
                                                      fit: BoxFit.cover),
                                                  color: Colors.amber,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              // child: Image.network(
                                              //   base +
                                              //       '${_blogListController.blogmodel!.result![index].imagePath.toString()}',
                                              //   fit: BoxFit.fill,
                                              //   errorBuilder:
                                              //       (context, error, stackTrace) {
                                              //     //if image not comming in catagary then we have to purchase
                                              //
                                              //     return Icon(
                                              //       Icons.error,
                                              //       color: Colors.grey,
                                              //     );
                                              //   },
                                              //
                                              //   height: size.height * 0.04,
                                              //   // color: _homePageController
                                              //   //             .selectedIndex
                                              //   //             .value ==
                                              //   //         index
                                              //   //     ? Colors.white
                                              //   //     : MyTheme.ThemeColors
                                              // ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 7),
                                            child: Text(
                                              _blogListController.blogmodel!
                                                  .result![index].title
                                                  .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 9.sp,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 7),
                                            child: SizedBox(
                                              height: size.height * 0.03,
                                              width: size.width * 0.38,
                                              child: Text(
                                                _blogListController
                                                    .blogmodel!
                                                    .result![index]
                                                    .createContent
                                                    .toString(),
                                                style: GoogleFonts.acme(
                                                  fontSize: size.height * 0.011,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black45,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Divider(),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 1.5.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Gyros Farm',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey.shade800,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                Text(
                                                  'August 15, 2022',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey,
                                                    fontSize: 9,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Text(
                                'Gyros Blogs',
                                style: GoogleFonts.radioCanada(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: size.height * 0.5,
                                width: size.width * 0.97,
                                decoration: BoxDecoration(
                                  color: Color(0xfff5e1e1),
                                  borderRadius: BorderRadius.circular(10),
                                  //image: DecorationImage(image: NetworkImage(''))
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Work With Farmers.',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.h,
                                    ),
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: size.width * 0.46,
                                          height: size.height * 0.4,
                                          decoration: BoxDecoration(
                                              // color: Colors.green,
                                              ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.w),
                                            child: Text(
                                              "One of our essential aims is to work with the farmers. Currently, we are sourcing our raw material from the toilsome farmers of Uttar Pradesh and Rajasthan. The price that we provide our farmers is competitive and far better than the market rates. Our sincerity towards giving back to our food givers forms the core of our organization. At Gyros our products are a labor of love and compassion. It starts with sourcing the seeds which are done keeping the ‘Farmer First’ thought in our mind.",

//                                               """D2C healthy food brand Gyros Thursday said it raised Rs 3.67 crore in a seed round led by DSG Consumer Partners, along with Titan Capital and Anjali Bansal from Avaana Capital. Existing investors, including boAt Lifestyle and Beardo founders, also participated in the round.  Anveshan will use the funds to hire new talent and strengthen and standardise its manufacturing units.
// It will also enhance its operational processes, improve quality
// control parameters, and R&D of new products. ...""",
                                              style: GoogleFonts.arapey(
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1),
                                          child: Container(
                                            width: size.width * 0.46,
                                            height: size.height * 0.3,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      'https://gyros.farm/static/media/workfarm12.723539e4.jpeg'),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            // SizedBox(
                            //   height: size.height * 0.99,
                            //   child: GridView.builder(
                            //       physics: NeverScrollableScrollPhysics(),
                            //       //scrollDirection: Axis.horizontal,
                            //       gridDelegate:
                            //           SliverGridDelegateWithMaxCrossAxisExtent(
                            //               maxCrossAxisExtent: 200,
                            //               childAspectRatio: 3 / 2,
                            //               crossAxisSpacing: 5,
                            //               mainAxisExtent: size.height * 0.50,
                            //               mainAxisSpacing: 7),
                            //       itemCount: _blogListController
                            //           .blogmodel!.result!.length,
                            //       itemBuilder: (BuildContext ctx, index) {
                            //         return SizedBox(
                            //           height: size.height * 0.50,
                            //           width: size.width * 0.5,
                            //           child: Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: [
                            //               Padding(
                            //                 padding: EdgeInsets.all(5.0),
                            //                 child: Container(
                            //                   height: size.height * 0.22,
                            //                   width: size.width * 0.5,
                            //                   alignment: Alignment.center,
                            //                   decoration: BoxDecoration(
                            //                       image: DecorationImage(
                            //                           image: NetworkImage(
                            //                             base +
                            //                                 '${_blogListController.blogmodel!.result![index].imagePath.toString()}',
                            //                           ),
                            //                           fit: BoxFit.cover),
                            //                       color: Colors.amber,
                            //                       borderRadius:
                            //                           BorderRadius.circular(
                            //                               15)),
                            //                   child: Padding(
                            //                     padding: EdgeInsets.all(8.0),
                            //                     // child:
                            //                     // Image.network(
                            //                     //   base +
                            //                     //       '${_blogListController.blogmodel!.result![index].imagePath.toString()}',
                            //                     //   fit: BoxFit.fitHeight,
                            //                     //   errorBuilder: (context, error,
                            //                     //       stackTrace) {
                            //                     //     //if image not comming in catagary then we have to purchase
                            //                     //
                            //                     //     return Icon(
                            //                     //       Icons.error,
                            //                     //       color: Colors.grey,
                            //                     //     );
                            //                     //   },
                            //                     //
                            //                     //   // height: size.height * 0.22,
                            //                     //   // color: _homePageController
                            //                     //   //             .selectedIndex
                            //                     //   //             .value ==
                            //                     //   //         index
                            //                     //   //     ? Colors.white
                            //                     //   //     : MyTheme.ThemeColors
                            //                     // ),
                            //                   ),
                            //                 ),
                            //               ),
                            //               SizedBox(
                            //                 height: 0.5.h,
                            //               ),
                            //               Padding(
                            //                 padding: EdgeInsets.only(
                            //                     left: size.width * 0.011),
                            //                 child: Text(
                            //                   """Why are experts opposing mandatory food fortification by FSSAI?""",
                            //                   style: TextStyle(
                            //                     fontWeight: FontWeight.bold,
                            //                     fontSize: 10.sp,
                            //                     color: Colors.black,
                            //                   ),
                            //                 ),
                            //               ),
                            //               SizedBox(
                            //                 height: 0.5.h,
                            //               ),
                            //               Padding(
                            //                 padding: EdgeInsets.only(
                            //                     left: size.width * 0.011),
                            //                 child: Text(
                            //                   """Recently, FSSAI decided to mandate the fortification of rice and edible oils with vitamins and minerals. Through this, they plan to combat malnutrition in India. In response, a cohort of...""",
                            //                   style: GoogleFonts.acme(
                            //                     fontSize: 8.sp,
                            //                     fontWeight: FontWeight.bold,
                            //                     color: Colors.black45,
                            //                   ),
                            //                 ),
                            //               ),
                            //               SizedBox(
                            //                 height: 0.5.h,
                            //               ),
                            //               Padding(
                            //                 padding: const EdgeInsets.all(4.0),
                            //                 child: Divider(),
                            //               ),
                            //               Padding(
                            //                 padding: EdgeInsets.symmetric(
                            //                     horizontal: 1.5.w),
                            //                 child: Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment
                            //                           .spaceBetween,
                            //                   children: [
                            //                     Text(
                            //                       'Gyros Farm',
                            //                       style: TextStyle(
                            //                         fontWeight: FontWeight.w500,
                            //                         color: Colors.grey.shade800,
                            //                         fontSize: 10,
                            //                       ),
                            //                     ),
                            //                     Text(
                            //                       'August 15, 2022',
                            //                       style: TextStyle(
                            //                         fontWeight: FontWeight.w400,
                            //                         color: Colors.grey,
                            //                         fontSize: 9,
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         );
                            //       }),
                            // ),
                          ],
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}
