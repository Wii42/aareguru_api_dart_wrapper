import 'package:aareguru_api/src/requests/current_request.dart';
import 'package:aareguru_api/src/requests/today_request.dart';
import 'package:aareguru_api/src/requests/widget_request.dart';
import 'package:aareguru_api/src/response_objects/widget.dart';

import '../date_time_seconds_parser.dart';
import 'coordinate.dart';
import 'current/current.dart';
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
    return City(
      city: json['city'].toString(),
      name: json['name'].toString(),
      longName: json['longname'].toString(),
      coordinates: json['coordinates'] != null
          ? Coordinate.fromJson(json['coordinates'])
          : null,
      aareTemperature: double.tryParse(json['aare'].toString()),
      aarePreciceTemperature: double.tryParse(json['aare_prec'].toString()),
      weatherSymbol: json['sy'].toString(),
      dailyMinimumAirTemperature: double.tryParse(json['tn'].toString()),
      dailyMaximumAirTemperature: double.tryParse(json['tx'].toString()),
      forecast: bool.tryParse(json['forecast'].toString()),
      time: DateTimeSecondsParser.tryParseSecondsSinceEpoch(
          int.parse(json['time'].toString())),
      url: Uri.tryParse(json['url']),
      today: Uri.tryParse(json['today']),
      widget: Uri.tryParse(json['widget']),
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
