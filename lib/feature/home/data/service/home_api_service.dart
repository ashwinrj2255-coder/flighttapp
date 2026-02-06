import 'package:dio/dio.dart';
import 'package:flymate/feature/home/data/model/get_home_search_response_model.dart';
import 'package:intl/intl.dart';

class HomeService {
  final Dio dio;
  HomeService({required this.dio});

  Future<GetHomeSearchResponseModel> searchFlights({
    required String flyFrom,
    required String flyTo,
    required DateTime dateFrom,
    DateTime? returnDate,
    required int adults,
    required int children,
    required int infants,
    required String selectedCabins,
  }) async {
    final formatter = DateFormat('dd/MM/yyyy');

    final query = <String, dynamic>{
      'fly_from': flyFrom,
      'fly_to': flyTo,
      'date_from': formatter.format(dateFrom),
      'date_to': formatter.format(dateFrom),
      'adults': adults,
      'children': children,
      'infants': infants,
      'selected_cabins': selectedCabins,
      'curr': 'INR',
      'limit': 20,
    };

    if (returnDate != null) {
      query['return_from'] = formatter.format(returnDate);
      query['return_to'] = formatter.format(returnDate);
    }

    print("SEARCH REQUEST: /v2/search with params: $query");

    final response = await dio.get('/v2/search', queryParameters: query);
    print("SEARCH RESPONSE RECEIVED: ${response.statusCode}");

    return GetHomeSearchResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
