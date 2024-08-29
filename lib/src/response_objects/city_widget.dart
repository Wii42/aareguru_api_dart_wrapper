import 'package:aareguru_api/json_conversion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_widget.g.dart';

/// Representation of a city used in [WidgetData].
@MyJsonSerializable()
class CityWidget {
  /// Unique identifier for the city.
  ///
  /// Example: 'bern'
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? city;

  /// Timestamp of the data.
  DateTime? timestamp;

  /// String representation of the timestamp in the format 'HH:mm'.
  ///
  /// Example: '14:00'
  ///
  /// Original API field name: <code>timestring</code>
  @JsonKey(name: 'timestring')
  String? timeString;

  /// Current temperature of the Aare in °C, rounded to one decimal place.
  ///
  /// Original API field name: <code>temperature</code>
  @JsonKey(name: 'temperature')
  double? aareTemperature;

  /// Description of the water temperature.
  ///
  /// Example: "Gschider chli käfele"
  ///
  /// Original API field name: <code>temperature_text</code>
  @JsonKey(name: 'temperature_text')
  String? aareTemperatureText;

  /// Short version (less than 15 characters) of the description of the water temperature.
  ///
  /// Example: "Gschider käfele"
  ///
  /// Original API field name: <code>temperature_text_short</code>
  @JsonKey(name: 'temperature_text_short')
  String? aareTemperatureTextShort;

  /// Current flow of the Aare in m³/s.
  double? flow;

  /// Description of the flow.
  ///
  /// Example: "ganz gäbig"
  ///
  /// Original API field name: <code>flow_text</code>
  @JsonKey(name: 'flow_text')
  String? flowText;

  /// Current danger level of the flow at this location, ranging from 1 to 5.
  /// [Defined by the BAFU](https://www.hydrodaten.admin.ch/de/seen-und-fluesse/stationen-und-daten/2135).
  /// 1 is without danger, from 2 on there is a danger.
  ///
  /// Original API field name: <code>flow_gefahrenstufe</code>
  @JsonKey(name: 'flow_gefahrenstufe')
  int? flowDangerLevel;

  /// Forecasted water temperature in 2 hours in °C.
  ///
  /// Original API field name: <code>forecast2h</code>
  @JsonKey(name: 'forecast2h')
  double? aareTemperatureForecast2h;

  /// Current air temperature in °C.
  ///
  /// Original API field name: <code>tt</code>
  @JsonKey(name: 'tt')
  double? airTemperature;

  /// Total expected sunshine duration in the format 'hh:mm'.
  ///
  /// Example: '8:00'
  ///
  /// Original API field name: <code>suntotal</code>
  @JsonKey(name: 'suntotal')
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
  factory CityWidget.fromJson(Map<String, dynamic> json) =>
      _$CityWidgetFromJson(json);

  /// Creates a [CityWidget] from a JSON object with a given city.
  factory CityWidget.fromJsonWithCity(Map<String, dynamic> json, String? city) {
    CityWidget cityWidget = CityWidget.fromJson(json);
    cityWidget.city = city;
    return cityWidget;
  }

  @override
  String toString() {
    return 'CityWidget(city: $city, timestamp: $timestamp, timeString: $timeString, waterTemperature: $aareTemperature, waterTemperatureText: $aareTemperatureText, waterTemperatureTextShort: $aareTemperatureTextShort, flow: $flow, flowText: $flowText, flowDangerLevel: $flowDangerLevel, waterTemperatureForecast2h: $aareTemperatureForecast2h, airTemperature: $airTemperature, sunTotal: $sunTotal)';
  }
}
