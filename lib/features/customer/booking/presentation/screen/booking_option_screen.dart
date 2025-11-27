import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:theshortkutbran/features/customer/booking/presentation/view_model/booking_provider.dart';

import '../../../../../app/widgets/appbar/simple_appbar.dart';
import '../../../../../core/constant/route_names.dart';

class BookingOptionScreen extends StatefulWidget {
  const BookingOptionScreen({super.key});

  @override
  State<BookingOptionScreen> createState() => _BookingOptionScreenState();
}

class _BookingOptionScreenState extends State<BookingOptionScreen> {
  int selectedIndex = 0;

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
                  'assets/images/map.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'Booking Option',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
          
              /// ------------------ BOOKING OPTIONS ADDED HERE ------------------
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Booking Option",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 14.h),
          
                    buildBookingOption(
                      index: 0,
                      icon: Icons.location_on_outlined,
                      title: "On-Demand Barber",
                    ),
          
                    buildBookingOption(
                      index: 1,
                      icon: Icons.calendar_today_outlined,
                      title: "Schedule a Barber",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.findABarber);
                  },
                  child: Container(
                    height: 48.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined, size: 20.w, color: Colors.black,),
                        Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ------------------ Booking Option Widget ------------------
  Widget buildBookingOption({
    required int index,
    required IconData icon,
    required String title,
  }) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => selectedIndex = index);
        
        context.read<BookingProvider>().setSelectedIndex(selectedIndex);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        margin: EdgeInsets.only(bottom: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.black12,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 28.sp, color: Colors.black),
            SizedBox(width: 14.w),

            /// TEXT
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
              ),
            ),

            /// CIRCLE CHECKBOX
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 24.h,
              width: 24.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.black : Colors.black26,
                  width: 2,
                ),
                color: isSelected ? Colors.black : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, color: Colors.white, size: 14.sp)
                  : null,
            )
          ],
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
        Icon(Icons.location_on_outlined, size: 28.sp, color: Colors.black),
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
                  color: Colors.black,
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
