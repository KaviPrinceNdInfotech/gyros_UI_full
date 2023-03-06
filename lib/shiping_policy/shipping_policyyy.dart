import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/shipping_policy_controller/shipping_policy_controller.dart';
import 'package:sizer/sizer.dart';

class ShippingPolicy extends StatelessWidget {
  ShippingPolicy({Key? key}) : super(key: key);

  ShippingPolicyController _shippingPolicyController =
      Get.put(ShippingPolicyController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Shipping Policy',
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
        () =>
            _shippingPolicyController.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : _shippingPolicyController.shippingpolicyModel == null
                    ? Center(
                        child: Text('No Data'),
                      )
                    :
            SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: size.height,
              width: size.width,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Order once accepted will be delivered usually within 5 days. Delivery times are affected by product availability, customers’ geographic location, and shipping destination & courier partner’s delivery time to location. A minimal fee may be applicable on orders below a defined amount as displayed during checkout. In case of one or more defective products in your order, please register a single complaint, as the return/replacement will be arranged only once. Customers are advised not to accept tampered or damaged shipments.',
                      // _shippingPolicyController
                      //     .shippingpolicyModel!.result!.shipping
                      //     .toString(),
                      // """Gyros collaborate with multiple courier partners for shipping across india. we only have standard  shipping available at the moments .Depending on the location , it takes 2-9 days to be delivered. we a.\n\nGyros reverse the right to cancel an order  within 48 hours from the times of order.""",
                      style: GoogleFonts.raleway(
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
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
