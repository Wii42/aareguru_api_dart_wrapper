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
    return SunPerDay(
      day: json['day'].toString(),
      dayShort: json['dayshort'].toString(),
      sunTotal: json['suntotal'].toString(),
      sunRelative: double.tryParse(json['sunrelative'].toString()),
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
