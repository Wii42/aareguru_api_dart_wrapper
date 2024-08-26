import '../json_parser.dart';

class CurrentWeather {
  double? temperature; // in API "tt"
  int? rainfall; // in API "rr"
  double? rainfallReal; // in API "rrreal"
  DateTime? timestamp;
  String? timeString; // in API "timestring"

  CurrentWeather({
    this.temperature,
    this.rainfall,
    this.rainfallReal,
    this.timestamp,
    this.timeString,
  });

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
