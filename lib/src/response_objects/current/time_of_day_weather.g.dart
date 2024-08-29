// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_of_day_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeOfDayWeather _$TimeOfDayWeatherFromJson(Map<String, dynamic> json) =>
    TimeOfDayWeather(
      symbolLetter: const StringJsonConverter().fromJson(json['sy']),
      symbolText: const StringJsonConverter().fromJson(json['syt']),
      symbol: const StringJsonConverter().fromJson(json['symt']),
      temperature: const DoubleJsonConverter().fromJson(json['tt']),
      rainfall: const IntJsonConverter().fromJson(json['rr']),
      rainfallRisk: const DoubleJsonConverter().fromJson(json['rrisk']),
    );
