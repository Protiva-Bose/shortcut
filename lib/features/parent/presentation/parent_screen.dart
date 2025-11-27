import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:theshortkutbran/features/explore/presentation/views/explore_screen.dart';
import '../../auth/sign_in.dart';
import '../../customer/booking/presentation/booking_screen.dart';
import '../../customer/booking/presentation/screen/booking_option_screen.dart';
import '../../customer/home/presentation/view/screen/home_flow.dart';
import '../../customer/main_booking/booking_profile_details.dart';
import '../../customer/profile/profile_screen.dart';
import '../../customer/second_booking/select_date.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _colorAnimation = _controller.drive(
      TweenSequence<Color?>([
        TweenSequenceItem(
          tween: ColorTween(
            begin: Colors.deepPurple.shade200,
            end: Colors.blueAccent.shade100,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: ColorTween(
            begin: Colors.blueAccent.shade200,
            end: Colors.pinkAccent.shade200,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: ColorTween(
            begin: Colors.pinkAccent.shade200,
            end: Colors.deepPurple.shade200,
          ),
          weight: 1,
        ),
      ]),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleNavChange(int index) {
    context.read<ParentScreenProvider>().changeIndex(index);

    setState(() {
      _isPressed = index == 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ParentScreenProvider>(
      builder: (__, navParentProvider, child) {
        final List<Widget> pages = [
          const HomeFlow(),
          const ExploreScreen(),
          BookingOptionScreen(),
          const ProfileScreen(),
        ];

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: IndexedStack(
                    index: navParentProvider.selectedIndex,
                    children: pages,
                  ),
                ),
                Container(
                  height: 75.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 12,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 15.w),

                      // Home
                      Expanded(
                        child: _buildNavigationDestinationBar(
                          context: context,
                          index: 0,
                          label: 'Home',
                          iconPath: 'assets/icons/p1.svg',
                          selectedIconPath: 'assets/icons/r1.svg',
                          isSelected: navParentProvider.selectedIndex == 0,
                          selectedIconColor: Colors.black,
                          unselectedIconColor: Colors.grey.shade900,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),

                      // Notes
                      Expanded(
                        child: _buildNavigationDestinationBar(
                          context: context,
                          index: 1,
                          label: 'Explore',
                          iconPath: 'assets/icons/p2.svg',
                          selectedIconPath: 'assets/icons/explore_black.svg',
                          isSelected: navParentProvider.selectedIndex == 1,
                          selectedIconColor: Colors.black,
                          unselectedIconColor: Colors.grey.shade900,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),

                      // Tests
                      Expanded(
                        child: _buildNavigationDestinationBar(
                          context: context,
                          index: 2,
                          label: 'Booking',
                          iconPath: 'assets/icons/p3.svg',
                          selectedIconPath: 'assets/icons/r3.svg',
                          isSelected: navParentProvider.selectedIndex == 2,
                          selectedIconColor: Colors.black,
                          unselectedIconColor: Colors.grey.shade900,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),

                      // Profile
                      Expanded(
                        child: _buildNavigationDestinationBar(
                          context: context,
                          index: 3,
                          label: 'Profile',
                          iconPath: 'assets/icons/p4.svg',
                          selectedIconPath: 'assets/icons/user_black.svg',
                          isSelected: navParentProvider.selectedIndex == 3,
                          selectedIconColor: Colors.black,
                          unselectedIconColor: Colors.grey.shade900,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),

                      SizedBox(width: 12.w),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavigationDestinationBar({
    required BuildContext context,
    required int index,
    required double width,
    required double height,
    required String label,
    required String iconPath,
    required bool isSelected,
    required String selectedIconPath,
    Color selectedIconColor = Colors.white,
    Color unselectedIconColor =  Colors.grey,
  }) {
    return SizedBox(
      width: 50.w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => _handleNavChange(index),
              child: SvgPicture.asset(
                isSelected ? selectedIconPath : iconPath,
                width: width,
                height: height,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? selectedIconColor : Colors.black38,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParentScreenProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}