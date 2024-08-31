import 'package:aareguru_api/json_conversion.dart';
import 'package:json_annotation/json_annotation.dart';

import 'time_of_day_weather.dart';

part 'weather_today.g.dart';

/// Contains the weather data at different times of the day.
@CustomJsonSerializable()
class WeatherToday {
  /// The weather in the morning.
  ///
  /// Original API field name: <code>v</code>
  @JsonKey(name: 'v')
  TimeOfDayWeather? morning;

  /// The weather in the afternoon.
  ///
  /// Original API field name: <code>n</code>
  @JsonKey(name: 'n')
  TimeOfDayWeather? afternoon;

  /// The weather in the evening.
  ///
  /// Original API field name: <code>a</code>
  @JsonKey(name: 'a')
  TimeOfDayWeather? evening;

  WeatherToday({
    this.morning,
    this.afternoon,
    this.evening,
  });

  /// Creates a [WeatherToday] from a JSON object.
  factory WeatherToday.fromJson(Map<String, dynamic> json) =>
      _$WeatherTodayFromJson(json);

  @override
  String toString() {
    return 'WeatherToday('
        'morning: $morning, afternoon: $afternoon, evening: $evening)';
  }
}
