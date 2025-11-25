import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theshortkutbran/app/widgets/textfield/custom_textFiels.dart';
import 'package:theshortkutbran/core/constant/route_names.dart';
import 'package:theshortkutbran/features/auth/selection/enter_otp.dart';
import 'package:theshortkutbran/features/parent/presentation/parent_screen.dart';

class PhoneNumberVerify extends StatefulWidget {
  const PhoneNumberVerify({super.key});

  @override
  State<PhoneNumberVerify> createState() => _PhoneNumberVerifyState();
}

class _PhoneNumberVerifyState extends State<PhoneNumberVerify> {
  bool obscure1 = true;
  bool obscure2 = true;

  final TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Text(
                'Hi, Welcome Back! 👋',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'ShortKut ',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 65.h),
              Container(
                height: 510.h,
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    left: 15,
                    right: 15,
                    bottom: 20,
                  ),
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: '+88 01XXXXXXXX',
                        text: 'Phone Number',
                      ),


                      SizedBox(height: 10.h),
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
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtpScreen()));
                          },
                          child: Center(
                            child: Text(
                              'Continue with Number',
                              style: TextStyle(fontSize: 15.sp),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Row(spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Line.png',scale: 3.4,),
                          Text(
                            'Or continue with',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          Image.asset('assets/images/Line.png',scale: 3.4,),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.shade400
                                ),
                                borderRadius: BorderRadius.circular(30.r)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Icon(Icons.apple,size: 25.sp,),
                            ),
                          ),
                          Image.asset('assets/images/Google Button.png',scale: 3.5,)
                        ],
                      ),
                      SizedBox(height: 15.h),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, RouteNames.signUp);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Don’t have an account? ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )

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
}
