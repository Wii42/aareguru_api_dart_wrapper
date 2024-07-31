import '../json_parser.dart';
import 'current_weather.dart';
import 'weather_forecast.dart';
import 'weather_today.dart';

class Weather {
  CurrentWeather? current;
  WeatherToday? today;
  List<WeatherForecast>? forecast;

  Weather({
    this.current,
    this.today,
    this.forecast,
  });

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
