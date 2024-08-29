import 'package:aareguru_api/json_conversion.dart';
import 'package:json_annotation/json_annotation.dart';

import '../json_parser.dart';

part 'time_of_day_weather.g.dart';

///  /// Weather forecast for a portion of the day, e.g. morning, afternoon, evening.
@MyJsonSerializable()
class TimeOfDayWeather {
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

  /// Current air temperature in °C.
  ///
  /// Original API field name: <code>tt</code>
  @JsonKey(name: 'tt')
  double? temperature;

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

  TimeOfDayWeather({
    this.symbolLetter,
    this.symbolText,
    this.symbol,
    this.temperature,
    this.rainfall,
    this.rainfallRisk,
  });

  /// Creates a [TimeOfDayWeather] from a JSON object.
  factory TimeOfDayWeather.fromJson(Map<String, dynamic> json) =>
      _$TimeOfDayWeatherFromJson(json);

  @override
  String toString() {
    return 'TimeOfDayWeather(weatherSymbol: $symbolLetter, weatherText: $symbolText, weatherSymbol2: $symbol, temperature: $temperature, rainfall: $rainfall, rainfallRisk: $rainfallRisk)';
  }
}
