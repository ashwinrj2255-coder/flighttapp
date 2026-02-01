import 'dart:ui';

import 'package:flymate/feature/home/data/model/get_home_search_response_model.dart';
import 'package:flymate/feature/home/data/service/home_api_service.dart';

class HomeRepository {
  final HomeService _service;

  HomeRepository(this._service);

  Future<GetHomeSearchResponseModel> searchFlights({
    required String flyFrom,
    required String flyTo,
    required DateTime dateFrom,
    DateTime? returnDate,
    required int adults,
    required int children,
    required int infants,
    required String selectedCabins,
  }) {
    return _service.searchFlights(
      flyFrom: flyFrom,
      flyTo: flyTo,
      dateFrom: dateFrom,
      returnDate: returnDate,
      adults: adults,
      children: children,
      infants: infants,
      selectedCabins: selectedCabins,
    );
  }

}
