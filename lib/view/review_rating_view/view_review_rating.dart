import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gyros_app/controllers/new_detail_controller.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/productDetailController.dart';

class ViewReviewRating extends StatelessWidget {
   ViewReviewRating({Key? key}) : super(key: key);

  NewController _newProductByIdController = Get.put(NewController());
   ProductDetailController _controller = Get.put(ProductDetailController());



   @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var base = 'https://api.gyros.farm/Images/';

    ///todo: it is last of how to pass product id in project..........

    return Obx(
          () => (_newProductByIdController.isLoading.value)
          ? Center(child: CircularProgressIndicator())
        : _newProductByIdController.getProductreview?.result == null

        ? Center(
      child: Text('No List'),
    )
          : Container(
        height: size.height*0.2,
        width:size.width,
        decoration: BoxDecoration(
          color: Colors.lightGreen.shade200,
        ),
        child: ListView.builder(
            itemCount: _newProductByIdController.getProductreview?.result.length,
            itemBuilder: (BuildContext context , int index) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  //height: size.height*0.04,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: size.height*0.09,
                        width: size.width*0.2,
                        decoration: BoxDecoration(

                              image: DecorationImage(
                                  image: NetworkImage(base + "${_newProductByIdController.getProductreview?.result[index].image.toString()}"),
                                  fit: BoxFit.cover)

                        ),
                      ),
                      SizedBox(
                        width: size.width*0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("${_newProductByIdController.getProductreview?.result[index].name}"?? ''),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          Text("${_newProductByIdController.getProductreview?.result[index].title}"?? ''),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          Text("${_newProductByIdController.getProductreview?.result[index].description}"?? ''),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}

// Obx(
// () => (_standOutController
//     .isLoading.value)
// ? Center(
// child:
// CircularProgressIndicator())
//     : _standOutController
//     .getstandoutpoints!
//     .result!
//     .isEmpty
// ? Center(
// child: Text('No data'),
// )
//     : Container(
// height: size.height*0.2,
// width: size.width,
// decoration: BoxDecoration(
// color: Colors.lightGreen.shade200,
// ),
// child: ListView.builder(
// itemCount: 6,
// itemBuilder: (BuildContext context , int indexxxx) {
// return Padding(
// padding: const EdgeInsets.all(2.0),
// child: Container(
// //height: size.height*0.04,
// width: size.width,
// decoration: BoxDecoration(
// color: Colors.black12,
// ),
// ),
// );
// }
// ),
// ),
// ),

