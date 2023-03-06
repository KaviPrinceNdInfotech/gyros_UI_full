import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:gyros_app/widgets/search_texfield_decoration.dart';
import 'package:gyros_app/widgets/search_textfield.dart';
import 'package:sizer/sizer.dart';

class ExploreView extends StatelessWidget {
  final _searchkey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  ExploreView({Key? key}) : super(key: key);

  final List<String> image2 = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZFWvbpHgQ52duSVJbtvK3C2T2OfrCv8TN3g&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDrYFTzUD-kkj18aNDkGKzt-ZVXWVusHViOQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjkQ7OvBH1-S-hFZGbc_kxXwgBjkrzDt7vHg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP1Ukf5MU84Wpni0y1-NIrKGOm-GXOBvqwjg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZFWvbpHgQ52duSVJbtvK3C2T2OfrCv8TN3g&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDrYFTzUD-kkj18aNDkGKzt-ZVXWVusHViOQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjkQ7OvBH1-S-hFZGbc_kxXwgBjkrzDt7vHg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP1Ukf5MU84Wpni0y1-NIrKGOm-GXOBvqwjg&usqp=CAU',
  ];

  final List<String> text2 = [
    'Mangoes',
    'Oil',
    "cabage",
    'Honey',
    'Mangoes',
    'Oil',
    "cabage",
    'Honey',
  ];
  final List<String> text3 = [
    'Fruits',
    'Oil',
    "Vegetables",
    'Ghee',
    'Fruits',
    'Oil',
    "Vegetables",
    'Ghee',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _searchkey,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(

                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,

                    child: Text('Explore',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyTheme.ThemeColors,
                            fontSize: 15.sp,
                          )),
                    ),
                  ),
                  Container(
                    height: size.height * 0.06,
                    // width: 100.w,
                    decoration: BoxDecoration(
                      color: MyTheme.ContainerUnSelectedColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.pin_drop,
                            size: 15.sp,
                            color: MyTheme.ThemeColors,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Delivery To',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 7.sp,
                                ),
                              ),
                              Text(
                                'New Ashok Nagar Delhi- 110096',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 22.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.edit,
                            size: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SearchFieldDecorator(
                    child: SearchTextField(
                      // useridTextFieldPrefixicon
                      useridController: searchController,

                      userIdErrorText: 'Please Search',
                      userIdHintText: 'Mangoes',

                      userIdHintTextColor: Colors.black,
                      userIdErrorTextColor: AppColors.themecolors,
                      useridTextFieldPrefixIcon: Icons.search,
                      useridTextFieldPrefixIconColor: AppColors.themecolors,

                      onUseridValueChange: (value) {},
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    height: size.height * 0.65,
                    child: GridView.builder(
                        //physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 4 / 2,
                                mainAxisExtent: 200,
                                crossAxisSpacing: 3,
                                mainAxisSpacing: 0),
                        itemCount: text2.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(6.0),
                            child: InkWell(
                              onTap: () {
                                // _homePageController.toggle(index);
                                //Get.to(() => WalkTracking());
                              },
                              child: PhysicalModel(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffeff8f5),
                                elevation: 0.1,
                                child: Container(
                                  height: 55.h,
                                  width: size.width * 0.98,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: MyTheme.ContainerUnSelectedColor,
                                  ),
                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          height: 3.5.h,
                                          width: 22.w,
                                          decoration: BoxDecoration(
                                              color: Colors.yellow,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomRight:
                                                    Radius.circular(20),
                                              )),
                                          child: Center(
                                            child: Text(
                                              'Best Saller',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 9.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Image.network(
                                        image2[index],
                                        width: 30.w,
                                        //'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhrfScAJM3MU-f7T5SOMJ1muAuEqOZ-LEc9SVJDA3QFWKRq7AHJwtT1Xl081tBqoMJeDE&usqp=CAU',
                                        height: size.height * 0.15,
                                        //color: Colors.transparent
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              text3[index],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Icon(
                                              Icons.add_shopping_cart_outlined,
                                              size: 15.sp,
                                              color: Colors.redAccent,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '₹ 50',
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 7.sp,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 25.w,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.w),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '₹ 30',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 8.sp,
                                                      color: MyTheme
                                                          .loginbuttonColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    ' /500 gm',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 5.sp,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 3.5.h,
                                            width: 20.w,
                                            decoration: BoxDecoration(
                                                color: MyTheme.loginbuttonColor,
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                )),
                                            child: Center(
                                              child: Text(
                                                'Save 3%',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 9.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
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
