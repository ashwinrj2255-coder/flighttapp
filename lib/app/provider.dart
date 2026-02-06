import 'package:dio/dio.dart';
import 'package:flymate/feature/airport_search/data/repository/airport_repository.dart';
import 'package:flymate/feature/home/data/repository/home_repository.dart';
import 'package:flymate/feature/home/data/service/home_api_service.dart';
import 'package:flymate/feature/home/presentation/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../core/network/dio_client.dart';
import '../feature/airport_search/data/service/airport_api_service.dart';
import '../feature/airport_search/presentation/viewmodel/airport_search_view_model.dart';
import '../feature/auth/data/local/secure_storage_impl.dart';
import '../feature/auth/data/local/secure_storage_service.dart';
import '../feature/auth/data/repository/auth_repository.dart';
import '../feature/auth/data/service/auth_service.dart';
import '../feature/auth/presentation/viewmodel/auth_view_model.dart';

class AppProviders {
  static List<SingleChildWidget> get providers => [
    // 1. Storage
    Provider<SecureStorageService>(create: (_) => SecureStorageImpl()),

    // 2. Managed Singleton Dio
    ProxyProvider<SecureStorageService, Dio>(
      update: (_, storage, __) => DioClient.build(storage),
    ),

    // 3. Feature Repositories
    ProxyProvider<Dio, HomeRepository>(
      update: (_, dio, __) => HomeRepository(HomeService(dio: dio)),
    ),

    ProxyProvider<Dio, AirportRepository>(
      update: (_, dio, __) => AirportRepository(AirportApiService(dio: dio)),
    ),

    // 4. VIEW MODELS (This fixes the ProviderNotFoundException)
    ChangeNotifierProxyProvider<HomeRepository, HomeViewModel>(
      create: (context) => HomeViewModel(context.read<HomeRepository>()),
      update: (_, repository, previous) => previous ?? HomeViewModel(repository),
    ),

    ChangeNotifierProxyProvider<AirportRepository, AirportSearchViewModel>(
      create: (context) => AirportSearchViewModel(context.read<AirportRepository>()),
      update: (_, repository, previous) => previous ?? AirportSearchViewModel(repository),
    ),

    // 5. Auth
    ChangeNotifierProvider(
      create: (context) {
        final storage = context.read<SecureStorageService>();
        final dio = context.read<Dio>();
        final authService = FirebaseAuthService();

        return AuthViewModel(
          authService,
          AuthRepository(
            firebaseService: authService,
            storage: storage,
            dio: dio,
          ),
        );
      },
    ),
  ];
}