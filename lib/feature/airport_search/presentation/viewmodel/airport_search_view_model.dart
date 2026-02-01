import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

import '../../data/model/get_airport_search_response_model.dart';
import '../../data/repository/airport_repository.dart';

class AirportSearchViewModel extends ChangeNotifier {
  final AirportRepository _airportRepository;
  AirportSearchViewModel(this._airportRepository);

  List<LocationElement> locations = [];
  bool isLoading = false;
  Timer? _debounce;
  String _lastQuery = "";
  CancelToken? _cancelToken;

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    if (query.isEmpty) {
      locations = [];
      _lastQuery = "";
      notifyListeners();
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty && query != _lastQuery) {
        search(query);
      }
    });
  }

  Future<void> search(String query) async {
    if (query.length < 3) return;
    _lastQuery = query;

    // Cancel previous request if still running
    _cancelToken?.cancel("New search request started");
    _cancelToken = CancelToken();

    try {
      isLoading = true;
      notifyListeners();

      final results = await _airportRepository.searchAirports(query, cancelToken: _cancelToken);

       if (_lastQuery.isEmpty) {
        locations = [];
      } else {
        locations = results;
      }
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) {
        debugPrint('Request cancelled: ${e.message}');
        return; // Don't reset loading or notify listeners if cancelled
      }
      locations = [];
    } catch (e) {
       locations = [];
    } finally {
      if (!(_cancelToken?.isCancelled ?? false)) {
        isLoading = false;
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _cancelToken?.cancel("ViewModel disposed");
    super.dispose();
  }
}
