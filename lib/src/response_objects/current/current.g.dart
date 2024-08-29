// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      aare: json['aare'] == null
          ? null
          : River.fromJson(json['aare'] as Map<String, dynamic>),
      aarePast: (json['aarepast'] as List<dynamic>?)
          ?.map((e) => RiverAtTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      weather: json['weather'] == null
          ? null
          : Weather.fromJson(json['weather'] as Map<String, dynamic>),
      weatherPast: (json['weatherpast'] as List<dynamic>?)
          ?.map((e) => WeatherAtTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      sun: json['sun'] == null
          ? null
          : Sun.fromJson(json['sun'] as Map<String, dynamic>),
      bueber: json['bueber'] == null
          ? null
          : SwimmingChannel.fromJson(json['bueber'] as Map<String, dynamic>),
      notification: json['notification'] == null
          ? null
          : Notification.fromJson(json['notification'] as Map<String, dynamic>),
    );
