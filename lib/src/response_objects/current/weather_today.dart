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
    return WeatherToday(
      morning: json['v'] != null ? TimeOfDayWeather.fromJson(json['v']) : null,
      afternoon:
          json['n'] != null ? TimeOfDayWeather.fromJson(json['n']) : null,
      evening: json['a'] != null ? TimeOfDayWeather.fromJson(json['a']) : null,
    );
  }

  @override
  String toString() {
    return 'WeatherToday(morning: $morning, afternoon: $afternoon, evening: $evening)';
  }
}
