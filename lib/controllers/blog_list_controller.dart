import 'package:get/get.dart';
import 'package:gyros_app/models/blog_model.dart';
import 'package:gyros_app/services/api_provider.dart';

class BlogListController extends GetxController {
  RxBool isLoading = true.obs;

  BlogModel? blogmodel;

  void BlogApi() async {
    isLoading(true);

    blogmodel = await ApiProvider.BlogPostApi();
    if (blogmodel != null) {
      //Get.to(() => ItemDetailss());
      isLoading(false);

      //Get.to(()=>Container());
    }
  }

  @override
  void onInit() {
    BlogApi();
    //subcatidApi();
    super.onInit();
  }

  @override
  void onClose() {
    blogmodel = null;
    super.onClose();
  }

  @override
  void dispose() {
    blogmodel = null;
    super.dispose();
  }
}
