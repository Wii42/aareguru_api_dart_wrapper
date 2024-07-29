import '../../date_time_seconds_parser.dart';

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
    return CurrentWeather(
      currentTemperature: double.tryParse(json['tt'].toString()),
      rainfall: int.tryParse(json['rr'].toString()),
      rainfallReal: double.tryParse(json['rrreal'].toString()),
      timestamp: DateTimeSecondsParser.tryParseSecondsSinceEpoch(
          int.parse(json['timestamp'].toString())),
      timeString: json['timestring'].toString(),
    );
  }

  @override
  String toString() {
    return 'CurrentWeather(currentTemperature: $currentTemperature, rainfall: $rainfall, rainfallReal: $rainfallReal, timestamp: $timestamp, timeString: $timeString)';
  }
}
