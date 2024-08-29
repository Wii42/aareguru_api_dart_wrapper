// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      time: const DateTimeJsonConverter().fromJson(json['time']),
      author: const StringJsonConverter().fromJson(json['author']),
      event: const StringJsonConverter().fromJson(json['event']),
    );
