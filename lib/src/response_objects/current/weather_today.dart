import '../json_parser.dart';
import 'time_of_day_weather.dart';

class WeatherToday {
  TimeOfDayWeather? morning; // in API "v"
  TimeOfDayWeather? afternoon; // in API "n"
  TimeOfDayWeather? evening; // in API "a"

  WeatherToday({
    this.morning,
    this.afternoon,
    this.evening,
  });

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
