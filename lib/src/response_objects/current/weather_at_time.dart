import 'package:aareguru_api/src/date_time_seconds_parser.dart';

class WeatherAtTime {
  DateTime? timestamp;
  double? temperature;

  WeatherAtTime({
    this.timestamp,
    this.temperature,
  });

  factory WeatherAtTime.fromJson(Map<String, dynamic> json) {
    return WeatherAtTime(
      timestamp: DateTimeSecondsParser.tryParseSecondsSinceEpoch(
          int.tryParse(json['timestamp'].toString())),
      temperature: double.tryParse(json['tt'].toString()),
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