import 'package:aareguru_api/json_conversion.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart';

import '../json_parser.dart';
import 'scale.dart';
import 'value_at_time.dart';

part 'river.g.dart';

/// Represents the current state of a river.
///
/// Contains infos the water temperature, the flow and the height of the river,
/// and clever descriptions of the current state.
@MyJsonSerializable()
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
  @JsonKey(name: 'location_long')
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
  @JsonKey(name: 'timestring')
  String? timeString;

  /// Current temperature of the river in °C, rounded to one decimal place.
  double? temperature;

  /// Current temperature of the river in °C, not rounded precise.
  ///
  /// Api field name: <code>temperature_prec</code>
  @JsonKey(name: 'temperature_prec')
  double? temperaturePrecise;

  /// Description of the water temperature.
  ///
  /// Example: "Gschider chli käfele"
  ///
  /// Original API field name: <code>temperature_text</code>
  @JsonKey(name: 'temperature_text')
  String? temperatureText;

  /// Short version (less than 15 characters) of the description of the water temperature.
  ///
  /// Example: "Gschider käfele"
  ///
  /// Original API field name: <code>temperature_text_short</code>
  @JsonKey(name: 'temperature_text_short')
  String? temperatureTextShort;

  /// Current flow of the Aare in m³/s.
  double? flow;

  /// Description of the flow.
  ///
  /// Example: "ganz gäbig"
  ///
  /// Original API field name: <code>flow_text</code>
  @JsonKey(name: 'flow_text')
  String? flowText;

  /// Forecasted water temperature in 2 hours in °C.
  ///
  /// Original API field name: <code>forecast2h</code>
  @JsonKey(name: 'forecast2h')
  double? temperatureForecast2h;

  /// Description of the forecasted water temperature in 2 hours.
  ///
  /// Example: ""Blibt äuä öpe glich""
  ///
  /// Original API field name: <code>forecast2h_text</code>
  @JsonKey(name: 'forecast2h_text')
  String? temperatureForecast2hText;

  /// Current water level in meters above sea level.
  double? height;

  /// Scale for  the water temperature. See [Scale].
  ///
  /// Original API field name: <code>temperature_scale</code>
  @JsonKey(name: 'temperature_scale')
  Scale? temperatureScale;

  /// Scale for the flow. See [Scale].
  ///
  /// Original API field name: <code>flow_scale</code>
  @JsonKey(name: 'flow_scale')
  Scale? flowScale;

  /// Historical maximum temperature of the river, with timestamp if available.
  /// Recorded manually, so maybe not always instantly up to date.
  ///
  /// Original API field name: <code>historical_temp_max</code>
  @JsonKey(name: 'historical_temp_max')
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
  factory River.fromJson(Map<String, dynamic> json) => _$RiverFromJson(json);

  @override
  String toString() {
    return 'River{location: $location, locationLong: $locationLong, coordinates: $coordinates, forecast: $forecast, timestamp: $timestamp, timeString: $timeString, temperature: $temperature, temperaturePrecise: $temperaturePrecise, temperatureText: $temperatureText, temperatureTextShort: $temperatureTextShort, flow: $flow, flowText: $flowText, temperatureForecast2h: $temperatureForecast2h, temperatureForecast2hText: $temperatureForecast2hText, temperatureScale: $temperatureScale, flowScale: $flowScale, historicalTempMax: $historicalTempMax}';
  }
}
