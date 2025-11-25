import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theshortkutbran/app/widgets/appbar/simple_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theshortkutbran/core/constant/route_names.dart';
import 'package:theshortkutbran/features/auth/sign_in.dart';

import '../../../app/widgets/cards/select_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomServiceAppBar(
        title: 'Setting',
        backgroundColor: Colors.transparent,
        titleColor: Colors.black,
        iconColor: Colors.black,
        leadingContainerColor: Colors.black12,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                leading: Image.asset('assets/images/profile.png'),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Wade Warren',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '@WadeWarren',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Personal Info',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                  color: Colors.black,
                ),
              ),
              MenuListTile(
                svgIconPath: 'assets/icons/user.svg',
                title: 'Profile',
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.profile);
                },
              ),
              MenuListTile(
                svgIconPath: 'assets/icons/per2.svg',
                title: 'Wallet',
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.settingsScreen);
                },
              ),
              MenuListTile(
                svgIconPath: 'assets/icons/per3.svg',
                title: 'User Selection',
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.settingsScreen);
                },
              ),
              Text(
                'Manage Requests',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                  color: Colors.black,
                ),
              ),
              MenuListTile(
                svgIconPath: 'assets/icons/per4.svg',
                title: 'Notifications',
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.settingsScreen);
                },
              ),
              Text(
                'Security',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                  color: Colors.black,
                ),
              ),
              MenuListTile(
                svgIconPath: 'assets/icons/per5.svg',
                title: 'Change Password',
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.newPasswordPage);
                },
              ),
              MenuListTile(
                svgIconPath: 'assets/icons/per5.svg',
                title: 'Forgot Password',
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.settingsScreen);
                },
              ),
              MenuListTile(
                svgIconPath: 'assets/icons/per6.svg',
                title: 'Security',
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.settingsScreen);
                },
              ),
              Text(
                'About',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                  color: Colors.black,
                ),
              ),
              MenuListTile(
                svgIconPath: 'assets/icons/per7.svg',
                title: 'Legal and Policies',
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.settingsScreen);
                },
              ),
              MenuListTile(
                svgIconPath: 'assets/icons/per8.svg',
                title: 'Help and Support',
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.helpAndSupport);
                },
              ),

              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 30.h),

                            Text(
                              'Are you sure you want to logout?',
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: 8.h),

                            SizedBox(height: 16.h),

                            SizedBox(
                              height: 40.h,
                              width: 170.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context); // close dialog
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ),
                                );
                              },
                              child: Text(
                                'Log Out',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: SvgPicture.asset('assets/icons/logout.svg'),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
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
}
