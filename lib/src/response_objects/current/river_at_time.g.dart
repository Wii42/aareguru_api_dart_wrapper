// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'river_at_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiverAtTime _$RiverAtTimeFromJson(Map<String, dynamic> json) => RiverAtTime(
      timestamp: const DateTimeJsonConverter().fromJson(json['timestamp']),
      flow: const DoubleJsonConverter().fromJson(json['flow']),
      temperature: const DoubleJsonConverter().fromJson(json['temperature']),
    );
