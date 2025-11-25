import '';import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/widgets/appbar/simple_appbar.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  bool obscure1 = true;
  bool obscure2 = true;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomServiceAppBar(
        title: 'Change Password',
        backgroundColor: Colors.transparent,
        titleColor: Colors.black,
        iconColor: Colors.black,
        leadingContainerColor: Colors.black26,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The new password must be different\nfrom the current password',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
              SizedBox(height: 25.h),

              Text('Password',
                  style: TextStyle(
                      fontSize: 16.sp, fontWeight: FontWeight.w600)),
              SizedBox(height: 8.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: obscure1,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w, vertical: 16.h),
                    suffixIcon: GestureDetector(
                      onTap: () => setState(() => obscure1 = !obscure1),
                      child: Icon(
                        obscure1
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 14.h),

              Row(
                children: [
                  Icon(Icons.check, color: Colors.teal, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'There must be at least 8 characters',
                    style: TextStyle(
                        fontSize: 14.sp, color: Colors.teal.shade700),
                  )
                ],
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Icon(Icons.check, color: Colors.teal, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'There must be a unique code like @!#',
                    style: TextStyle(
                        fontSize: 14.sp, color: Colors.teal.shade700),
                  )
                ],
              ),

              SizedBox(height: 30.h),

              Text('Confirm Password',
                  style: TextStyle(
                      fontSize: 16.sp, fontWeight: FontWeight.w600)),
              SizedBox(height: 8.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: TextFormField(
                  controller: confirmController,
                  obscureText: obscure2,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w, vertical: 16.h),
                    suffixIcon: GestureDetector(
                      onTap: () => setState(() => obscure2 = !obscure2),
                      child: Icon(
                        obscure2
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
           SizedBox(height: 80.h,),
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
                  child: Center(child: Text('Submit',style: TextStyle(fontSize: 15.sp),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
