import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:theshortkutbran/features/customer/booking/presentation/view_model/booking_provider.dart';
import '../../features/customer/home/data/repositories/home_repository_impl.dart';
import '../../features/customer/home/domain/repositories/home_repository.dart';
import '../../features/customer/home/presentation/viewmodel/home_viewmodel.dart';
import '../services/api_services/api_services.dart';

final GetIt getIt = GetIt.instance;

Future<void> diConfig() async {
  // ore Services
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  // Repository Layer
  getIt.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(getIt<ApiService>()),
  );

  // ViewModels
  getIt.registerFactory<HomeViewModel>(
        () => HomeViewModel(getIt<HomeRepository>()),
  );

  getIt.registerFactory<BookingProvider>(
        () => BookingProvider(),
  );
}
