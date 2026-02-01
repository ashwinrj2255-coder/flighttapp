import 'package:json_annotation/json_annotation.dart';

part 'get_airport_search_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GetAirportSearchResponseModel {
  final List<LocationElement>? locations;
  final Meta? meta;
  final int? lastRefresh;
  final int? resultsRetrieved;

  GetAirportSearchResponseModel({
    this.locations,
    this.meta,
    this.lastRefresh,
    this.resultsRetrieved,
  });

  GetAirportSearchResponseModel copyWith({
    List<LocationElement>? locations,
    Meta? meta,
    int? lastRefresh,
    int? resultsRetrieved,
  }) =>
      GetAirportSearchResponseModel(
        locations: locations ?? this.locations,
        meta: meta ?? this.meta,
        lastRefresh: lastRefresh ?? this.lastRefresh,
        resultsRetrieved: resultsRetrieved ?? this.resultsRetrieved,
      );

  factory GetAirportSearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetAirportSearchResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAirportSearchResponseModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class LocationElement {
  final String? id;
  final int? intId;
  final int? airportIntId;
  final bool? active;
  final String? code;
  final String? icao;
  final String? name;
  final String? slug;
  final String? slugEn;
  final List<String>? alternativeNames;

  // Changed to num? to prevent double-vs-int crashes
  final num? rank;
  final num? globalRankDst;
  final num? dstPopularityScore;

  final String? timezone;
  final City? city;
  final LocationLocation? location;
  final List<AlternativeDeparturePoint>? alternativeDeparturePoints;
  final List<Tag>? tags;
  final List<int>? providers;
  final List<Special>? special;
  final List<Special>? touristRegion;
  final List<CarRental>? carRentals;
  final bool? newGround;
  final int? routingPriority;
  final String? type;

  LocationElement({
    this.id,
    this.intId,
    this.airportIntId,
    this.active,
    this.code,
    this.icao,
    this.name,
    this.slug,
    this.slugEn,
    this.alternativeNames,
    this.rank,
    this.globalRankDst,
    this.dstPopularityScore,
    this.timezone,
    this.city,
    this.location,
    this.alternativeDeparturePoints,
    this.tags,
    this.providers,
    this.special,
    this.touristRegion,
    this.carRentals,
    this.newGround,
    this.routingPriority,
    this.type,
  });

  factory LocationElement.fromJson(Map<String, dynamic> json) =>
      _$LocationElementFromJson(json);

  Map<String, dynamic> toJson() => _$LocationElementToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AlternativeDeparturePoint {
  final String? id;
  final double? distance;
  final double? duration;

  AlternativeDeparturePoint({this.id, this.distance, this.duration});

  factory AlternativeDeparturePoint.fromJson(Map<String, dynamic> json) =>
      _$AlternativeDeparturePointFromJson(json);

  Map<String, dynamic> toJson() => _$AlternativeDeparturePointToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CarRental {
  final int? providerId;
  final List<String>? providersLocations;

  CarRental({this.providerId, this.providersLocations});

  factory CarRental.fromJson(Map<String, dynamic> json) =>
      _$CarRentalFromJson(json);

  Map<String, dynamic> toJson() => _$CarRentalToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class City {
  final String? id;
  final String? name;
  final String? code;
  final String? slug;
  final Special? subdivision;
  final dynamic nearbyCountry;
  final Special? region;
  final Special? continent;
  final Special? country;
  final dynamic autonomousTerritory;

  City({
    this.id,
    this.name,
    this.code,
    this.slug,
    this.subdivision,
    this.nearbyCountry,
    this.region,
    this.continent,
    this.country,
    this.autonomousTerritory,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Special {
  final String? id;
  final String? name;
  final String? slug;
  final String? code;

  Special({this.id, this.name, this.slug, this.code});

  factory Special.fromJson(Map<String, dynamic> json) =>
      _$SpecialFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialToJson(this);
}

@JsonSerializable()
class LocationLocation {
  final double? lat;
  final double? lon;

  LocationLocation({this.lat, this.lon});

  factory LocationLocation.fromJson(Map<String, dynamic> json) =>
      _$LocationLocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationLocationToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Tag {
  final String? tag;
  final int? monthTo;
  final int? monthFrom;

  Tag({this.tag, this.monthTo, this.monthFrom});

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Meta {
  final Locale? locale;

  Meta({this.locale});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class Locale {
  final String? code;
  final String? status;

  Locale({this.code, this.status});

  factory Locale.fromJson(Map<String, dynamic> json) => _$LocaleFromJson(json);

  Map<String, dynamic> toJson() => _$LocaleToJson(this);
}