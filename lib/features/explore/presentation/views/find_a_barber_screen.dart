import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/widgets/appbar/simple_appbar.dart';
import '../../../../core/constant/route_names.dart';

class FindABarberScreen extends StatefulWidget {
  const FindABarberScreen({super.key});

  @override
  State<FindABarberScreen> createState() => _FindABarberScreenState();
}

class _FindABarberScreenState extends State<FindABarberScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// APPBAR
      appBar: CustomServiceAppBar(
        title: 'Find A Barber',
        backgroundColor: Colors.white,
        titleColor: Colors.black,
        iconColor: Colors.black,
        leadingContainerColor: Colors.grey.shade100,
      ),

      body: SafeArea(
        child: Column(
          children: [
            /// MAP IMAGE
            Container(
              height: 160.h,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Image.asset(
                'assets/images/map.png',
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 16.h),

            /// CONTENT AREA
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "All Service",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Over 04 Barber",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 8.h),
                    Expanded(
                      child: ListView(
                        children: [
                          serviceTile(
                            context: context,

                            index: 0,
                            isSelected: selectedIndex == 0,
                            image: "assets/images/user1.png",
                            name: "Aaron Schmeler",
                            price: "\$22.00",
                            service: "Hair Styling - The Gentleman’s Cut",
                            rating: "4.3",
                            experience: "2 Year Experiments",
                          ),
                          SizedBox(height: 12.h),

                          serviceTile(
                            context: context,

                            index: 1,
                            isSelected: selectedIndex == 1,
                            image: "assets/images/user2.png",
                            name: "Abraham Ledner",
                            price: "\$24.00",
                            service: "Hair Styling - The Gentleman’s Cut",
                            rating: "4.7",
                            experience: "6 Year Experiments",
                          ),
                          SizedBox(height: 12.h),

                          serviceTile(
                            context: context,

                            index: 2,
                            isSelected: selectedIndex == 2,
                            image: "assets/images/user3.png",
                            name: "Abraham Ledner",
                            price: "\$20.00",
                            service: "Hair Extensions - Sharp & Dapper",
                            rating: "4.7",
                            experience: "4 Year Experiments",
                          ),
                          SizedBox(height: 12.h),

                          serviceTile(
                            context: context,
                            index: 3,
                            isSelected: selectedIndex == 3,
                            image: "assets/images/user4.png",
                            name: "Gladys Lily",
                            price: "\$25.00",
                            service: "Heat Specialist - Classic Blade",
                            rating: "4.2",
                            experience: "3.5 Year Experiments",
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
    );
  }

  /// SERVICE TILE WIDGET WITH SELECTION
  Widget serviceTile({
    required context,
    required int index,
    required bool isSelected,
    required String image,
    required String name,
    required String price,
    required String service,
    required String rating,
    required String experience,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });

        Navigator.pushNamed(context, RouteNames.barberProfileScreen);
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                'assets/images/user1.png',
                height: 70.h,
                width: 70.w,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 12.w),

            /// DETAILS
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 3.h),

                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  Text(
                    service,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 6.h),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16.sp),
                      SizedBox(width: 5.w),

                      Text(
                        rating,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(width: 10.w),

                      Text(
                        experience,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
