import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../custom_widgets/my_theme.dart';

final String appName = 'Gyros';
final String repoURL = 'https://www.shiprocket.in/shipment-tracking/';

class WaveViewHomePage extends StatefulWidget {
  WaveViewHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _WaveViewHomePageState createState() => _WaveViewHomePageState();
}

class _WaveViewHomePageState extends State<WaveViewHomePage> {
  _buildCard({
    required Config config,
    Color? backgroundColor = Colors.transparent,
    DecorationImage? backgroundImage,
    double height = 152.0,
  }) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: height,
      width: double.infinity,
      child: Card(
        elevation: 12.0,
        margin: EdgeInsets.only(
            right: marginHorizontal, left: marginHorizontal, bottom: 16.0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: WaveWidget(
          config: config,
          backgroundColor: backgroundColor,
          backgroundImage: backgroundImage,
          size: Size(double.infinity, double.infinity),
          waveAmplitude: 0,
        ),
      ),
    );
  }

  double marginHorizontal = 19.0;

  void _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    marginHorizontal = 16.0 +
        (MediaQuery.of(context).size.width > 512
            ? (MediaQuery.of(context).size.width - 512) / 2
            : 0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.containercolor1,
        title: Text(widget.title!),
        elevation: 2.0,
        actions: [
          IconButton(
            onPressed: () {
              _launchUrl(repoURL);
            },
            icon: Image.asset(
              //'icons/ic_github.png',
              'lib/assets/asset/guser_logo.png',
              //package: 'web3_icons',
              width: 140.0,
              height: 70.0,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 3.h),
                _buildCard(
                  height: 500.0,
                  backgroundImage: DecorationImage(
                    image: AssetImage('lib/assets/asset/guser_logo.png'),
                    fit: BoxFit.cover,
                    colorFilter:
                    ColorFilter.mode(Colors.white, BlendMode.softLight),
                  ),
                  backgroundColor: Colors.purpleAccent,
                  config: CustomConfig(
                    gradients: [
                      [Colors.red, Color(0xEEF44336)],
                      [Colors.red[800]!, Color(0x77E57373)],
                      [Colors.orange, Color(0x66FF9800)],
                      [Colors.yellow, Color(0x55FFEB3B)]
                    ],
                    durations: [35000, 19440, 10800, 6000],
                    heightPercentages: [0.20, 0.30, 0.40, 0.50],
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.topRight,
                  ),
                ),
                // _buildCard(
                //   height: 25.0,
                //   // backgroundImage: DecorationImage(
                //   //   image: NetworkImage(
                //   //     'https://images.unsplash.com/photo-1554779147-a2a22d816042?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3540',
                //   //   ),
                //   //   fit: BoxFit.cover,
                //   //   colorFilter:
                //   //       ColorFilter.mode(Colors.white, BlendMode.softLight),
                //   // ),
                //   config: CustomConfig(
                //       gradients: [
                //         [Colors.red, Colors.purple],
                //         [Colors.redAccent, Colors.blue],
                //
                //         [Colors.lightBlueAccent, Colors.purpleAccent],
                //
                //         [Colors.deepPurple, Colors.black],
                //
                //         // Colors.pink[400]!,
                //         // Colors.pink[300]!,
                //         // Colors.pink[200]!,
                //         // Colors.pink[100]!
                //       ],
                //       gradientBegin: Alignment.centerLeft,
                //       gradientEnd: Alignment.centerRight,
                //       durations: [35000, 19440, 10800, 6000],
                //       heightPercentages: [0.20, 0.23, 0.25, 0.30],
                //       blur: MaskFilter.blur(BlurStyle.solid, 40)),
                // ),

                // _buildCard(
                //     config: CustomConfig(
                //       colors: [
                //         Colors.white70,
                //         Colors.white54,
                //         Colors.white30,
                //         Colors.white24,
                //       ],
                //       durations: [32000, 21000, 18000, 5000],
                //       heightPercentages: [0.25, 0.26, 0.28, 0.31],
                //     ),
                //     backgroundColor: Colors.blue[600]),
                // Align(
                //   child: Container(
                //     height: 128,
                //     width: 128,
                //     decoration:
                //         BoxDecoration(shape: BoxShape.circle, boxShadow: [
                //       BoxShadow(
                //         color: Color(0xFF9B5DE5),
                //         blurRadius: 2.0,
                //         spreadRadius: -5.0,
                //         offset: Offset(0.0, 8.0),
                //       ),
                //     ]),
                //     child: ClipOval(
                //       child: WaveWidget(
                //         config: CustomConfig(
                //           colors: [
                //             Color(0xFFFEE440),
                //             Color(0xFF00BBF9),
                //           ],
                //           durations: [
                //             5000,
                //             4000,
                //           ],
                //           heightPercentages: [
                //             0.65,
                //             0.66,
                //           ],
                //         ),
                //         backgroundColor: Color(0xFFF15BB5),
                //         size: Size(double.infinity, double.infinity),
                //         waveAmplitude: 0,
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 88,
                // ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'lib/assets/asset/guser_logo.png',
                          //package: 'web3_icons',
                          width: 32.0,
                          height: 32.0,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Made in Gyros lab',
                          style: GoogleFonts.robotoMono(
                            color: Colors.grey[500],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              _launchUrl(repoURL);
                            },
                            child: Container(
                              height: 5.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: MyTheme.containercolor5,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Click here Track Order',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  height: 48,
                  child: WaveWidget(
                    config: CustomConfig(
                      colors: [
                        Colors.indigo[400]!,
                        Colors.indigo[300]!,
                        Colors.indigo[200]!,
                        Colors.indigo[100]!
                      ],
                      durations: [18000, 8000, 5000, 12000],
                      heightPercentages: [0.65, 0.66, 0.68, 0.70],
                    ),
                    size: Size(double.infinity, double.infinity),
                    waveAmplitude: 0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}