import '../json_parser.dart';
import 'time_of_day_weather.dart';

/// Contains the weather data at different times of the day.
class WeatherToday {
  /// The weather in the morning.
  ///
  /// Original API field name: <code>v</code>
  TimeOfDayWeather? morning;

  /// The weather in the afternoon.
  ///
  /// Original API field name: <code>n</code>
  TimeOfDayWeather? afternoon;

  /// The weather in the evening.
  ///
  /// Original API field name: <code>a</code>
  TimeOfDayWeather? evening;

  WeatherToday({
    this.morning,
    this.afternoon,
    this.evening,
  });

  /// Creates a [WeatherToday] from a JSON object.
  factory WeatherToday.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    TimeOfDayWeather parseTimeOfDayWeather(dynamic e) =>
        TimeOfDayWeather.fromJson(e);
    return WeatherToday(
      morning: p.parseObject(json['v'], parseTimeOfDayWeather),
      afternoon: p.parseObject(json['n'], parseTimeOfDayWeather),
      evening: p.parseObject(json['a'], parseTimeOfDayWeather),
    );
  }

  @override
  String toString() {
    return 'WeatherToday(morning: $morning, afternoon: $afternoon, evening: $evening)';
  }
}
