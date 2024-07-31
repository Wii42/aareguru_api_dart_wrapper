import '../json_parser.dart';

class WeatherAtTime {
  DateTime? timestamp;
  double? temperature;

  WeatherAtTime({
    this.timestamp,
    this.temperature,
  });

  factory WeatherAtTime.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return WeatherAtTime(
      timestamp: p.parseDateTime(json['timestamp']),
      temperature: p.parseDouble(json['temperature']),
    );
  }

  static List<WeatherAtTime> listFromJson(List<dynamic> json) {
    return json.map((value) => WeatherAtTime.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'WeatherAtTime(timestamp: $timestamp, temperature: $temperature)';
  }
}
