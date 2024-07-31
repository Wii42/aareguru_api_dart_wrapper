import '../json_parser.dart';

class TimeOfDayWeather {
  String? weatherSymbol; // in API "sy"
  String? weatherText; // in API "syt"
  String? weatherSymbol2; // in API "symt";
  double? temperature; // in API "tt"
  int? rainfall; // in API "rr"
  double? rainfallRisk; // in API "rrisk"

  TimeOfDayWeather({
    this.weatherSymbol,
    this.weatherText,
    this.weatherSymbol2,
    this.temperature,
    this.rainfall,
    this.rainfallRisk,
  });

  factory TimeOfDayWeather.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return TimeOfDayWeather(
      weatherSymbol: p.parseString(json['sy']),
      weatherText: p.parseString(json['syt']),
      weatherSymbol2: p.parseString(json['symt']),
      temperature: p.parseDouble(json['tt']),
      rainfall: p.parseInt(json['rr']),
      rainfallRisk: p.parseDouble(json['rrisk']),
    );
  }

  @override
  String toString() {
    return 'TimeOfDayWeather(weatherSymbol: $weatherSymbol, weatherText: $weatherText, weatherSymbol2: $weatherSymbol2, temperature: $temperature, rainfall: $rainfall, rainfallRisk: $rainfallRisk)';
  }
}
