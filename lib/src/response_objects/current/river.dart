import 'package:latlong2/latlong.dart';

import '../json_parser.dart';
import 'scale.dart';
import 'value_at_time.dart';

/// Represents the current state of a river.
///
/// Contains infos the water temperature, the flow and the height of the river,
/// and clever descriptions of the current state.
class River {
  /// Display name of the measurement location. Same as [Today.name].
  ///
  /// Example: "Bärn"
  String? location;

  /// Exact location of measurement. Same as [Today.longName].
  ///
  /// Example: "Bern, Schönau"
  ///
  /// Original API field name: <code>location_long</code>
  String? locationLong;

  /// Coordinates of the measurement location.
  ///
  /// Example: LatLng(latitude:46.93, longitude:7.45)
  LatLng? coordinates;

  /// Aare temperature forecast flag. Currently always <code>false</code>.
  bool? forecast;

  /// Timestamp of the data.
  DateTime? timestamp;

  /// String representation of the timestamp in the format 'HH:mm'.
  ///
  /// Example: '14:00'
  ///
  /// Original API field name: <code>timestring</code>
  String? timeString;

  /// Current temperature of the river in °C, rounded to one decimal place.
  double? temperature;

  /// Current temperature of the river in °C, not rounded precise.
  ///
  /// Api field name: <code>temperature_prec</code>
  double? temperaturePrecise;

  /// Description of the water temperature.
  ///
  /// Example: "Gschider chli käfele"
  ///
  /// Original API field name: <code>temperature_text</code>
  String? temperatureText;

  /// Short version (less than 15 characters) of the description of the water temperature.
  ///
  /// Example: "Gschider käfele"
  ///
  /// Original API field name: <code>temperature_text_short</code>
  String? temperatureTextShort;

  /// Current flow of the Aare in m³/s.
  double? flow;

  /// Description of the flow.
  ///
  /// Example: "ganz gäbig"
  ///
  /// Original API field name: <code>flow_text</code>
  String? flowText;

  /// Forecasted water temperature in 2 hours in °C.
  ///
  /// Original API field name: <code>forecast2h</code>
  double? temperatureForecast2h;

  /// Description of the forecasted water temperature in 2 hours.
  ///
  /// Example: ""Blibt äuä öpe glich""
  ///
  /// Original API field name: <code>forecast2h_text</code>
  String? temperatureForecast2hText;

  /// Current water level in meters above sea level.
  double? height;

  /// Scale for  the water temperature. See [Scale].
  ///
  /// Original API field name: <code>temperature_scale</code>
  Scale? temperatureScale;

  /// Scale for the flow. See [Scale].
  ///
  /// Original API field name: <code>flow_scale</code>
  Scale? flowScale;

  /// Historical maximum temperature of the river, with timestamp if available.
  /// Recorded manually, so maybe not always instantly up to date.
  ///
  /// Original API field name: <code>historical_temp_max</code>
  ValueAtTime? historicalTempMax;

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

  /// Creates a [River] from a JSON object.
  factory River.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return River(
      location: p.parseString(json['location']),
      locationLong: p.parseString(json['location_long']),
      coordinates: p.parseLatLng(json['coordinates']),
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
      temperatureScale: p.parseObject<Scale>(
          json['temperature_scale'], (v) => Scale.fromJson(v)),
      flowScale:
          p.parseObject<Scale>(json['flow_scale'], (v) => Scale.fromJson(v)),
      historicalTempMax: p.parseObject(
          json['historical_temp_max'], (v) => ValueAtTime.fromJson(v)),
    );
  }

  @override
  String toString() {
    return 'River{location: $location, locationLong: $locationLong, coordinates: $coordinates, forecast: $forecast, timestamp: $timestamp, timeString: $timeString, temperature: $temperature, temperaturePrecise: $temperaturePrecise, temperatureText: $temperatureText, temperatureTextShort: $temperatureTextShort, flow: $flow, flowText: $flowText, temperatureForecast2h: $temperatureForecast2h, temperatureForecast2hText: $temperatureForecast2hText, temperatureScale: $temperatureScale, flowScale: $flowScale, historicalTempMax: $historicalTempMax}';
  }
}
