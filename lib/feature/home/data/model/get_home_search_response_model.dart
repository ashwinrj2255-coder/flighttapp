import 'package:json_annotation/json_annotation.dart';

part 'get_home_search_response_model.g.dart';

@JsonSerializable()
class GetHomeSearchResponseModel {
  @JsonKey(name: "search_id")
  final String? searchId;
  @JsonKey(name: "currency")
  final String? currency;
  @JsonKey(name: "fx_rate")
  final double? fxRate;
  @JsonKey(name: "data")
  final List<Datum>? data;
  @JsonKey(name: "_results")
  final int? results;

  GetHomeSearchResponseModel({
    this.searchId,
    this.currency,
    this.fxRate,
    this.data,
    this.results,
  });

  factory GetHomeSearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeSearchResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeSearchResponseModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "flyFrom")
  final String? flyFrom;
  @JsonKey(name: "flyTo")
  final String? flyTo;
  @JsonKey(name: "cityFrom")
  final String? cityFrom;
  @JsonKey(name: "cityCodeFrom")
  final String? cityCodeFrom;
  @JsonKey(name: "cityTo")
  final String? cityTo;
  @JsonKey(name: "cityCodeTo")
  final String? cityCodeTo;
  @JsonKey(name: "countryFrom")
  final Country? countryFrom;
  @JsonKey(name: "countryTo")
  final Country? countryTo;
  @JsonKey(name: "local_departure")
  final DateTime? localDeparture;
  @JsonKey(name: "utc_departure")
  final DateTime? utcDeparture;
  @JsonKey(name: "local_arrival")
  final DateTime? localArrival;
  @JsonKey(name: "utc_arrival")
  final DateTime? utcArrival;
  @JsonKey(name: "nightsInDest")
  final dynamic nightsInDest;
  @JsonKey(name: "quality")
  final double? quality;
  @JsonKey(name: "distance")
  final double? distance;
  @JsonKey(name: "duration")
  final DurationClass? duration;
  @JsonKey(name: "price")
  final double? price; // Changed to double to handle both 15757 and 15757.5
  @JsonKey(name: "conversion")
  final Conversion? conversion;
  @JsonKey(name: "fare")
  final Fare? fare;
  @JsonKey(name: "fare_locks")
  final FareLocks? fareLocks;
  @JsonKey(name: "bags_price")
  final Map<String, double>? bagsPrice; // Flexible map for dynamic bag counts
  @JsonKey(name: "baglimit")
  final Map<String, int>? baglimit;
  @JsonKey(name: "availability")
  final Availability? availability;
  @JsonKey(name: "airlines")
  final List<String>? airlines; // Changed to String list
  @JsonKey(name: "route")
  final List<Route>? route;
  @JsonKey(name: "booking_token")
  final String? bookingToken;
  @JsonKey(name: "deep_link")
  final String? deepLink;
  @JsonKey(name: "facilitated_booking_available")
  final bool? facilitatedBookingAvailable;
  @JsonKey(name: "pnr_count")
  final int? pnrCount;
  @JsonKey(name: "has_airport_change")
  final bool? hasAirportChange;
  @JsonKey(name: "technical_stops")
  final int? technicalStops;
  @JsonKey(name: "throw_away_ticketing")
  final bool? throwAwayTicketing;
  @JsonKey(name: "hidden_city_ticketing")
  final bool? hiddenCityTicketing;
  @JsonKey(name: "virtual_interlining")
  final bool? virtualInterlining;

  Datum({
    this.id, this.flyFrom, this.flyTo, this.cityFrom, this.cityCodeFrom,
    this.cityTo, this.cityCodeTo, this.countryFrom, this.countryTo,
    this.localDeparture, this.utcDeparture, this.localArrival, this.utcArrival,
    this.nightsInDest, this.quality, this.distance, this.duration, this.price,
    this.conversion, this.fare, this.fareLocks, this.bagsPrice, this.baglimit,
    this.availability, this.airlines, this.route, this.bookingToken,
    this.deepLink, this.facilitatedBookingAvailable, this.pnrCount,
    this.hasAirportChange, this.technicalStops, this.throwAwayTicketing,
    this.hiddenCityTicketing, this.virtualInterlining,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Availability {
  final int? seats;
  Availability({this.seats});
  factory Availability.fromJson(Map<String, dynamic> json) => _$AvailabilityFromJson(json);
  Map<String, dynamic> toJson() => _$AvailabilityToJson(this);
}

@JsonSerializable()
class Conversion {
  @JsonKey(name: "EUR")
  final double? eur;
  @JsonKey(name: "INR")
  final double? inr;

  Conversion({this.eur, this.inr});
  factory Conversion.fromJson(Map<String, dynamic> json) => _$ConversionFromJson(json);
  Map<String, dynamic> toJson() => _$ConversionToJson(this);
}

@JsonSerializable()
class Country {
  final String? code;
  final String? name;

  Country({this.code, this.name});
  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class DurationClass {
  final int? departure;
  @JsonKey(name: "return")
  final int? durationReturn;
  final int? total;

  DurationClass({this.departure, this.durationReturn, this.total});
  factory DurationClass.fromJson(Map<String, dynamic> json) => _$DurationClassFromJson(json);
  Map<String, dynamic> toJson() => _$DurationClassToJson(this);
}

@JsonSerializable()
class Fare {
  final double? adults;
  final double? children;
  final double? infants;

  Fare({this.adults, this.children, this.infants});
  factory Fare.fromJson(Map<String, dynamic> json) => _$FareFromJson(json);
  Map<String, dynamic> toJson() => _$FareToJson(this);
}

@JsonSerializable()
class FareLocks {
  @JsonKey(name: "EUR")
  final List<Eur>? eur;
  FareLocks({this.eur});
  factory FareLocks.fromJson(Map<String, dynamic> json) => _$FareLocksFromJson(json);
  Map<String, dynamic> toJson() => _$FareLocksToJson(this);
}

@JsonSerializable()
class Eur {
  final double? price;
  @JsonKey(name: "default")
  final bool? eurDefault;
  final String? duration;
  @JsonKey(name: "itinerary_price_limit")
  final double? itineraryPriceLimit;
  @JsonKey(name: "itinerary_price_remaining")
  final double? itineraryPriceRemaining;
  @JsonKey(name: "fare_lock_kind")
  final String? fareLockKind;
  @JsonKey(name: "rule_instance_id")
  final int? ruleInstanceId;
  final String? version;

  Eur({
    this.price, this.eurDefault, this.duration, this.itineraryPriceLimit,
    this.itineraryPriceRemaining, this.fareLockKind, this.ruleInstanceId, this.version,
  });

  factory Eur.fromJson(Map<String, dynamic> json) => _$EurFromJson(json);
  Map<String, dynamic> toJson() => _$EurToJson(this);
}

@JsonSerializable()
class Route {
  final String? id;
  @JsonKey(name: "combination_id")
  final String? combinationId;
  final String? flyFrom;
  final String? flyTo;
  final String? cityFrom;
  final String? cityCodeFrom;
  final String? cityTo;
  final String? cityCodeTo;
  @JsonKey(name: "local_departure")
  final DateTime? localDeparture;
  @JsonKey(name: "utc_departure")
  final DateTime? utcDeparture;
  @JsonKey(name: "local_arrival")
  final DateTime? localArrival;
  @JsonKey(name: "utc_arrival")
  final DateTime? utcArrival;
  final String? airline;
  @JsonKey(name: "flight_no")
  final int? flightNo;
  @JsonKey(name: "operating_carrier")
  final String? operatingCarrier;
  @JsonKey(name: "operating_flight_no")
  final String? operatingFlightNo;
  @JsonKey(name: "fare_basis")
  final String? fareBasis;
  @JsonKey(name: "fare_category")
  final String? fareCategory;
  @JsonKey(name: "fare_classes")
  final String? fareClasses;
  @JsonKey(name: "return")
  final int? routeReturn;
  @JsonKey(name: "bags_recheck_required")
  final bool? bagsRecheckRequired;
  @JsonKey(name: "vi_connection")
  final bool? viConnection;
  @JsonKey(name: "guarantee")
  final bool? guarantee;
  final dynamic equipment;
  @JsonKey(name: "vehicle_type")
  final String? vehicleType;

  Route({
    this.id, this.combinationId, this.flyFrom, this.flyTo, this.cityFrom,
    this.cityCodeFrom, this.cityTo, this.cityCodeTo, this.localDeparture,
    this.utcDeparture, this.localArrival, this.utcArrival, this.airline,
    this.flightNo, this.operatingCarrier, this.operatingFlightNo, this.fareBasis,
    this.fareCategory, this.fareClasses, this.routeReturn, this.bagsRecheckRequired,
    this.viConnection, this.guarantee, this.equipment, this.vehicleType,
  });

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
  Map<String, dynamic> toJson() => _$RouteToJson(this);
}