import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theshortkutbran/core/constant/route_names.dart';

import '../../../../../../app/widgets/appbar/simple_appbar.dart';
import '../widgets/search_bar_widget.dart';

class ServiceDetails extends StatefulWidget {
  const ServiceDetails({super.key});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomServiceAppBar(
      title: "Services",
      backgroundColor: Colors.black,
      titleColor: Colors.white,
      iconColor: Colors.white,
      leadingContainerColor: Colors.white10,
    ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 16),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SearchFieldWithIcons(),
                Text(
                  'Adult Packages',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5.h,),
                GestureDetector(onTap: (){
                  Navigator.pushNamed(context, RouteNames.basicPackageScreen);
                },
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/service1.png',
                              scale: 3.8,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Basic\nPackage',
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

                        child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/a2.png',
                              scale: 3.8,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Standard\nPackage',
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
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/a44.png',
                              scale: 3.8,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Premium\nPackage ',
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
                ),
                Divider(),
                SizedBox(height: 10.h,),
                RichText(
                  text: TextSpan(
                    text: 'Kids Packages ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: '(17 and under)',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/service2.png',
                            scale: 3.8,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Basic Package ',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15.w),
                    SizedBox(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/service3.png',
                            scale: 3.8,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Standard Package',
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
                Divider(),
                SizedBox(height: 10.h,),
                Text(
                  'Add-Ons',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/a5.png',
                            scale: 3.8,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Beard Trim or\nShave Only',
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
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/a44.png',
                            scale: 3.8,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Line Up\nOnly',
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

                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/a44.png',
                            scale: 3.8,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Mild Art\nDesign',
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
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/a2.png',
                            scale: 3.8,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Medium Art\nDesign',
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
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/a44.png',
                            scale: 3.8,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Heavy Art\nDesign',
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
                Divider(),
                SizedBox(height: 15.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
