import '../json_parser.dart';
import 'current_weather.dart';
import 'weather_forecast.dart';
import 'weather_today.dart';

/// Contains the current and forecast weather data.
class Weather {
  /// The current weather data.
  CurrentWeather? current;

  /// The weather forecast for today.
  WeatherToday? today;

  /// The weather forecast for the next days.
  List<WeatherForecast>? forecast;

  Weather({
    this.current,
    this.today,
    this.forecast,
  });

  /// Creates a [Weather] from a JSON object.
  factory Weather.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return Weather(
      current: p.parseObject(
          json['current'], (dynamic e) => CurrentWeather.fromJson(e)),
      today:
          p.parseObject(json['today'], (dynamic e) => WeatherToday.fromJson(e)),
      forecast: p.parseList(
          json['forecast'], (dynamic e) => WeatherForecast.fromJson(e)),
    );
  }

  @override
  String toString() {
    return 'Weather(current: $current, today: $today, forecast: $forecast)';
  }
}
