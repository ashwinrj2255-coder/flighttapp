// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_airport_search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAirportSearchResponseModel _$GetAirportSearchResponseModelFromJson(
  Map<String, dynamic> json,
) => GetAirportSearchResponseModel(
  locations: (json['locations'] as List<dynamic>?)
      ?.map((e) => LocationElement.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  lastRefresh: (json['last_refresh'] as num?)?.toInt(),
  resultsRetrieved: (json['results_retrieved'] as num?)?.toInt(),
);

Map<String, dynamic> _$GetAirportSearchResponseModelToJson(
  GetAirportSearchResponseModel instance,
) => <String, dynamic>{
  'locations': instance.locations?.map((e) => e.toJson()).toList(),
  'meta': instance.meta?.toJson(),
  'last_refresh': instance.lastRefresh,
  'results_retrieved': instance.resultsRetrieved,
};

LocationElement _$LocationElementFromJson(Map<String, dynamic> json) =>
    LocationElement(
      id: json['id'] as String?,
      intId: (json['int_id'] as num?)?.toInt(),
      airportIntId: (json['airport_int_id'] as num?)?.toInt(),
      active: json['active'] as bool?,
      code: json['code'] as String?,
      icao: json['icao'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      slugEn: json['slug_en'] as String?,
      alternativeNames: (json['alternative_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rank: json['rank'] as num?,
      globalRankDst: json['global_rank_dst'] as num?,
      dstPopularityScore: json['dst_popularity_score'] as num?,
      timezone: json['timezone'] as String?,
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : LocationLocation.fromJson(json['location'] as Map<String, dynamic>),
      alternativeDeparturePoints:
          (json['alternative_departure_points'] as List<dynamic>?)
              ?.map(
                (e) => AlternativeDeparturePoint.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      providers: (json['providers'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      special: (json['special'] as List<dynamic>?)
          ?.map((e) => Special.fromJson(e as Map<String, dynamic>))
          .toList(),
      touristRegion: (json['tourist_region'] as List<dynamic>?)
          ?.map((e) => Special.fromJson(e as Map<String, dynamic>))
          .toList(),
      carRentals: (json['car_rentals'] as List<dynamic>?)
          ?.map((e) => CarRental.fromJson(e as Map<String, dynamic>))
          .toList(),
      newGround: json['new_ground'] as bool?,
      routingPriority: (json['routing_priority'] as num?)?.toInt(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$LocationElementToJson(LocationElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'int_id': instance.intId,
      'airport_int_id': instance.airportIntId,
      'active': instance.active,
      'code': instance.code,
      'icao': instance.icao,
      'name': instance.name,
      'slug': instance.slug,
      'slug_en': instance.slugEn,
      'alternative_names': instance.alternativeNames,
      'rank': instance.rank,
      'global_rank_dst': instance.globalRankDst,
      'dst_popularity_score': instance.dstPopularityScore,
      'timezone': instance.timezone,
      'city': instance.city?.toJson(),
      'location': instance.location?.toJson(),
      'alternative_departure_points': instance.alternativeDeparturePoints
          ?.map((e) => e.toJson())
          .toList(),
      'tags': instance.tags?.map((e) => e.toJson()).toList(),
      'providers': instance.providers,
      'special': instance.special?.map((e) => e.toJson()).toList(),
      'tourist_region': instance.touristRegion?.map((e) => e.toJson()).toList(),
      'car_rentals': instance.carRentals?.map((e) => e.toJson()).toList(),
      'new_ground': instance.newGround,
      'routing_priority': instance.routingPriority,
      'type': instance.type,
    };

AlternativeDeparturePoint _$AlternativeDeparturePointFromJson(
  Map<String, dynamic> json,
) => AlternativeDeparturePoint(
  id: json['id'] as String?,
  distance: (json['distance'] as num?)?.toDouble(),
  duration: (json['duration'] as num?)?.toDouble(),
);

Map<String, dynamic> _$AlternativeDeparturePointToJson(
  AlternativeDeparturePoint instance,
) => <String, dynamic>{
  'id': instance.id,
  'distance': instance.distance,
  'duration': instance.duration,
};

CarRental _$CarRentalFromJson(Map<String, dynamic> json) => CarRental(
  providerId: (json['provider_id'] as num?)?.toInt(),
  providersLocations: (json['providers_locations'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$CarRentalToJson(CarRental instance) => <String, dynamic>{
  'provider_id': instance.providerId,
  'providers_locations': instance.providersLocations,
};

City _$CityFromJson(Map<String, dynamic> json) => City(
  id: json['id'] as String?,
  name: json['name'] as String?,
  code: json['code'] as String?,
  slug: json['slug'] as String?,
  subdivision: json['subdivision'] == null
      ? null
      : Special.fromJson(json['subdivision'] as Map<String, dynamic>),
  nearbyCountry: json['nearby_country'],
  region: json['region'] == null
      ? null
      : Special.fromJson(json['region'] as Map<String, dynamic>),
  continent: json['continent'] == null
      ? null
      : Special.fromJson(json['continent'] as Map<String, dynamic>),
  country: json['country'] == null
      ? null
      : Special.fromJson(json['country'] as Map<String, dynamic>),
  autonomousTerritory: json['autonomous_territory'],
);

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
  'slug': instance.slug,
  'subdivision': instance.subdivision?.toJson(),
  'nearby_country': instance.nearbyCountry,
  'region': instance.region?.toJson(),
  'continent': instance.continent?.toJson(),
  'country': instance.country?.toJson(),
  'autonomous_territory': instance.autonomousTerritory,
};

Special _$SpecialFromJson(Map<String, dynamic> json) => Special(
  id: json['id'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  code: json['code'] as String?,
);

Map<String, dynamic> _$SpecialToJson(Special instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'code': instance.code,
};

LocationLocation _$LocationLocationFromJson(Map<String, dynamic> json) =>
    LocationLocation(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationLocationToJson(LocationLocation instance) =>
    <String, dynamic>{'lat': instance.lat, 'lon': instance.lon};

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
  tag: json['tag'] as String?,
  monthTo: (json['month_to'] as num?)?.toInt(),
  monthFrom: (json['month_from'] as num?)?.toInt(),
);

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
  'tag': instance.tag,
  'month_to': instance.monthTo,
  'month_from': instance.monthFrom,
};

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  locale: json['locale'] == null
      ? null
      : Locale.fromJson(json['locale'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'locale': instance.locale?.toJson(),
};

Locale _$LocaleFromJson(Map<String, dynamic> json) =>
    Locale(code: json['code'] as String?, status: json['status'] as String?);

Map<String, dynamic> _$LocaleToJson(Locale instance) => <String, dynamic>{
  'code': instance.code,
  'status': instance.status,
};
