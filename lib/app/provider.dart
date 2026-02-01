import 'package:flymate/feature/airport_search/data/repository/airport_repository.dart';
import 'package:flymate/feature/home/data/repository/home_repository.dart';
import 'package:flymate/feature/home/data/service/home_api_service.dart';
import 'package:flymate/feature/home/presentation/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../feature/airport_search/data/service/airport_api_service.dart';
import '../feature/airport_search/presentation/viewmodel/airport_search_view_model.dart';
import '../feature/flight_details/data/service/payment_service.dart';
import '../feature/flight_details/presentation/viewmodel/payment_view_model.dart';

class AppProviders {
  static List<SingleChildWidget> get providers => [
    ChangeNotifierProvider(
      create: (_) => HomeViewModel(HomeRepository(HomeService())),
    ),
    ChangeNotifierProvider(
      create: (_) => AirportSearchViewModel(
        AirportRepository(
          AirportApiService(),
        ),
      ),
    ),
    ChangeNotifierProvider(
      create: (_) => PaymentViewModel(PaymentService()),
    )
  ];
}
