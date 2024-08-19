import '../coordinate.dart';
import '../json_parser.dart';
import 'scale_entry.dart';
import 'value_at_time.dart';

class River {
  String? location;
  String? locationLong; // in API "location_long"
  Coordinate? coordinates;
  bool? forecast;
  DateTime? timestamp;
  String? timeString; // in API "timestring"
  double? temperature;
  double? temperaturePrecise; // in API "temperature_prec"
  String? temperatureText; // in API "temperature_text"
  String? temperatureTextShort; // in API "temperature_text_short"
  double? flow;
  String? flowText; // in API "flow_text"
  double? temperatureForecast2h; // in API "forecast2h"
  String? temperatureForecast2hText; // in API "forecast2h_text"
  double? height;
  List<ScaleEntry>? temperatureScale; // in API "temperature_scale"
  List<ScaleEntry>? flowScale; // in API "flow_scale"
  ValueAtTime? historicalTempMax; // in API "historical_temp_max"

  River({
    this.location,
    this.locationLong,
    this.coordinates,
    this.forecast,
    this.timestamp,
    this.timeString,
    this.temperature,
    this.temperaturePrecise,
    this.temperatureText,
    this.temperatureTextShort,
    this.flow,
    this.flowText,
    this.temperatureForecast2h,
    this.temperatureForecast2hText,
    this.height,
    this.temperatureScale,
    this.flowScale,
    this.historicalTempMax,
  });

  factory River.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return River(
      location: p.parseString(json['location']),
      locationLong: p.parseString(json['location_long']),
      coordinates: p.parseCoordinate(json['coordinates']),
      forecast: p.parseBool(json['forecast']),
      timestamp: p.parseDateTime(json['timestamp']),
      timeString: p.parseString(json['timestring']),
      temperature: p.parseDouble(json['temperature']),
      temperaturePrecise: p.parseDouble(json['temperature_prec']),
      temperatureText: p.parseString(json['temperature_text']),
      temperatureTextShort: p.parseString(json['temperature_text_short']),
      flow: p.parseDouble(json['flow']),
      flowText: p.parseString(json['flow_text']),
      temperatureForecast2h: p.parseDouble(json['forecast2h']),
      temperatureForecast2hText: p.parseString(json['forecast2h_text']),
      height: p.parseDouble(json['height']),
      temperatureScale: p.parseList<ScaleEntry>(
          json['temperature_scale'], (v) => ScaleEntry.fromJson(v)),
      flowScale: p.parseList<ScaleEntry>(
          json['flow_scale'], (v) => ScaleEntry.fromJson(v)),
      historicalTempMax: p.parseObject(
          json['historical_temp_max'], (v) => ValueAtTime.fromJson(v)),
    );
  }

  @override
  String toString() {
    return 'River{location: $location, locationLong: $locationLong, coordinates: $coordinates, forecast: $forecast, timestamp: $timestamp, timeString: $timeString, temperature: $temperature, temperaturePrecise: $temperaturePrecise, temperatureText: $temperatureText, temperatureTextShort: $temperatureTextShort, flow: $flow, flowText: $flowText, temperatureForecast2h: $temperatureForecast2h, temperatureForecast2hText: $temperatureForecast2hText, temperatureScale: $temperatureScale, flowScale: $flowScale, historicalTempMax: $historicalTempMax}';
  }
}
