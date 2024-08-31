import 'package:aareguru_api/json_conversion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current_weather.g.dart';

/// Contains the current weather data, like temperature and rainfall.
@CustomJsonSerializable()
class CurrentWeather {
  /// The current air temperature in °C.
  ///
  /// Original API field name: <code>tt</code>
  @JsonKey(name: 'tt')
  double? temperature;

  /// The current rainfall in mm/10min, rounded to integers.
  ///
  /// Original API field name: <code>rr</code>
  @JsonKey(name: 'rr')
  int? rainfall;

  /// The current rainfall in mm/10min, rounded to one decimal place.
  ///
  /// Original API field name: <code>rrreal</code>
  @JsonKey(name: 'rrreal')
  double? rainfallReal;

  /// Timestamp of the data.
  DateTime? timestamp;

  /// String representation of the timestamp in the format 'HH:mm'.
  ///
  /// Example: '14:00'
  ///
  /// Original API field name: <code>timestring</code>
  @JsonKey(name: 'timestring')
  String? timeString;

  CurrentWeather({
    this.temperature,
    this.rainfall,
    this.rainfallReal,
    this.timestamp,
    this.timeString,
  });

  /// Creates a [CurrentWeather] from a JSON object.
  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  @override
  String toString() {
    return 'CurrentWeather('
        'currentTemperature: $temperature, rainfall: $rainfall, '
        'rainfallReal: $rainfallReal, timestamp: $timestamp, '
        'timeString: $timeString)';
  }
}
