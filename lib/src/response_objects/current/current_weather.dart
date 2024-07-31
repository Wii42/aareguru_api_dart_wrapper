import '../json_parser.dart';

class CurrentWeather {
  double? currentTemperature; // in API "tt"
  int? rainfall; // in API "rr"
  double? rainfallReal; // in API "rrreal"
  DateTime? timestamp;
  String? timeString; // in API "timestring"

  CurrentWeather({
    this.currentTemperature,
    this.rainfall,
    this.rainfallReal,
    this.timestamp,
    this.timeString,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return CurrentWeather(
      currentTemperature: p.parseDouble(json['tt']),
      rainfall: p.parseInt(json['rr']),
      rainfallReal: p.parseDouble(json['rrreal']),
      timestamp: p.parseDateTime(json['timestamp']),
      timeString: p.parseString(json['timestring']),
    );
  }

  @override
  String toString() {
    return 'CurrentWeather(currentTemperature: $currentTemperature, rainfall: $rainfall, rainfallReal: $rainfallReal, timestamp: $timestamp, timeString: $timeString)';
  }
}
