import 'package:aareguru_api/json_conversion.dart';
import 'package:aareguru_api/src/requests/current_request.dart';
import 'package:aareguru_api/src/requests/today_request.dart';
import 'package:aareguru_api/src/requests/widget_request.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart';

import 'current/current.dart';
import 'today.dart';
import 'widget_data.dart';

part 'city.g.dart';

/// Core infos about a city and the current Aare data.
/// Usually in a list of cities.
@MyJsonSerializable()
class City {
  ///  Unique identifier of the city.
  ///
  /// Example: "bern"
  String? city;

  /// Display name of the city.
  ///
  /// Example: "Bärn"
  String? name;

  /// Long name of the city, often the location of measurement.
  ///
  /// Example: "Bern, Schönau"
  ///
  /// Original API field name: <code>longname</code>
  @JsonKey(name: 'longname')
  String? longName;

  /// Coordinates of the city.
  ///
  /// Example: LatLng(latitude:46.93, longitude:7.45)
  LatLng? coordinates;

  /// Current temperature of the Aare in °C, rounded to one decimal place.
  ///
  /// Original API field name: <code>aare</code>
  @JsonKey(name: 'aare')
  double? aareTemperature;

  /// Current temperature of the Aare in °C, not rounded precise.
  ///
  /// Api field name: <code>aare_prec</code>
  @JsonKey(name: 'aare_prec')
  double? aarePreciseTemperature;

  /// Weather forecast as symbol.
  /// See [legend](https://meteotest.ch/en/weather-api/wetter-api-dokumentation/weather-symbols).
  ///
  /// Example: "1"
  ///
  /// Original API field name: <code>sy</code>
  @JsonKey(name: 'sy')
  String? weatherSymbol;

  /// Daily minimum air temperature in °C.
  ///
  /// Original API field name: <code>tn</code>
  @JsonKey(name: 'tn')
  double? dailyMinAirTemperature;

  /// Daily maximum air temperature in °C.
  ///
  /// Original API field name: <code>tx</code>
  @JsonKey(name: 'tx')
  double? dailyMaxAirTemperature;

  /// Aare temperature forecast flag. Currently always <code>false</code>.
  bool? forecast;

  /// Timestamp of the data.
  DateTime? time;

  /// URL linking to the <code>current</code> endpoint.
  ///
  /// Example: "https://aareguru.existenz.ch/v2018/current?city=bern"
  Uri? url;

  /// URL linking to the <code>today</code> endpoint.
  ///
  /// Example: "https://aareguru.existenz.ch/v2018/today?city=bern"
  Uri? today;

  /// URL linking to the <code>widget</code> endpoint.
  ///
  /// Example: "https://aareguru.existenz.ch/v2018/widget?city=bern"
  Uri? widget;

  City({
    this.city,
    this.name,
    this.longName,
    this.coordinates,
    this.aareTemperature,
    this.aarePreciseTemperature,
    this.weatherSymbol,
    this.dailyMinAirTemperature,
    this.dailyMaxAirTemperature,
    this.forecast,
    this.time,
    this.url,
    this.today,
    this.widget,
  });

  /// Creates a City object from a JSON object.
  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  /// Creates a list of City objects from a JSON list.
  static List<City> fromJsonList(List<dynamic> json) {
    return json.map((value) => City.fromJson(value)).toList();
  }

  /// Get the current Aare data for this city.
  /// Does the same as  <code>AareGuruApi().current(this.city)</code>.
  Future<Current>? getCurrent() =>
      url != null ? CurrentRequest('_', '_', city: '_').urlRequest(url!) : null;

  /// Get the today data for this city.
  /// Does the same as  <code>AareGuruApi().today(this.city)</code>.
  Future<Today>? getToday() => today != null
      ? TodayRequest('_', '_', city: '_').urlRequest(today!)
      : null;

  /// Get the widget data.
  /// Does the same as  <code>AareGuruApi().widget()</code>.
  Future<WidgetData>? getWidget() =>
      widget != null ? WidgetRequest('_', '_').urlRequest(widget!) : null;

  @override
  String toString() {
    return 'City{city: $city, name: $name, longName: $longName, '
        'coordinates: $coordinates, aareTemperature: $aareTemperature, '
        'aarePreciseTemperature: $aarePreciseTemperature, '
        'weatherSymbol: $weatherSymbol, '
        'dailyMinimumAirTemperature: '
        '$dailyMinAirTemperature, '
        'dailyMaximumAirTemperature: $dailyMaxAirTemperature, '
        'forecast: $forecast, '
        'time: $time, url: $url, today: $today, widget: $widget}';
  }
}
