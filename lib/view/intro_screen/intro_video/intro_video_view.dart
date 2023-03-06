import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:gyros_app/view/custom_widgets/my_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import 'intro_controller.dart';

class IntroVideo extends StatelessWidget {
  IntroVideo({Key? key}) : super(key: key);
  IntroVideoBoxController _introVideoBoxController =
      Get.put(IntroVideoBoxController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      //height: size.height * 0.95,
      child: ListView.builder(
          //physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                _introVideoBoxController.controller!.value.isPlaying;
                BoxFit.cover;
                // ? _introVideoBoxController.controller!.pause()
                // : _introVideoBoxController.controller!.play();
              },
              child: Stack(
                children: [
                  Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        gradient: MyTheme.gradient1,
                      ),
                      child: Obx(() {
                        if (_introVideoBoxController.isLoader.value == false &&
                            _introVideoBoxController.controller != null &&

                            //_introVideoBoxController.controller.setVolume(0)
                            _introVideoBoxController
                                .controller!.value.isInitialized) {
                          return VideoPlayer(
                            _introVideoBoxController.controller!,
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })

                      //     ?  VideoPlayer(_videoLectureController.controller!)
                      //     : Center(
                      //         child: CircularProgressIndicator(),
                      //       ),
                      ),
                  _introVideoBoxController.controller!.value.isPlaying
                      ? Container()
                      : Icon(
                          Icons.play_arrow,
                          color: Colors.transparent,
                          size: 0.h,
                        ),

                  ///todo here we have video bottom progress indicartor
                  // Positioned(
                  //     bottom: 0,
                  //     child: SizedBox(
                  //       height: 1.3.h,
                  //       width: 100.w,
                  //       child: VideoProgressIndicator(
                  //           _videoLectureController.controller!,
                  //           allowScrubbing: true),
                  //     ))
                ],
              ),
            );
          }),
    );
  }
}
