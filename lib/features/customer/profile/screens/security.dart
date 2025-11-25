import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/widgets/appbar/simple_appbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool faceId = true;
  bool rememberPassword = true;
  bool touchId = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomServiceAppBar(
        title: 'Security',
        backgroundColor: Colors.transparent,
        titleColor: Colors.black,
        iconColor: Colors.black,
        leadingContainerColor: Colors.black26,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            buildSettingItem(
              title: 'Face ID',
              subtitle: 'You will hear in app notifications sound',
              value: faceId,
              onChanged: (v) => setState(() => faceId = v),
            ),
            Divider(thickness: 1, color: Colors.grey.shade300),
            buildSettingItem(
              title: 'Remember Password',
              subtitle: 'You will receive requests when using other apps',
              value: rememberPassword,
              onChanged: (v) => setState(() => rememberPassword = v),
            ),
            Divider(thickness: 1, color: Colors.grey.shade300),
            buildSettingItem(
              title: 'Touch ID',
              subtitle:
              'Your device will not go into sleep mode while using Barber app',
              value: touchId,
              onChanged: (v) => setState(() => touchId = v),
            ),
            Divider(thickness: 1, color: Colors.grey.shade300),
          ],
        ),
      ),
    );
  }

  Widget buildSettingItem({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 17.sp, fontWeight: FontWeight.w600)),
                SizedBox(height: 5.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: Colors.black,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }
}
