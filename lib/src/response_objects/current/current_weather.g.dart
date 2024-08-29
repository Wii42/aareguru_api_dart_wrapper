// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      temperature: const DoubleJsonConverter().fromJson(json['tt']),
      rainfall: const IntJsonConverter().fromJson(json['rr']),
      rainfallReal: const DoubleJsonConverter().fromJson(json['rrreal']),
      timestamp: const DateTimeJsonConverter().fromJson(json['timestamp']),
      timeString: const StringJsonConverter().fromJson(json['timestring']),
    );
