import 'package:get/get.dart';
import 'package:gyros_app/models/catagary_list_model.dart';
import 'package:gyros_app/models/first_purchase_banner_home_model.dart';
import 'package:gyros_app/models/flash_sall_list_product_model.dart';
import 'package:gyros_app/models/our_offer_permotion_model.dart';
import 'package:gyros_app/models/slider_banner_models.dart';
import 'package:gyros_app/services/api_provider.dart';

class HomePageController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = true.obs;

  void toggle(int index) => selectedIndex.value = index;

  CatagaryListModels? getcatagartlist;
  SliderListModel? getsliderbaner;
  OurOfferPromotionList? getouroffer;
  FirstOrderBanner? getfirstorderbanner;
  FlashSellListProduct? getflashsellproduct;

  //all catagary list .........

  void categoryListssApi() async {
    isLoading(true);
    getcatagartlist = await ApiProvider.AllcatagaryApi();
    if (getcatagartlist != null
        //getcatagartlist!.result!.isNotEmpty
        ) {
      isLoading(false);
    }
  }

  //crusial slider banner api..........

  void sliderBannerApi() async {
    isLoading(true);
    getsliderbaner = await ApiProvider.SliderBannerApi();
    if (getsliderbaner != null
        //getsliderbaner!.bannerImageList!.isNotEmpty
        ) {
      isLoading(false);
    }
  }

  //my_offer_list.....................................

  void ourofferApi() async {
    isLoading(true);
    getouroffer = await ApiProvider.ourOfferApi();
    if (getouroffer != null
        //getouroffer!.result!.isNotEmpty
        ) {
      isLoading(false);
    }
  }

  //first_order_banner.........................

  void firstorderApi() async {
    isLoading(true);
    getfirstorderbanner = await ApiProvider.FirstPurchaseApi();
    if (getfirstorderbanner?.result == null
        //getfirstorderbanner!.result.isNotEmpty
        ) {
      isLoading(false);
    }
  }

  //flash sale product.....list....

  void flashsellproductApi() async {
    isLoading(true);
    getflashsellproduct = await ApiProvider.FlashsellproduuctApi();
    if (getflashsellproduct != null

        //getflashsellproduct!.result!.isNotEmpty
        ) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    categoryListssApi();
    sliderBannerApi();
    ourofferApi();
    firstorderApi();
    flashsellproductApi();
  }

  @override
  void dispose() {
   Get.delete<HomePageController>();
    super.dispose();
  }
}
