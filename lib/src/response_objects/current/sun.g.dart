// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sun.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sun _$SunFromJson(Map<String, dynamic> json) => Sun(
      today: json['today'] == null
          ? null
          : SunPerDay.fromJson(json['today'] as Map<String, dynamic>),
      forecast: _$JsonConverterFromJson<Map<String, dynamic>, List<SunPerDay>?>(
          json['forecast'], const MapToSunPerDayListJsonConverter().fromJson),
      sunLocations: (json['sunlocations'] as List<dynamic>?)
          ?.map((e) => SunLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
