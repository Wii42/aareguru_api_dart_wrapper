import '../json_parser.dart';

/// Contains the current weather data, like temperature and rainfall.
class CurrentWeather {
  /// The current air temperature in °C.
  ///
  /// Original API field name: <code>tt</code>
  double? temperature;

  /// The current rainfall in mm/10min, rounded to integers.
  ///
  /// Original API field name: <code>rr</code>
  int? rainfall;

  /// The current rainfall in mm/10min, rounded to one decimal place.
  ///
  /// Original API field name: <code>rrreal</code>
  double? rainfallReal;

  /// Timestamp of the data.
  DateTime? timestamp;

  /// String representation of the timestamp in the format 'HH:mm'.
  ///
  /// Example: '14:00'
  ///
  /// Original API field name: <code>timestring</code>
  String? timeString;

  CurrentWeather({
    this.temperature,
    this.rainfall,
    this.rainfallReal,
    this.timestamp,
    this.timeString,
  });

  /// Creates a [CurrentWeather] from a JSON object.
  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return CurrentWeather(
      temperature: p.parseDouble(json['tt']),
      rainfall: p.parseInt(json['rr']),
      rainfallReal: p.parseDouble(json['rrreal']),
      timestamp: p.parseDateTime(json['timestamp']),
      timeString: p.parseString(json['timestring']),
    );
  }

  @override
  String toString() {
    return 'CurrentWeather(currentTemperature: $temperature, rainfall: $rainfall, rainfallReal: $rainfallReal, timestamp: $timestamp, timeString: $timeString)';
  }
}
