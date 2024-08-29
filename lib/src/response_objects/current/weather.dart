import 'package:aareguru_api/json_conversion.dart';
import 'current_weather.dart';
import 'weather_forecast.dart';
import 'weather_today.dart';

part 'weather.g.dart';

/// Contains the current and forecast weather data.
@MyJsonSerializable()
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
  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  @override
  String toString() {
    return 'Weather(current: $current, today: $today, forecast: $forecast)';
  }
}
