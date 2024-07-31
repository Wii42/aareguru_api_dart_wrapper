import '../json_parser.dart';

class SunPerDay {
  String? day;
  String? dayShort; // in API "dayshort"
  String? sunTotal; // in API "suntotal"
  double? sunRelative; // in API "sunrelative"

  SunPerDay({
    this.day,
    this.dayShort,
    this.sunTotal,
    this.sunRelative,
  });

  factory SunPerDay.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return SunPerDay(
      day: p.parseString(json['day']),
      dayShort: p.parseString(json['dayshort']),
      sunTotal: p.parseString(json['suntotal']),
      sunRelative: p.parseDouble(json['sunrelative']),
    );
  }

  static List<SunPerDay> listFromJson(List<dynamic> json) {
    return json.map((value) => SunPerDay.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'SunPerDay(day: $day, dayShort: $dayShort, sunTotal: $sunTotal, sunRelative: $sunRelative)';
  }
}
