import 'package:aareguru_api/json_conversion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_at_time.g.dart';

/// Contains the temperature at a given time.
@MyJsonSerializable()
class WeatherAtTime {
  /// Timestamp of the data.
  DateTime? timestamp;

  /// The temperature in °C.
  ///
  /// Original API field name: <code>tt</code>
  @JsonKey(name: 'tt')
  double? temperature;

  WeatherAtTime({
    this.timestamp,
    this.temperature,
  });

  /// Creates a [WeatherAtTime] from a JSON object.
  factory WeatherAtTime.fromJson(Map<String, dynamic> json) =>
      _$WeatherAtTimeFromJson(json);

  /// Creates a list of [WeatherAtTime] from a JSON list.
  static List<WeatherAtTime> listFromJson(List<dynamic> json) {
    return json.map((value) => WeatherAtTime.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'WeatherAtTime(timestamp: $timestamp, temperature: $temperature)';
  }
}
