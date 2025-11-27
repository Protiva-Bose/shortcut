import 'package:flutter/cupertino.dart';
import 'package:theshortkutbran/features/customer/booking/presentation/booking_screen.dart';
import 'package:theshortkutbran/features/explore/presentation/views/choose_location_screen.dart';
import 'package:theshortkutbran/features/explore/presentation/views/find_a_barber_screen.dart';
import '../../core/constant/route_names.dart';
import '../../features/auth/new_pass.dart';
import '../../features/auth/phone_number_verify.dart';
import '../../features/auth/selection/enter_otp.dart';
import '../../features/auth/selection/service_selection.dart';
import '../../features/auth/selection/user_selection.dart';
import '../../features/auth/sign_in.dart';
import '../../features/auth/sign_up.dart';
import '../../features/customer/booking/presentation/screen/details_order.dart';
import '../../features/customer/home/presentation/next_payment.dart';
import '../../features/customer/home/presentation/view/screen/home_flow.dart';
import '../../features/customer/home/presentation/view/screens/packages_add_screen.dart';
import '../../features/customer/home/presentation/view/screens/service_details.dart';
import '../../features/customer/main_booking/barbar_ison_the_way.dart';
import '../../features/customer/main_booking/booking_profile_details.dart';
import '../../features/customer/main_booking/explore_barbar.dart';
import '../../features/customer/main_booking/see_all.dart';
import '../../features/customer/main_booking/send_request.dart';
import '../../features/customer/onboarding/onboarding_screen.dart';
import '../../features/customer/profile/profile_screen.dart';
import '../../features/customer/profile/screens/change_pass.dart';
import '../../features/customer/profile/screens/help_and_support.dart';
import '../../features/customer/profile/screens/profile.dart';
import '../../features/customer/profile/screens/security.dart';
import '../../features/customer/review/review_first.dart';
import '../../features/customer/review/review_second.dart';
import '../../features/customer/second_booking/confirm.dart';
import '../../features/customer/second_booking/explore_barbar_two.dart';
import '../../features/customer/second_booking/form_detail.dart';
import '../../features/customer/second_booking/select_date.dart';
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
    RouteNames.chooseLocation: (context) =>  ChooseLocationScreen(),
    RouteNames.findABarber: (context) =>  FindABarberScreen(),
    RouteNames.phoneNumberVerify: (context) =>  PhoneNumberVerify(),
    RouteNames.otpScreen: (context) =>  OtpScreen(),
    RouteNames.barberProfileScreen: (context) =>  BarberProfileScreen(),
    RouteNames.barberGalleryScreen: (context) =>  BarberGalleryScreen(),
    RouteNames.serviceMapViewScreen: (context) =>  ServiceMapViewScreen(),
    RouteNames.requestStatusScreen: (context) =>  RequestStatusScreen(),
    RouteNames.arrivalStatusScreen: (context) =>  ArrivalStatusScreen(),
    RouteNames.bookingCalendarScreen: (context) =>  BookingCalendarScreen(),
    RouteNames.serviceProviderDetailMapScreen: (context) =>  ServiceProviderDetailMapScreen(),
    RouteNames.bookingConfirmationForm: (context) =>  BookingConfirmationForm(),
    RouteNames.bookingSummaryScreen: (context) =>  BookingSummaryScreen(),
    RouteNames.serviceRatingForm: (context) =>  ServiceRatingForm(),
    RouteNames.writeReviewModal: (context) =>  WriteReviewModal(),
    RouteNames.basicPackageScreen: (context) =>  BasicPackageScreen(),
    RouteNames.paymentScreen: (context) =>  PaymentScreen(),

  };
}