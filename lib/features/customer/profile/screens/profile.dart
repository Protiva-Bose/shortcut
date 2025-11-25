import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../app/widgets/appbar/simple_appbar.dart';
import '../../../../app/widgets/textfield/custom_textFiels.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String selectedGender = "Female";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomServiceAppBar(
        title: 'Profile',
        backgroundColor: Colors.transparent,
        titleColor: Colors.black,
        iconColor: Colors.black,
        leadingContainerColor: Colors.black12,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/profile.png',
                          scale: 1.5,
                        ),
                      ),
                      Positioned(
                        right: 2.w,
                        top: 60.h,
                        child: Image.asset(
                          'assets/images/edit_pic.png',
                          scale: 3,
                        ),
                      ),
                    ],
                  ),
                ),

                CustomTextField(
                  hintText: "Enter your first name",
                  text: 'First Name',
                ),
                CustomTextField(
                  hintText: "Enter your last name",
                  text: 'Last Name',
                ),
                CustomTextField(
                  hintText: "Enter your email address",
                  text: 'Email',
                ),
                CustomTextField(
                  hintText: "Date of Birth",
                  suffixIcon: Icon(Icons.calendar_today, color: Colors.black),
                  text: 'Date of Birth',
                ),
                CustomTextField(
                  hintText: "Location",
                  suffixIcon: SizedBox(
                    width: 8.w,
                    height: 8.h,
                    child: Icon(Icons.edit_location_alt_outlined),
                    // child: SvgPicture.asset('assets/icons/location.svg'),
                  ),
                  text: 'Location',
                ),
                Text(
                  'Gender',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    color: Colors.grey.shade800,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150.w,
                      height: 40.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              30.r,
                            ), // radius 30
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedGender = "Male";
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 22.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                color: selectedGender == "Male"
                                    ? Colors.black
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30.r),
                                border: selectedGender == "Male"
                                    ? null
                                    : Border.all(color: Colors.grey),
                              ),
                              child: selectedGender == "Male"
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  : null,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 15),

                    SizedBox(
                      width: 150.w,
                      height: 40.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              30.r,
                            ), // radius 30
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedGender = "Female";
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 22.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                color: selectedGender == "Female"
                                    ? Colors.black
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30.r),
                                border: selectedGender == "Female"
                                    ? null
                                    : Border.all(color: Colors.grey),
                              ),
                              child: selectedGender == "Female"
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  : null,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 42.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff4A4C56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Center(child: Text('Save Changes')),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
