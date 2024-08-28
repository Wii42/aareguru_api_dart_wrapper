import '../json_parser.dart';

/// Contains the temperature at a given time.
class WeatherAtTime {
  /// Timestamp of the data.
  DateTime? timestamp;

  /// The temperature in °C.
  double? temperature;

  WeatherAtTime({
    this.timestamp,
    this.temperature,
  });

  /// Creates a [WeatherAtTime] from a JSON object.
  factory WeatherAtTime.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return WeatherAtTime(
      timestamp: p.parseDateTime(json['timestamp']),
      temperature: p.parseDouble(json['tt']),
    );
  }

  /// Creates a list of [WeatherAtTime] from a JSON list.
  static List<WeatherAtTime> listFromJson(List<dynamic> json) {
    return json.map((value) => WeatherAtTime.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'WeatherAtTime(timestamp: $timestamp, temperature: $temperature)';
  }
}
