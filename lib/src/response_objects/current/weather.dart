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
    return Weather(
      current: json['current'] != null ? CurrentWeather.fromJson(json['current']) : null,
      today: json['today'] != null ? WeatherToday.fromJson(json['today']) : null,
      forecast: json['forecast'] != null ? WeatherForecast.listFromJson(json['forecast']) : null,
    );
  }

  @override
  String toString() {
    return 'Weather(current: $current, today: $today, forecast: $forecast)';
  }
}
