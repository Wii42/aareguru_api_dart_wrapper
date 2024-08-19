import '../json_parser.dart';

class SunLocation {
  String? name;
  DateTime? sunrise;
  String? sunriseLocal; // in API "sunriselocal"
  DateTime? sunset;
  String? sunsetLocal; // in API "sunsetlocal"
  double? timeLeft; // in API "timeleft"
  String? timeLeftString; // in API "timeleftstring"
  SunLocation({
    this.name,
    this.sunrise,
    this.sunriseLocal,
    this.sunset,
    this.sunsetLocal,
    this.timeLeft,
    this.timeLeftString,
  });

  factory SunLocation.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return SunLocation(
      name: p.parseString(json['name']),
      sunrise: p.parseDateTime(json['sunrise']),
      sunriseLocal: p.parseString(json['sunriselocal']),
      sunset: p.parseDateTime(json['sunset']),
      sunsetLocal: p.parseString(json['sunsetlocal']),
      timeLeft: p.parseDouble(json['timeleft']),
      timeLeftString: p.parseString(json['timeleftstring']),
    );
  }

  static List<SunLocation> listFromJson(List<dynamic> json) {
    return json.map((value) => SunLocation.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'SunLocation(name: $name, sunrise: $sunrise, suriseLocal: $sunriseLocal, sunset: $sunset, sunsetLocal: $sunsetLocal, timeLeft: $timeLeft, timeLeftString: $timeLeftString)';
  }
}
