// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City(
      city: const StringJsonConverter().fromJson(json['city']),
      name: const StringJsonConverter().fromJson(json['name']),
      longName: const StringJsonConverter().fromJson(json['longname']),
      coordinates: const LatLngJsonConverter().fromJson(json['coordinates']),
      aareTemperature: const DoubleJsonConverter().fromJson(json['aare']),
      aarePreciseTemperature:
          const DoubleJsonConverter().fromJson(json['aare_prec']),
      weatherSymbol: const StringJsonConverter().fromJson(json['sy']),
      dailyMinAirTemperature: const DoubleJsonConverter().fromJson(json['tn']),
      dailyMaxAirTemperature: const DoubleJsonConverter().fromJson(json['tx']),
      forecast: const BoolJsonConverter().fromJson(json['forecast']),
      time: const DateTimeJsonConverter().fromJson(json['time']),
      url: const UriJsonConverter().fromJson(json['url']),
      today: const UriJsonConverter().fromJson(json['today']),
      widget: const UriJsonConverter().fromJson(json['widget']),
    );
