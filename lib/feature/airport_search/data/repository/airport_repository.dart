import 'package:dio/dio.dart';

import '../service/airport_api_service.dart';
import '../model/get_airport_search_response_model.dart';

class AirportRepository {
  final AirportApiService _apiService;

  AirportRepository(this._apiService);

  Future<List<LocationElement>> searchAirports(String query, {CancelToken? cancelToken}) async {
    final responseModel = await _apiService.searchAirports(query, cancelToken: cancelToken);
    return responseModel.locations ?? [];  }
}
