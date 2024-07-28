import 'package:aareguru_api/src/date_time_seconds_parser.dart';

import '../coordinate.dart';
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
    this.temperatureScale,
    this.flowScale,
    this.historicalTempMax,
  });

  factory River.fromJson(Map<String, dynamic> json) {
    return River(
      location: json['location'].toString(),
      locationLong: json['location_long'].toString(),
      coordinates: json['coordinates'] != null
          ? Coordinate.fromJson(json['coordinates'])
          : null,
      forecast: bool.tryParse(json['forecast'].toString()),
      timestamp: DateTimeSecondsParser.tryParseSecondsSinceEpoch(
          int.parse(json['timestamp'].toString())),
      timeString: json['timestring'].toString(),
      temperature: double.tryParse(json['temperature'].toString()),
      temperaturePrecise: double.tryParse(json['temperature_prec'].toString()),
      temperatureText: json['temperature_text'].toString(),
      temperatureTextShort: json['temperature_text_short'].toString(),
      flow: double.tryParse(json['flow'].toString()),
      flowText: json['flow_text'].toString(),
      temperatureForecast2h: double.tryParse(json['forecast2h'].toString()),
      temperatureForecast2hText: json['forecast2h_text'].toString(),
      temperatureScale: json['temperature_scale'] != null
          ? ScaleEntry.listFromJson(json['temperature_scale'])
          : null,
      flowScale: json['flow_scale'] != null
          ? ScaleEntry.listFromJson(json['flow_scale'])
          : null,
      historicalTempMax: json['historical_temp_max'] != null
          ? ValueAtTime.fromJson(json['historical_temp_max'])
          : null,
    );
  }

  @override
  String toString() {
    return 'River{location: $location, locationLong: $locationLong, coordinates: $coordinates, forecast: $forecast, timestamp: $timestamp, timeString: $timeString, temperature: $temperature, temperaturePrecise: $temperaturePrecise, temperatureText: $temperatureText, temperatureTextShort: $temperatureTextShort, flow: $flow, flowText: $flowText, temperatureForecast2h: $temperatureForecast2h, temperatureForecast2hText: $temperatureForecast2hText, temperatureScale: $temperatureScale, flowScale: $flowScale, historicalTempMax: $historicalTempMax}';
  }
}
