import '../json_parser.dart';

/// Sunrise and sunset times for a location.
class SunLocation {
  /// Display name of the location.
  ///
  /// Example: "Marzili"
  String? name;

  /// Timestamp of the sunrise.
  DateTime? sunrise;

  /// Time string of the sunrise.
  ///
  /// Example: "06:00"
  ///
  /// Original API field name: <code>sunriselocal</code>
  String? sunriseLocal;

  /// Timestamp of the sunset.
  DateTime? sunset;

  /// Time string of the sunset.
  ///
  /// Example: "20:00"
  ///
  /// Original API field name: <code>sunsetlocal</code>
  String? sunsetLocal;

  /// Time left until the next sunset.
  ///
  /// Original API field name: <code>timeleft</code>
  Duration? timeLeft;

  /// String representation of the time left until the next sunset.
  ///
  /// Example: "3:30:00
  ///
  /// Original API field name: <code>timeleftstring</code>"
  String? timeLeftString;

  SunLocation({
    this.name,
    this.sunrise,
    this.sunriseLocal,
    this.sunset,
    this.sunsetLocal,
    this.timeLeft,
    this.timeLeftString,
  });

  /// Creates a [SunLocation] from a JSON object.
  factory SunLocation.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return SunLocation(
      name: p.parseString(json['name']),
      sunrise: p.parseDateTime(json['sunrise']),
      sunriseLocal: p.parseString(json['sunriselocal']),
      sunset: p.parseDateTime(json['sunset']),
      sunsetLocal: p.parseString(json['sunsetlocal']),
      timeLeft: p.parseDuration(json['timeleft']),
      timeLeftString: p.parseString(json['timeleftstring']),
    );
  }

  /// Creates a list of [SunLocation] from a JSON object.
  static List<SunLocation> listFromJson(List<dynamic> json) {
    return json.map((value) => SunLocation.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'SunLocation(name: $name, sunrise: $sunrise, suriseLocal: $sunriseLocal, sunset: $sunset, sunsetLocal: $sunsetLocal, timeLeft: $timeLeft, timeLeftString: $timeLeftString)';
  }
}
