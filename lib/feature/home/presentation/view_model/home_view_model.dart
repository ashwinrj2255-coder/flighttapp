import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flymate/feature/home/data/repository/home_repository.dart';
import '../../../airport_search/data/model/get_airport_search_response_model.dart';
import '../../data/model/get_home_search_response_model.dart';

enum TripType { oneWay, roundTrip }

class HomeViewModel extends ChangeNotifier {
  final HomeRepository _homeRepository;
  HomeViewModel(this._homeRepository);

  bool isLoading = false;
  GetHomeSearchResponseModel? searchResult;
   String? error;
  String from = '';
  String to = '';
  LocationElement? fromAirport;
  LocationElement? toAirport;
  DateTime? departureDate;
  DateTime? returnDate;
  String? travelClass = 'Economy';

  int adults = 1; // minimum 1
  int children = 0;
  int infants = 0;

  int get totalTravellers => adults + children + infants;

  TripType tripType = TripType.oneWay;

  bool get isOneWay => tripType == TripType.oneWay;
  bool get isRoundTrip => tripType == TripType.roundTrip;

  Datum? _selectedFlight; // The state for the detail page
  Datum? get selectedFlight => _selectedFlight;

  void setFromAirport(LocationElement airport) {
    fromAirport = airport;
    notifyListeners();
  }

  void setToAirport(LocationElement airport) {
    toAirport = airport;
    notifyListeners();
  }

  void updateTo(String value) {
    to = value;
  }

  void updateFrom(String value) {
    from = value;
  }

  void setDepartureDate(DateTime date) {
    departureDate = date;
    notifyListeners();
  }

  void setReturn(DateTime date) {
    returnDate = date;
    notifyListeners();
  }

  void swap() {
    // Swap the objects that the UI actually uses
    final tempAirport = fromAirport;
    fromAirport = toAirport;
    toAirport = tempAirport;

    // Swap the strings too if you're using them elsewhere
    final tempString = from;
    from = to;
    to = tempString;

    notifyListeners();
  }

  void setTravelClass(String value) {
    travelClass = value;
    notifyListeners();
  }

  String get travellerSummary {
    if (children == 0 && infants == 0) {
      return '$adults Adult${adults > 1 ? 's' : ''}';
    }
    return '$adults Adult${adults > 1 ? 's' : ''}, '
        '$children Child${children != 1 ? 'ren' : ''}, '
        '$infants Infant${infants > 1 ? 's' : ''}';
  }

  void incrementAdults() {
    adults++;
    notifyListeners();
  }

  void decrementAdults() {
    if (adults > 1) {
      adults--;
      notifyListeners();
    }
  }

  void incrementChildren() {
    children++;
    notifyListeners();
  }

  void decrementChildren() {
    if (children > 0) {
      children--;
      notifyListeners();
    }
  }

  void incrementInfants() {
    if (infants < adults) {
      // airline rule
      infants++;
      notifyListeners();
    }
  }

  void decrementInfants() {
    if (infants > 0) {
      infants--;
      notifyListeners();
    }
  }

  void setTripType(TripType type) {
    tripType = type;

    if (type == TripType.oneWay) {
      returnDate = null;
    }

    notifyListeners();
  }

  String _mapCabin(String? cabin) {
    switch (cabin) {
      case 'Business':
        return 'C';
      case 'First':
        return 'F';
      case 'Premium Economy':
        return 'W';
      default:
        return 'M'; // Economy
    }
  }

  Future<void> searchFlights() async {
    if (fromAirport == null || toAirport == null || departureDate == null) {
      error = 'Please fill all required fields';
      notifyListeners();
      return;
    }

    try {
      isLoading = true;
      error = null;
      notifyListeners();

      var result = await _homeRepository.searchFlights(
        flyFrom: fromAirport!.code!, // airport IATA
        flyTo: toAirport!.code!,
        dateFrom: departureDate!,
        returnDate: isRoundTrip ? returnDate : null,
        adults: adults,
        children: children,
        infants: infants,
        selectedCabins: _mapCabin(travelClass),
      );
      print("Repository returned data: ${result.data?.length ?? 0} flights"); // Debug print
      searchResult = result;
      if (searchResult?.data == null || searchResult!.data!.isEmpty) {
        debugPrint("SEARCH RESULT: No flights found for given parameters");
      }
    } catch (e, stack) {
      debugPrint("SEARCH ERROR: $e");
      debugPrint("STACKTRACE: $stack");
      
      if (e is DioException) {
        error = e.error?.toString() ?? e.message ?? "An unexpected network error occurred";
      } else {
        error = e.toString();
      }
      searchResult = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void selectFlight(Datum flight) {
    _selectedFlight = flight;
    notifyListeners();
  }

}
