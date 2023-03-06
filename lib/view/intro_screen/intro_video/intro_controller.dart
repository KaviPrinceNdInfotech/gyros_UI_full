import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class IntroVideoBoxController extends GetxController {
  final source =
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
  VideoPlayerController? controller;
  RxBool isLoader = true.obs;
  @override
  void onInit() {
    super.onInit();
    controller?.setVolume(0.0);
    Get.delete<VideoPlayerController>();

    controller =
        // VideoPlayerController.network(
        //     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")
        VideoPlayerController.asset(""
            //"lib/assets/asset/welcome_video.mp4"
            "lib/assets/asset/gyros_intro.mp4")
          ..addListener(() => update())
          ..setLooping(false)
          ..initialize().then((_) {
            controller!.play();
            update();

            isLoader.value = false;
          });

    @override
    void dispose() {
      // Get.delete<controller>();
      super.dispose();
      controller?.setVolume(0.0);
      controller?.dispose();
    }
    // @override
    // void dispose() {
    //   VideoLectureController.dispose();
    //   chewieController.dispose();
    //   super.dispose();
    // }
  }
}
