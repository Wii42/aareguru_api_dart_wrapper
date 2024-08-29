// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityWidget _$CityWidgetFromJson(Map<String, dynamic> json) => CityWidget(
      timestamp: const DateTimeJsonConverter().fromJson(json['timestamp']),
      timeString: const StringJsonConverter().fromJson(json['timestring']),
      aareTemperature:
          const DoubleJsonConverter().fromJson(json['temperature']),
      aareTemperatureText:
          const StringJsonConverter().fromJson(json['temperature_text']),
      aareTemperatureTextShort:
          const StringJsonConverter().fromJson(json['temperature_text_short']),
      flow: const DoubleJsonConverter().fromJson(json['flow']),
      flowText: const StringJsonConverter().fromJson(json['flow_text']),
      flowDangerLevel:
          const IntJsonConverter().fromJson(json['flow_gefahrenstufe']),
      aareTemperatureForecast2h:
          const DoubleJsonConverter().fromJson(json['forecast2h']),
      airTemperature: const DoubleJsonConverter().fromJson(json['tt']),
      sunTotal: const StringJsonConverter().fromJson(json['suntotal']),
    );
