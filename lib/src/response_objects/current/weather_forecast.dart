import '../json_parser.dart';

class WeatherForecast {
  String? day;
  String? dayShort; // in API "dayshort"
  DateTime? timestamp;
  String? symbol; // in API "sy"
  String? symbolText; // in API "syt"
  String? symbol2; // in API "symt"
  double? maxTemperature; // in API "tx"
  double? minTemperature; // in API "tn"
  int? rainfall; // in API "rr"
  double? rainfallRisk; // in API "rrisk"

  WeatherForecast({
    this.day,
    this.dayShort,
    this.timestamp,
    this.symbol,
    this.symbolText,
    this.symbol2,
    this.maxTemperature,
    this.minTemperature,
    this.rainfall,
    this.rainfallRisk,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return WeatherForecast(
      day: p.parseString(json['day']),
      dayShort: p.parseString(json['dayshort']),
      timestamp: p.parseDateTime(json['timestamp']),
      symbol: p.parseString(json['sy']),
      symbolText: p.parseString(json['syt']),
      symbol2: p.parseString(json['symt']),
      maxTemperature: p.parseDouble(json['tx']),
      minTemperature: p.parseDouble(json['tn']),
      rainfall: p.parseInt(json['rr']),
      rainfallRisk: p.parseDouble(json['rrisk']),
    );
  }

  static List<WeatherForecast> listFromJson(List<dynamic> json) {
    return json.map((value) => WeatherForecast.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'WeatherForecast(day: $day, dayShort: $dayShort, timestamp: $timestamp, symbol: $symbol, symbolText: $symbolText, symbol2: $symbol2, maxTemperature: $maxTemperature, minTemperature: $minTemperature, rainfall: $rainfall, rainfallRisk: $rainfallRisk)';
  }
}
