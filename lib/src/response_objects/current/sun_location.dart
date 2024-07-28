import '../../date_time_seconds_parser.dart';

class SunLocation {
  String? name;
  DateTime? sunrise;
  String? suriseLocal; // in API "sunriselocal"
  DateTime? sunset;
  String? sunsetLocal; // in API "sunsetlocal"
  double? timeLeft; // in API "timeleft"
  String? timeLeftString; // in API "timeleftstring"
  SunLocation({
    this.name,
    this.sunrise,
    this.suriseLocal,
    this.sunset,
    this.sunsetLocal,
    this.timeLeft,
    this.timeLeftString,
  });

  factory SunLocation.fromJson(Map<String, dynamic> json) {
    return SunLocation(
      name: json['name'].toString(),
      sunrise: DateTimeSecondsParser.tryParseSecondsSinceEpoch(
          int.tryParse(json['sunrise'].toString())),
      suriseLocal: json['sunriselocal'].toString(),
      sunset: DateTimeSecondsParser.tryParseSecondsSinceEpoch(
          int.tryParse(json['sunset'].toString())),
      sunsetLocal: json['sunsetlocal'].toString(),
      timeLeft: double.tryParse(json['timeleft'].toString()),
      timeLeftString: json['timeleftstring'].toString(),
    );
  }

  static List<SunLocation> listFromJson(List<dynamic> json) {
    return json.map((value) => SunLocation.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'SunLocation(name: $name, sunrise: $sunrise, suriseLocal: $suriseLocal, sunset: $sunset, sunsetLocal: $sunsetLocal, timeLeft: $timeLeft, timeLeftString: $timeLeftString)';
  }
}