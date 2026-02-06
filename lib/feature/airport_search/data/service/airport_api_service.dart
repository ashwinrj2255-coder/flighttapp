import 'package:dio/dio.dart';
import 'package:flymate/core/network/dio_client.dart';
import '../model/get_airport_search_response_model.dart';

class AirportApiService {
final Dio dio;
AirportApiService({required this.dio});

  Future<GetAirportSearchResponseModel> searchAirports(String query, {CancelToken? cancelToken}) async {
    final response = await dio.get(
      '/locations/query',
      cancelToken: cancelToken,
      queryParameters: {
        'term': query.toLowerCase(),
        'location_types': 'airport',
        'limit': 10,
        'active_only': true,
      },
    );

    return GetAirportSearchResponseModel.fromJson(response.data);
  }
}
