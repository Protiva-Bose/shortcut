import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../app/widgets/appbar/simple_appbar.dart';
import '../../../../app/widgets/textfield/custom_textFiels.dart';
import '../../core/constant/route_names.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String selectedGender = "Female";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomServiceAppBar(
        title: 'Sign Up',
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
                          'assets/images/user_edit.png',
                          scale:3.7,
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
                          backgroundColor: Colors.grey.shade200,
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
                          backgroundColor: Colors.grey.shade200,
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
                SizedBox(height: 40.h),
                SizedBox(
                  height: 42.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.newPassword);
                    },
                    child: Center(child: Text('Create New Account')),
                  ),
                ),
                SizedBox(height: 15.h),

                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, RouteNames.signIn);
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text: "Sign In",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
