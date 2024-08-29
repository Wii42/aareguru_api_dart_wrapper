// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Today _$TodayFromJson(Map<String, dynamic> json) => Today(
      aareTemperature: const DoubleJsonConverter().fromJson(json['aare']),
      aarePreciseTemperature:
          const DoubleJsonConverter().fromJson(json['aare_prec']),
      aareTemperatureText: const StringJsonConverter().fromJson(json['text']),
      aareTemperatureTextShort:
          const StringJsonConverter().fromJson(json['text_short']),
      time: const DateTimeJsonConverter().fromJson(json['time']),
      name: const StringJsonConverter().fromJson(json['name']),
      longName: const StringJsonConverter().fromJson(json['longname']),
    );
