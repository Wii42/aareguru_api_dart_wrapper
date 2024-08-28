import 'json_parser.dart';

/// Representation of a city used in [WidgetData].
class CityWidget {
  /// Unique identifier for the city.
  ///
  /// Example: 'bern'
  String? city;

  /// Timestamp of the data.
  DateTime? timestamp;

  /// String representation of the timestamp in the format 'HH:mm'.
  ///
  /// Example: '14:00'
  ///
  /// Original API field name: <code>timestring</code>
  String? timeString;

  /// Current temperature of the Aare in °C, rounded to one decimal place.
  ///
  /// Original API field name: <code>temperature</code>
  double? aareTemperature;

  /// Description of the water temperature.
  ///
  /// Example: "Gschider chli käfele"
  ///
  /// Original API field name: <code>temperature_text</code>
  String? aareTemperatureText;

  /// Short version (less than 15 characters) of the description of the water temperature.
  ///
  /// Example: "Gschider käfele"
  ///
  /// Original API field name: <code>temperature_text_short</code>
  String? aareTemperatureTextShort;

  /// Current flow of the Aare in m³/s.
  double? flow;

  /// Description of the flow.
  ///
  /// Example: "ganz gäbig"
  ///
  /// Original API field name: <code>flow_text</code>
  String? flowText;

  /// Current danger level of the flow at this location, ranging from 1 to 5.
  /// [Defined by the BAFU](https://www.hydrodaten.admin.ch/de/seen-und-fluesse/stationen-und-daten/2135).
  /// 1 is without danger, from 2 on there is a danger.
  ///
  /// Original API field name: <code>flow_gefahrenstufe</code>
  int? flowDangerLevel;

  /// Forecasted water temperature in 2 hours in °C.
  ///
  /// Original API field name: <code>forecast2h</code>
  double? aareTemperatureForecast2h;

  /// Current air temperature in °C.
  ///
  /// Original API field name: <code>tt</code>
  double? airTemperature;

  /// Total expected sunshine duration in the format 'hh:mm'.
  ///
  /// Example: '8:00'
  ///
  /// Original API field name: <code>suntotal</code>
  String? sunTotal; // in API "suntotal"

  CityWidget({
    this.city,
    this.timestamp,
    this.timeString,
    this.aareTemperature,
    this.aareTemperatureText,
    this.aareTemperatureTextShort,
    this.flow,
    this.flowText,
    this.flowDangerLevel,
    this.aareTemperatureForecast2h,
    this.airTemperature,
    this.sunTotal,
  });

  /// Creates a [CityWidget] from a JSON object.
  factory CityWidget.fromJson(Map<String, dynamic> json, String? city) {
    JsonParser p = JsonParser();
    return CityWidget(
      city: city,
      timestamp: p.parseDateTime(json['timestamp']),
      timeString: p.parseString(json['timestring']),
      aareTemperature: p.parseDouble(json['temperature']),
      aareTemperatureText: p.parseString(json['temperature_text']),
      aareTemperatureTextShort: p.parseString(json['temperature_text_short']),
      flow: p.parseDouble(json['flow']),
      flowText: p.parseString(json['flow_text']),
      flowDangerLevel: p.parseInt(json['flow_gefahrenstufe']),
      aareTemperatureForecast2h: double.tryParse(json['forecast2h'].toString()),
      airTemperature: p.parseDouble(json['tt']),
      sunTotal: p.parseString(json['suntotal']),
    );
  }

  @override
  String toString() {
    return 'CityWidget(city: $city, timestamp: $timestamp, timeString: $timeString, waterTemperature: $aareTemperature, waterTemperatureText: $aareTemperatureText, waterTemperatureTextShort: $aareTemperatureTextShort, flow: $flow, flowText: $flowText, flowDangerLevel: $flowDangerLevel, waterTemperatureForecast2h: $aareTemperatureForecast2h, airTemperature: $airTemperature, sunTotal: $sunTotal)';
  }
}
