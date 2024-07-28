import 'package:aareguru_api/src/date_time_seconds_parser.dart';

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
    return WeatherForecast(
      day: json['day'].toString(),
      dayShort: json['dayshort'].toString(),
      timestamp: DateTimeSecondsParser.tryParseSecondsSinceEpoch(
          int.tryParse(json['timestamp'].toString())),
      symbol: json['sy'].toString(),
      symbolText: json['syt'].toString(),
      symbol2: json['symt'].toString(),
      maxTemperature: double.tryParse(json['tx'].toString()),
      minTemperature: double.tryParse(json['tn'].toString()),
      rainfall: int.tryParse(json['rr'].toString()),
      rainfallRisk: double.tryParse(json['rrisk'].toString()),
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
