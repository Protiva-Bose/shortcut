import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:theshortkutbran/features/customer/booking/presentation/view_model/booking_provider.dart';
import 'package:theshortkutbran/features/parent/presentation/parent_screen.dart';

class AppViewModels {
  static final List<SingleChildWidget> viewmodels = [
    // ChangeNotifierProvider<HomeViewModel>(
    //   create: (_) => HomeViewModel(), // Directly initializing the HomeViewModel
    // ),
    ChangeNotifierProvider<ParentScreenProvider>(
      create: (_) => ParentScreenProvider(), // Directly initializing the ParentScreenProvider
    ),

    ChangeNotifierProvider<BookingProvider>(
      create: (_) => BookingProvider(), // Directly initializing the ParentScreenProvider
    ),

    // Add other feature viewmodels/providers here
  ];
}
