import '../json_parser.dart';

///  /// Weather forecast for a portion of the day, e.g. morning, afternoon, evening.
class TimeOfDayWeather {
  /// Weather forecast as symbol, usually a letter.
  ///
  /// Example: 'a'
  ///
  /// Original API field name: <code>sy</code>
  String? symbolLetter;

  /// Text explaining the weather symbol.
  ///
  /// Example: 	"sunnig"
  ///
  /// Original API field name: <code>syt</code>
  String? symbolText;

  /// Weather forecast as symbol.
  /// See [legend](https://meteotest.ch/en/weather-api/wetter-api-dokumentation/weather-symbols).
  ///
  /// Example: "1"
  ///
  /// Original API field name: <code>symt</code>
  String? symbol;

  /// Current air temperature in °C.
  ///
  /// Original API field name: <code>tt</code>
  double? temperature;

  /// The current rainfall in mm/10min, rounded to integers.
  ///
  /// Original API field name: <code>rr</code>
  int? rainfall;

  /// The risk of rainfall in percent. Range: 0-100.
  ///
  /// Original API field name: <code>rrisk</code>
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
  factory TimeOfDayWeather.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return TimeOfDayWeather(
      symbolLetter: p.parseString(json['sy']),
      symbolText: p.parseString(json['syt']),
      symbol: p.parseString(json['symt']),
      temperature: p.parseDouble(json['tt']),
      rainfall: p.parseInt(json['rr']),
      rainfallRisk: p.parseDouble(json['rrisk']),
    );
  }

  @override
  String toString() {
    return 'TimeOfDayWeather(weatherSymbol: $symbolLetter, weatherText: $symbolText, weatherSymbol2: $symbol, temperature: $temperature, rainfall: $rainfall, rainfallRisk: $rainfallRisk)';
  }
}
