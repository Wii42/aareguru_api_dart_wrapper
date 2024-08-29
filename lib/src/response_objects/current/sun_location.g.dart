// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sun_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SunLocation _$SunLocationFromJson(Map<String, dynamic> json) => SunLocation(
      name: const StringJsonConverter().fromJson(json['name']),
      sunrise: const DateTimeJsonConverter().fromJson(json['sunrise']),
      sunriseLocal: const StringJsonConverter().fromJson(json['sunriselocal']),
      sunset: const DateTimeJsonConverter().fromJson(json['sunset']),
      sunsetLocal: const StringJsonConverter().fromJson(json['sunsetlocal']),
      timeLeft: const DurationJsonConverter().fromJson(json['timeleft']),
      timeLeftString:
          const StringJsonConverter().fromJson(json['timeleftstring']),
    );
