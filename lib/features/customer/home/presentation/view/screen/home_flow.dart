import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:theshortkutbran/app/widgets/background/set_background.dart';
import 'package:theshortkutbran/core/constant/route_names.dart';

import '../widgets/search_bar_widget.dart';

class HomeFlow extends StatefulWidget {
  const HomeFlow({super.key});

  @override
  State<HomeFlow> createState() => _HomeFlowState();
}

class _HomeFlowState extends State<HomeFlow> {
  final TextEditingController _controller = TextEditingController();
  final PageController _newController = PageController();
  final int _itemCount = 3;

  @override
  void dispose() {
    _controller.dispose();
    _newController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                children: [
                  SearchFieldWithIcons(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Services',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, RouteNames.serviceDetails);
                        },
                        child: Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/service1.png',
                              scale: 3.6,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Adult Packages',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 25),
                      SizedBox(
                        width: 100.w,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/service2.png',
                              scale: 3.6,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Kid Packages',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 25),
                      SizedBox(
                        width: 94.w,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/service3.png',
                              scale: 3.6,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Add Ons',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Align(
                    alignment: AlignmentGeometry.center,
                    child: Text(
                      '17 and Under',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Special For You',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  SizedBox(
                    height: 140.h,
                    child: PageView.builder(
                      controller: _newController,
                      itemCount: _itemCount,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: 300.w,
                              height: 125.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: const Color(0xffD3F4EF),
                              ),

                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 20,
                                    top: 20,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '#PromoToday',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          '30% off hairCut for\nFor Today',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        SizedBox(
                                          width: 105.w,
                                          height: 23.h,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(6.r),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              'Buy Coffee',
                                              style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Image.asset(
                                      'assets/images/man.png',
                                      scale: 3.8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  SmoothPageIndicator(
                    controller: _newController,
                    count: _itemCount,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.black,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 3,
                      spacing: 8.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            Align(
              alignment: AlignmentGeometry.topLeft,
              child: Text(
                '   Upcoming Orders',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
                    height: 220.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.r),
                              topRight: Radius.circular(16.r),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              spacing: 10,
                              children: [
                                Icon(Icons.watch_later_outlined,color: Colors.white,),
                                Text(
                                  'Wed, Jun24',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.sp,
                                      color: Colors.white
                                  ),
                                ),
                                Icon(Icons.circle,color: Colors.grey,size: 6,),
                                Text(
                                  '8:00 AM',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.sp,
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          left: 5.w,
                          right: 5.w,

                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Column(
                              children: [
                                SizedBox(height: 10.h,),

                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 100.h,
                                    child: Image.asset(
                                      'assets/images/map.png',
                                      scale: 4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                ListTile(
                                  leading: Image.asset(
                                    'assets/images/profile.png',
                                  ),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Protiva',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'HairCutting',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11.sp,
                                              color: Colors.grey,
                                            ),
                                          ),

                                          Row(
                                            spacing: 5,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Color(0xffFAD33E),
                                              ),
                                              Text(
                                                '4.8',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11.sp,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                '(532)',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11.sp,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            SizedBox(height: 15.h,),
          ],
        ),
      ),
    );
  }
}
