import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/widgets/appbar/simple_appbar.dart';

class ChooseLocationScreen extends StatelessWidget {
  const ChooseLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// APPBAR
      appBar: CustomServiceAppBar(
        title: 'Choose Location',
        backgroundColor: Colors.white,
        titleColor: Colors.black,
        iconColor: Colors.black,
        leadingContainerColor: Colors.grey.shade100,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
          
              /// MAP IMAGE
              Container(
                height: 240.h,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.asset(
                  'assets/images/map1.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.h),
          
              /// REST OF CONTENT
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          
                      /// SEARCH BAR
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          hintText: 'Search....',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 14.sp,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade800,
                            size: 24.sp,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade50,
                        ),
                      ),
          
                      SizedBox(height: 20.h),
          
                      /// HEADING
                      Text(
                        "Popular Location",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
          
                      SizedBox(height: 16.h),
          
                      /// LIST SECTION
                      Expanded(
                        child: ListView(
                          children: [
                            _locationTile(
                              title: "Los Angeles",
                              subtitle: "California, United States",
                              distance: "3.21 KM",
                            ),
                            _divider(),
                            _locationTile(
                              title: "San Francisco",
                              subtitle: "2118 Thornridge Cir. Syracuse...",
                              distance: "2.24 KM",
                            ),
                            _divider(),
                            _locationTile(
                              title: "New York",
                              subtitle: "2118 Thornridge Cir. Syracuse...",
                              distance: "2.84 KM",
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
      ),
    );
  }

  /// ------------------ Divider ------------------
  Widget _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Container(
        height: 1,
        color: Colors.grey[300],
      ),
    );
  }

  /// ------------------ Location Tile ------------------
  Widget _locationTile({
    required String title,
    required String subtitle,
    required String distance,
  }) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, size: 28, color: Colors.black),
        SizedBox(width: 12.w),

        /// TEXT SECTION
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey[600],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        /// DISTANCE
        Text(
          distance,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
