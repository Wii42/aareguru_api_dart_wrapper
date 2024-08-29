// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'river.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

River _$RiverFromJson(Map<String, dynamic> json) => River(
      location: const StringJsonConverter().fromJson(json['location']),
      locationLong: const StringJsonConverter().fromJson(json['location_long']),
      coordinates: const LatLngJsonConverter().fromJson(json['coordinates']),
      forecast: const BoolJsonConverter().fromJson(json['forecast']),
      timestamp: const DateTimeJsonConverter().fromJson(json['timestamp']),
      timeString: const StringJsonConverter().fromJson(json['timestring']),
      temperature: const DoubleJsonConverter().fromJson(json['temperature']),
      temperaturePrecise:
          const DoubleJsonConverter().fromJson(json['temperature_prec']),
      temperatureText:
          const StringJsonConverter().fromJson(json['temperature_text']),
      temperatureTextShort:
          const StringJsonConverter().fromJson(json['temperature_text_short']),
      flow: const DoubleJsonConverter().fromJson(json['flow']),
      flowText: const StringJsonConverter().fromJson(json['flow_text']),
      temperatureForecast2h:
          const DoubleJsonConverter().fromJson(json['forecast2h']),
      temperatureForecast2hText:
          const StringJsonConverter().fromJson(json['forecast2h_text']),
      height: const DoubleJsonConverter().fromJson(json['height']),
      temperatureScale:
          const ScaleJsonConverter().fromJson(json['temperature_scale']),
      flowScale: const ScaleJsonConverter().fromJson(json['flow_scale']),
      historicalTempMax: json['historical_temp_max'] == null
          ? null
          : ValueAtTime.fromJson(json['historical_temp_max']),
    );
