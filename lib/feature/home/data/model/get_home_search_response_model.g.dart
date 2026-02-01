// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_home_search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHomeSearchResponseModel _$GetHomeSearchResponseModelFromJson(
  Map<String, dynamic> json,
) => GetHomeSearchResponseModel(
  searchId: json['search_id'] as String?,
  currency: json['currency'] as String?,
  fxRate: (json['fx_rate'] as num?)?.toDouble(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
      .toList(),
  results: (json['_results'] as num?)?.toInt(),
);

Map<String, dynamic> _$GetHomeSearchResponseModelToJson(
  GetHomeSearchResponseModel instance,
) => <String, dynamic>{
  'search_id': instance.searchId,
  'currency': instance.currency,
  'fx_rate': instance.fxRate,
  'data': instance.data,
  '_results': instance.results,
};

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
  id: json['id'] as String?,
  flyFrom: json['flyFrom'] as String?,
  flyTo: json['flyTo'] as String?,
  cityFrom: json['cityFrom'] as String?,
  cityCodeFrom: json['cityCodeFrom'] as String?,
  cityTo: json['cityTo'] as String?,
  cityCodeTo: json['cityCodeTo'] as String?,
  countryFrom: json['countryFrom'] == null
      ? null
      : Country.fromJson(json['countryFrom'] as Map<String, dynamic>),
  countryTo: json['countryTo'] == null
      ? null
      : Country.fromJson(json['countryTo'] as Map<String, dynamic>),
  localDeparture: json['local_departure'] == null
      ? null
      : DateTime.parse(json['local_departure'] as String),
  utcDeparture: json['utc_departure'] == null
      ? null
      : DateTime.parse(json['utc_departure'] as String),
  localArrival: json['local_arrival'] == null
      ? null
      : DateTime.parse(json['local_arrival'] as String),
  utcArrival: json['utc_arrival'] == null
      ? null
      : DateTime.parse(json['utc_arrival'] as String),
  nightsInDest: json['nightsInDest'],
  quality: (json['quality'] as num?)?.toDouble(),
  distance: (json['distance'] as num?)?.toDouble(),
  duration: json['duration'] == null
      ? null
      : DurationClass.fromJson(json['duration'] as Map<String, dynamic>),
  price: (json['price'] as num?)?.toDouble(),
  conversion: json['conversion'] == null
      ? null
      : Conversion.fromJson(json['conversion'] as Map<String, dynamic>),
  fare: json['fare'] == null
      ? null
      : Fare.fromJson(json['fare'] as Map<String, dynamic>),
  fareLocks: json['fare_locks'] == null
      ? null
      : FareLocks.fromJson(json['fare_locks'] as Map<String, dynamic>),
  bagsPrice: (json['bags_price'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  baglimit: (json['baglimit'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toInt()),
  ),
  availability: json['availability'] == null
      ? null
      : Availability.fromJson(json['availability'] as Map<String, dynamic>),
  airlines: (json['airlines'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  route: (json['route'] as List<dynamic>?)
      ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
      .toList(),
  bookingToken: json['booking_token'] as String?,
  deepLink: json['deep_link'] as String?,
  facilitatedBookingAvailable: json['facilitated_booking_available'] as bool?,
  pnrCount: (json['pnr_count'] as num?)?.toInt(),
  hasAirportChange: json['has_airport_change'] as bool?,
  technicalStops: (json['technical_stops'] as num?)?.toInt(),
  throwAwayTicketing: json['throw_away_ticketing'] as bool?,
  hiddenCityTicketing: json['hidden_city_ticketing'] as bool?,
  virtualInterlining: json['virtual_interlining'] as bool?,
);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
  'id': instance.id,
  'flyFrom': instance.flyFrom,
  'flyTo': instance.flyTo,
  'cityFrom': instance.cityFrom,
  'cityCodeFrom': instance.cityCodeFrom,
  'cityTo': instance.cityTo,
  'cityCodeTo': instance.cityCodeTo,
  'countryFrom': instance.countryFrom,
  'countryTo': instance.countryTo,
  'local_departure': instance.localDeparture?.toIso8601String(),
  'utc_departure': instance.utcDeparture?.toIso8601String(),
  'local_arrival': instance.localArrival?.toIso8601String(),
  'utc_arrival': instance.utcArrival?.toIso8601String(),
  'nightsInDest': instance.nightsInDest,
  'quality': instance.quality,
  'distance': instance.distance,
  'duration': instance.duration,
  'price': instance.price,
  'conversion': instance.conversion,
  'fare': instance.fare,
  'fare_locks': instance.fareLocks,
  'bags_price': instance.bagsPrice,
  'baglimit': instance.baglimit,
  'availability': instance.availability,
  'airlines': instance.airlines,
  'route': instance.route,
  'booking_token': instance.bookingToken,
  'deep_link': instance.deepLink,
  'facilitated_booking_available': instance.facilitatedBookingAvailable,
  'pnr_count': instance.pnrCount,
  'has_airport_change': instance.hasAirportChange,
  'technical_stops': instance.technicalStops,
  'throw_away_ticketing': instance.throwAwayTicketing,
  'hidden_city_ticketing': instance.hiddenCityTicketing,
  'virtual_interlining': instance.virtualInterlining,
};

Availability _$AvailabilityFromJson(Map<String, dynamic> json) =>
    Availability(seats: (json['seats'] as num?)?.toInt());

Map<String, dynamic> _$AvailabilityToJson(Availability instance) =>
    <String, dynamic>{'seats': instance.seats};

Conversion _$ConversionFromJson(Map<String, dynamic> json) => Conversion(
  eur: (json['EUR'] as num?)?.toDouble(),
  inr: (json['INR'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ConversionToJson(Conversion instance) =>
    <String, dynamic>{'EUR': instance.eur, 'INR': instance.inr};

Country _$CountryFromJson(Map<String, dynamic> json) =>
    Country(code: json['code'] as String?, name: json['name'] as String?);

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
};

DurationClass _$DurationClassFromJson(Map<String, dynamic> json) =>
    DurationClass(
      departure: (json['departure'] as num?)?.toInt(),
      durationReturn: (json['return'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DurationClassToJson(DurationClass instance) =>
    <String, dynamic>{
      'departure': instance.departure,
      'return': instance.durationReturn,
      'total': instance.total,
    };

Fare _$FareFromJson(Map<String, dynamic> json) => Fare(
  adults: (json['adults'] as num?)?.toDouble(),
  children: (json['children'] as num?)?.toDouble(),
  infants: (json['infants'] as num?)?.toDouble(),
);

Map<String, dynamic> _$FareToJson(Fare instance) => <String, dynamic>{
  'adults': instance.adults,
  'children': instance.children,
  'infants': instance.infants,
};

FareLocks _$FareLocksFromJson(Map<String, dynamic> json) => FareLocks(
  eur: (json['EUR'] as List<dynamic>?)
      ?.map((e) => Eur.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FareLocksToJson(FareLocks instance) => <String, dynamic>{
  'EUR': instance.eur,
};

Eur _$EurFromJson(Map<String, dynamic> json) => Eur(
  price: (json['price'] as num?)?.toDouble(),
  eurDefault: json['default'] as bool?,
  duration: json['duration'] as String?,
  itineraryPriceLimit: (json['itinerary_price_limit'] as num?)?.toDouble(),
  itineraryPriceRemaining: (json['itinerary_price_remaining'] as num?)
      ?.toDouble(),
  fareLockKind: json['fare_lock_kind'] as String?,
  ruleInstanceId: (json['rule_instance_id'] as num?)?.toInt(),
  version: json['version'] as String?,
);

Map<String, dynamic> _$EurToJson(Eur instance) => <String, dynamic>{
  'price': instance.price,
  'default': instance.eurDefault,
  'duration': instance.duration,
  'itinerary_price_limit': instance.itineraryPriceLimit,
  'itinerary_price_remaining': instance.itineraryPriceRemaining,
  'fare_lock_kind': instance.fareLockKind,
  'rule_instance_id': instance.ruleInstanceId,
  'version': instance.version,
};

Route _$RouteFromJson(Map<String, dynamic> json) => Route(
  id: json['id'] as String?,
  combinationId: json['combination_id'] as String?,
  flyFrom: json['flyFrom'] as String?,
  flyTo: json['flyTo'] as String?,
  cityFrom: json['cityFrom'] as String?,
  cityCodeFrom: json['cityCodeFrom'] as String?,
  cityTo: json['cityTo'] as String?,
  cityCodeTo: json['cityCodeTo'] as String?,
  localDeparture: json['local_departure'] == null
      ? null
      : DateTime.parse(json['local_departure'] as String),
  utcDeparture: json['utc_departure'] == null
      ? null
      : DateTime.parse(json['utc_departure'] as String),
  localArrival: json['local_arrival'] == null
      ? null
      : DateTime.parse(json['local_arrival'] as String),
  utcArrival: json['utc_arrival'] == null
      ? null
      : DateTime.parse(json['utc_arrival'] as String),
  airline: json['airline'] as String?,
  flightNo: (json['flight_no'] as num?)?.toInt(),
  operatingCarrier: json['operating_carrier'] as String?,
  operatingFlightNo: json['operating_flight_no'] as String?,
  fareBasis: json['fare_basis'] as String?,
  fareCategory: json['fare_category'] as String?,
  fareClasses: json['fare_classes'] as String?,
  routeReturn: (json['return'] as num?)?.toInt(),
  bagsRecheckRequired: json['bags_recheck_required'] as bool?,
  viConnection: json['vi_connection'] as bool?,
  guarantee: json['guarantee'] as bool?,
  equipment: json['equipment'],
  vehicleType: json['vehicle_type'] as String?,
);

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
  'id': instance.id,
  'combination_id': instance.combinationId,
  'flyFrom': instance.flyFrom,
  'flyTo': instance.flyTo,
  'cityFrom': instance.cityFrom,
  'cityCodeFrom': instance.cityCodeFrom,
  'cityTo': instance.cityTo,
  'cityCodeTo': instance.cityCodeTo,
  'local_departure': instance.localDeparture?.toIso8601String(),
  'utc_departure': instance.utcDeparture?.toIso8601String(),
  'local_arrival': instance.localArrival?.toIso8601String(),
  'utc_arrival': instance.utcArrival?.toIso8601String(),
  'airline': instance.airline,
  'flight_no': instance.flightNo,
  'operating_carrier': instance.operatingCarrier,
  'operating_flight_no': instance.operatingFlightNo,
  'fare_basis': instance.fareBasis,
  'fare_category': instance.fareCategory,
  'fare_classes': instance.fareClasses,
  'return': instance.routeReturn,
  'bags_recheck_required': instance.bagsRecheckRequired,
  'vi_connection': instance.viConnection,
  'guarantee': instance.guarantee,
  'equipment': instance.equipment,
  'vehicle_type': instance.vehicleType,
};
