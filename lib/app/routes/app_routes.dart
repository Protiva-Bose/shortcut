import 'package:flutter/cupertino.dart';
import 'package:theshortkutbran/features/customer/booking/presentation/booking_screen.dart';
import '../../core/constant/route_names.dart';
import '../../features/auth/new_pass.dart';
import '../../features/auth/selection/service_selection.dart';
import '../../features/auth/selection/user_selection.dart';
import '../../features/auth/sign_in.dart';
import '../../features/auth/sign_up.dart';
import '../../features/customer/booking/presentation/screen/details_order.dart';
import '../../features/customer/home/presentation/view/screen/home_flow.dart';
import '../../features/customer/home/presentation/view/screens/service_details.dart';
import '../../features/customer/onboarding/onboarding_screen.dart';
import '../../features/customer/profile/profile_screen.dart';
import '../../features/customer/profile/screens/change_pass.dart';
import '../../features/customer/profile/screens/help_and_support.dart';
import '../../features/customer/profile/screens/profile.dart';
import '../../features/customer/profile/screens/security.dart';
import '../../features/parent/presentation/parent_screen.dart';
import '../../features/splash/splash_screen.dart';

class AppRoutes {
  static const String initialRoute = RouteNames.splashScreen;

  static final Map<String, WidgetBuilder> routes = {
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.onboardingScreen: (context) => const OnboardingScreen(),
    RouteNames.signIn: (context) => const SignIn(),
    RouteNames.serviceDetails: (context) => const ServiceDetails(),
    RouteNames.parentScreen: (context) => const ParentScreen(),
    RouteNames.homeFlow: (context) => const HomeFlow(),

    //bookings
    RouteNames.bookingScreen: (context) => const BookingScreen(),
    RouteNames.detailsOrder: (context) => const DetailsOrder(),
    RouteNames.profileScreen: (context) => const ProfileScreen(),
    RouteNames.profile: (context) => const Profile(),
    RouteNames.helpAndSupport: (context) =>  HelpAndSupport(),
    RouteNames.settingsScreen: (context) =>  SettingsScreen(),
    RouteNames.newPasswordPage: (context) =>  NewPasswordPage(),
    RouteNames.signUp: (context) =>  SignUp(),
    RouteNames.newPassword: (context) =>  NewPassword(),
    RouteNames.serviceSelection: (context) =>  ServiceSelection(),
    RouteNames.userSelection: (context) =>  UserSelection(),

  };
}