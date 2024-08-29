// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WidgetData _$WidgetDataFromJson(Map<String, dynamic> json) => WidgetData(
      values: const CityWidgetMapJsonConverter().fromJson(json['values']),
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => CityKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
