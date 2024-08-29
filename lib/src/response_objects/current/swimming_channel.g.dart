// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swimming_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwimmingChannel _$SwimmingChannelFromJson(Map<String, dynamic> json) =>
    SwimmingChannel(
      state: const StringJsonConverter().fromJson(json['state']),
      isOpen: const BoolJsonConverter().fromJson(json['state_open_flag']),
      source: const StringJsonConverter().fromJson(json['source']),
      time: const DateTimeJsonConverter().fromJson(json['time']),
    );
