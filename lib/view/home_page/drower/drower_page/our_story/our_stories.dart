import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gyros_app/constants/app_colors.dart';
import 'package:gyros_app/controllers/our_story_controller.dart';
import 'package:sizer/sizer.dart';

class OurStory extends StatelessWidget {
  OurStory({Key? key}) : super(key: key);

  OurStoryController _ourStoryController = Get.put(OurStoryController());

  @override
  Widget build(BuildContext context) {
    final List<String> text1 = [
      'New',
      'New',
      'BestSeller',
      'BestSeller',
      'New',
      'New',
      'BestSeller',
      'BestSeller',
    ];
    final List<String> text2 = [
      'Gift 1',
      'Gift 2',
      "Gift 3",
      'Gift 4',
      'Gift 5',
      'Gift 6',
      "Gift 7",
      'Gift 8',
    ];

    final List<String> image1 = [
      'lib/assets/asset/gft11.jpeg',
      'lib/assets/asset/gft33.jpeg',
      'lib/assets/asset/gft44.jpeg',
      'lib/assets/asset/gft66.jpeg',
      'lib/assets/asset/gft11.jpeg',
      'lib/assets/asset/gft33.jpeg',
      'lib/assets/asset/gft44.jpeg',
      'lib/assets/asset/gft66.jpeg',
    ];
    final List<String> image3 =[
      'https://gyros.farm/static/media/yogesh.8231c4ac.png',
      'https://gyros.farm/static/media/richa.4379d0f0.png',
      'https://gyros.farm/static/media/pratik.417fa071.png'
    ];
    final List<String> text3 =[
      'Yogesh Tyagi',
      'Richa Singh Chandel',
      'Pratik Mishra'
    ];
    final List<String> text4 =[
      'Yogesh Tyagi is a Mechanical Engg Graduate. He is a teacher having touched lakhs of lives in his career of — years. A unique idea of connecting farmer communities to the average city lives changed the course of his career. Yogesh started to develop a product that had a large scale impact, from farmer communities to the health of millions. A product that is simple and unique. This entrepreneurial spirit amped up with the passion for social causes created Gyros.',
      'Richa Singh Chandel is a Biology Major. When Covid-19 struck the world, she witnessed the effects of it personally. She realized the lacuna that exists in the health sector. The traditional knowledge is being eliminated. She, inspired by the health crisis, wanted to create a product that can be assimilated into our lives easily. Gyros was created with the intention of transforming kitchen and eating habits.',
      'Pratik Mishra is a Civil Engg Graduate. He has taught an astounding number of students in his teaching career of — years. Being passionate about social causes and touching lives for the better, he was on a lookout for a unique opportunity. During covid he realized the health of an average indian citizen is usually compromised. After realizing this, he wanted to make efforts to create a product that touches lives and adds value to every age and strata'
    ];
////peope
    final List<String> image4 =[
      'https://gyros.farm/static/media/Anilkumar.5a505d9f.png',
      'https://gyros.farm/static/media/Bikesh.c9214045.png',
      'https://gyros.farm/static/media/titleshwari.6097742f.png',
      'https://gyros.farm/static/media/sagar.40715b62.png',
      'https://gyros.farm/static/media/meenu.a9b55adf.png',
      'https://gyros.farm/static/media/po.a5965335.png'
    ];
    final List<String> text6 =[
      'Anil Kumar',
      'Beekesh Tyagi',
      'Titleshwari',
      'Sagar Shukla',
      'Meenu',
      'Surajbhan'
    ];
    final List<String> text7 =[
      '(Manager Manufaturing)',
      '(Manager Operation)',
      '(Manager Packaging)',
      '(Admin Operations)',
      '(Operations)',
      '(Admin)',
    ];
    Size size = MediaQuery.of(context).size;
    var base = 'https://api.gyros.farm/Images/';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Our Story',
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
            () => (_ourStoryController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : _ourStoryController.ourStoryModel == null
            ? Center(
          child: Text('No data'),
        )
            : SingleChildScrollView(
          child: Container(
            //height: size.height,
            width: size.width,
            child: Column(
              children: [
                Container(
                  height: size.height * 0.4,
                  width: size.width,
                  decoration: BoxDecoration(
                     // color: Colors.yellowAccent,
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://img.freepik.com/premium-photo/hand-planting-corn-seed-marrow-vegetable-garden-with-sunshine_34152-1616.jpg?size=626&ext=jpg&ga=GA1.2.1026641998.1659416747',
                            // 'https://images.unsplash.com/photo-1467217322460-5f03dc33a28e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
                            //'https://images.unsplash.com/photo-1467217322460-5f03dc33a28e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
                          ),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  //height: size.height * 0.44,
                  // width: size.width,
                  //color: Colors.yellowAccent,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 0.h,
                        ),
                        Text(
                          'Our Journey',
                          style: GoogleFonts.roboto(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          """In 2020 the world came to a halt, Coronavirus hit us out of nowhere. What came at the forefront was the compromised immunity of millions. Richa Tyagi, a graduate major in biology, was deeply intrigued. What are the leading causes of declining immune response?
Did you know that refined oil is the leading cause of cardiovascular ailments?
In an attempt to solve a concern that has roots in our kitchen, she started a journey that led her to the largest oil processing unit in northern India.There she discovered something peculiar.
The ancient art of cold pressed oils has metamorphosed into a motorized process. Made using mechanical pressers, adulterated elements, and stored in plastic, the edible oil is already sub substandard by the time it reaches your cabinets. Herein lay a golden opportunity for Richa to counter this lack of authenticity in the process of making oils. Her loss perpetuated a vision for a finer livelihood and wellness. Where did this vision take her?
It took her back to the time of conventional time-honored craft of cold-pressed oils.
How was this ancient art manifested in a modern factory?
Using wooden plungers and a stone base. It generates minimal heat, processed at room temperature. This in turn leads to almost no nutrient loss due to heat being significantly less.
Elimination of heat generation during the making, which contributed to the loss of nourishment in the oil is what makes Gyros a standout Brand.
Accompanied by zero adulteration and minimal plastic contact, Gyros reaches the shelves as hallmarks of purity.
The story of Gyros is a tale of a woman trying to find answers to matters that affect 90% of the population along the latitude of the word. The transparency vowed in our products is testimony to our traditional value system. We as a brand borrow heavily from our traditions and that catapults us to the level of transparency we cater to our customers.
As a young child, Richa had seen how oils were made using mortar and pestle at home. Her vision magnified this memory into a brand. This story takes us to another chapter of Richa’s Journey.
How can she give back to the community that feeds us?
With this thought was born “ Endeavor Farms”. An entrepreneurial effort meant to empower rural farmers that completely do away with middlemen. Gyros are closely associated with the farmers from the seeding to the harvesting. We provide them with world-class support and technique for cultivating crops at a global standard. Our sincerity towards ethical sourcing and our commitment to giving back to our food makers made Gyros a possibility.
As a Brand pledged towards an improvised world our voyage takes us from seed to spoon.
Reducing processing damages and magnifying the nutrition spectrum is the USP of Gyros. From tradition to trust, Gyros envisions an agrarian utopia. Our desire to reverse and heal unhealthy living brought us to the arena of the wellness industry. Our products are a manifestation of organic utility, rustic heritage, and modern science.""",
                          style: GoogleFonts.poppins(
                              fontSize: 7.7.sp, wordSpacing: 1
                            // fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Container(
                  height: size.height * 0.98,
                  width: 100.w,
                  color: Colors.pink.shade50,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        'Our Team',
                        style: GoogleFonts.roboto(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Text(
                          """The GYROS family comprises a crew of fifteen hustlers who are fully dedicated to the dream of making India healthier again. Having seen the horrors of a pandemic firsthand, this startup is all about rethinking food habits. We believe that nourishment is the finer thing in life and must be consciously intermingled with our diet.""",
                          style: GoogleFonts.poppins(
                              fontSize: 8.5.sp, wordSpacing: 1
                            // fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 2.w),
                        child: SizedBox(
                          height: 73.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: image3.length,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: PhysicalModel(
                                    color: Colors.grey,
                                    borderRadius:
                                    BorderRadius.circular(15),
                                    elevation: 7,
                                    shadowColor: Colors.green,
                                    child: Container(
                                      //height: 49.h,
                                      width: size.width * 0.31,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 10.h,
                                            width: 20.w,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(image3[index])),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(text3[index],textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                              fontSize: 12.sp,
                                              fontWeight:
                                              FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(
                                                2.0),
                                            child: Text(
                                              text4[index],
                                              // """Being from a family, I know the hardship they face. Equipping them with techology, financial aid , and foodprocessing  machines will generate more value for them. And in turn, This leads to haelth and traneable food for consume.""",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 8.5.sp,
                                                  wordSpacing: 1
                                                // fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'People Who Makes it Possible',
                  style: GoogleFonts.roboto(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Container(
                  height: size.height * 0.25,
                  width: 100.w,
                  color: Colors.pink.shade50,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 2.w),
                        child: SizedBox(
                          height: 22.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: image4.length,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: PhysicalModel(
                                    color: Colors.grey,
                                    borderRadius:
                                    BorderRadius.circular(15),
                                    elevation: 7,
                                    shadowColor: Colors.green,
                                    child: Container(
                                      //height: 49.h,
                                      width: size.width * 0.31,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 2),
                                            height: 10.h,
                                            width: 20.w,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(image4[index])),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(text6[index],textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                              fontSize: 12.sp,
                                              fontWeight:
                                              FontWeight.w700,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(
                                                2.0),
                                            child: Text(
                                              text7[index],textAlign: TextAlign.center,
                                              // """Being from a family, I know the hardship they face. Equipping them with techology, financial aid , and foodprocessing  machines will generate more value for them. And in turn, This leads to haelth and traneable food for consume.""",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 8.5.sp,
                                                  wordSpacing: 1
                                                // fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}