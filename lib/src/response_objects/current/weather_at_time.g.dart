// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_at_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherAtTime _$WeatherAtTimeFromJson(Map<String, dynamic> json) =>
    WeatherAtTime(
      timestamp: const DateTimeJsonConverter().fromJson(json['timestamp']),
      temperature: const DoubleJsonConverter().fromJson(json['tt']),
    );
