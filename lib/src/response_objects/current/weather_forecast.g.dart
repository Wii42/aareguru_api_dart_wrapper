// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) =>
    WeatherForecast(
      day: const StringJsonConverter().fromJson(json['day']),
      dayShort: const StringJsonConverter().fromJson(json['dayshort']),
      timestamp: const DateTimeJsonConverter().fromJson(json['timestamp']),
      symbolLetter: const StringJsonConverter().fromJson(json['sy']),
      symbolText: const StringJsonConverter().fromJson(json['syt']),
      symbol: const StringJsonConverter().fromJson(json['symt']),
      maxTemperature: const DoubleJsonConverter().fromJson(json['tx']),
      minTemperature: const DoubleJsonConverter().fromJson(json['tn']),
      rainfall: const IntJsonConverter().fromJson(json['rr']),
      rainfallRisk: const DoubleJsonConverter().fromJson(json['rrisk']),
    );
