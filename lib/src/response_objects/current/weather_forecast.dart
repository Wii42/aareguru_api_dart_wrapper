import 'package:aareguru_api/json_conversion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_forecast.g.dart';

/// Contains the weather forecast for a specific day.
@CustomJsonSerializable()
class WeatherForecast {
  /// The day of the week.
  ///
  /// Example: 'Mäntig'
  String? day;

  /// Short form of the day of the week.
  ///
  /// Example: "Mo."
  ///
  /// Original API field name: <code>dayshort</code>
  @JsonKey(name: 'dayshort')
  String? dayShort;

  /// Timestamp of the data.
  DateTime? timestamp;

  /// Weather forecast as symbol, usually a letter.
  ///
  /// Example: 'a'
  ///
  /// Original API field name: <code>sy</code>
  @JsonKey(name: 'sy')
  String? symbolLetter;

  /// Text explaining the weather symbol.
  ///
  /// Example: 	"sunnig"
  ///
  /// Original API field name: <code>syt</code>
  @JsonKey(name: 'syt')
  String? symbolText;

  /// Weather forecast as symbol.
  /// See [legend](https://meteotest.ch/en/weather-api/wetter-api-dokumentation/weather-symbols).
  ///
  /// Example: "1"
  ///
  /// Original API field name: <code>symt</code>
  @JsonKey(name: 'symt')
  String? symbol;

  /// Daily maximum air temperature in °C.
  ///
  /// Original API field name: <code>tx</code>
  @JsonKey(name: 'tx')
  double? maxTemperature;

  /// Daily minimum air temperature in °C.
  ///
  /// Original API field name: <code>tn</code>
  @JsonKey(name: 'tn')
  double? minTemperature;

  /// The current rainfall in mm/10min, rounded to integers.
  ///
  /// Original API field name: <code>rr</code>
  @JsonKey(name: 'rr')
  int? rainfall;

  /// The risk of rainfall in percent. Range: 0-100.
  ///
  /// Original API field name: <code>rrisk</code>
  @JsonKey(name: 'rrisk')
  double? rainfallRisk;

  WeatherForecast({
    this.day,
    this.dayShort,
    this.timestamp,
    this.symbolLetter,
    this.symbolText,
    this.symbol,
    this.maxTemperature,
    this.minTemperature,
    this.rainfall,
    this.rainfallRisk,
  });

  /// Creates a [WeatherForecast] from a JSON object.
  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);

  /// Creates a list of [WeatherForecast] from a JSON object.
  static List<WeatherForecast> listFromJson(List<dynamic> json) {
    return json.map((value) => WeatherForecast.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'WeatherForecast(day: $day, dayShort: $dayShort, timestamp: $timestamp, symbol: $symbolLetter, symbolText: $symbolText, symbol2: $symbol, maxTemperature: $maxTemperature, minTemperature: $minTemperature, rainfall: $rainfall, rainfallRisk: $rainfallRisk)';
  }
}
