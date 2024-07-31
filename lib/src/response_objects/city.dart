import 'package:aareguru_api/src/requests/current_request.dart';
import 'package:aareguru_api/src/requests/today_request.dart';
import 'package:aareguru_api/src/requests/widget_request.dart';
import 'package:aareguru_api/src/response_objects/widget.dart';

import 'coordinate.dart';
import 'current/current.dart';
import 'json_parser.dart';
import 'today.dart';

class City {
  String? city;
  String? name;
  String? longName; // in API "longname"
  Coordinate? coordinates;
  double? aareTemperature; // in API "aare"
  double? aarePreciceTemperature; // in API "aare_prec"
  String? weatherSymbol; // in API "sy"
  double? dailyMinimumAirTemperature; // in API "tn"
  double? dailyMaximumAirTemperature; // in API "tx"
  bool? forecast;
  DateTime? time;
  Uri? url;
  Uri? today;
  Uri? widget;

  City({
    this.city,
    this.name,
    this.longName,
    this.coordinates,
    this.aareTemperature,
    this.aarePreciceTemperature,
    this.weatherSymbol,
    this.dailyMinimumAirTemperature,
    this.dailyMaximumAirTemperature,
    this.forecast,
    this.time,
    this.url,
    this.today,
    this.widget,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return City(
      city: p.parseString(json['city']),
      name: json['name'].toString(),
      longName: json['longname'].toString(),
      coordinates: p.parseCoordinate(json['coordinate']),
      aareTemperature: p.parseDouble(json['aare']),
      aarePreciceTemperature: p.parseDouble(json['aare_prec']),
      weatherSymbol: p.parseString(json['sy']),
      dailyMinimumAirTemperature: p.parseDouble(json['tn']),
      dailyMaximumAirTemperature: p.parseDouble(json['tx']),
      forecast: p.parseBool(json['forecast']),
      time: p.parseDateTime(json['time']),
      url: p.parseUri(json['url']),
      today: p.parseUri(json['today']),
      widget: p.parseUri(json['widget']),
    );
  }

  static fromJsonList(List<dynamic> json) {
    return json.map((value) => City.fromJson(value)).toList();
  }

  Future<Current>? getCurrent() =>
      url != null ? CurrentRequest('_', '_', city: '_').urlRequest(url!) : null;

  Future<Today>? getToday() => today != null
      ? TodayRequest('_', '_', city: '_').urlRequest(today!)
      : null;

  Future<WidgetData>? getWidget() =>
      widget != null ? WidgetRequest('_', '_').urlRequest(widget!) : null;

  @override
  String toString() {
    return 'City{city: $city, name: $name, longName: $longName, coordinates: $coordinates, aareTemperature: $aareTemperature, aarePreciseTemperature: $aarePreciceTemperature, weatherSymbol: $weatherSymbol, dailyMinimumAirTemperature: $dailyMinimumAirTemperature, dailyMaximumAirTemperature: $dailyMaximumAirTemperature, forecast: $forecast, time: $time, url: $url, today: $today, widget: $widget}';
  }
}
