// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_today.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherToday _$WeatherTodayFromJson(Map<String, dynamic> json) => WeatherToday(
      morning: json['v'] == null
          ? null
          : TimeOfDayWeather.fromJson(json['v'] as Map<String, dynamic>),
      afternoon: json['n'] == null
          ? null
          : TimeOfDayWeather.fromJson(json['n'] as Map<String, dynamic>),
      evening: json['a'] == null
          ? null
          : TimeOfDayWeather.fromJson(json['a'] as Map<String, dynamic>),
    );
