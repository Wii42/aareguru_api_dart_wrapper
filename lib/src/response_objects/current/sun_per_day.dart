import 'package:aareguru_api/json_conversion.dart';
import 'package:json_annotation/json_annotation.dart';

import '../json_parser.dart';

part 'sun_per_day.g.dart';

/// Amount of sunshine on a given day.
@MyJsonSerializable()
class SunPerDay {
  /// The day of the week.
  ///
  /// Example: "Mänti"
  String? day;

  /// Short form of the day of the week.
  ///
  /// Example: "Mo."
  ///
  /// Original API field name: <code>dayshort</code>
  @JsonKey(name: 'dayshort')
  String? dayShort;

  /// Total expected sunshine duration in the format 'hh:mm'.
  ///
  /// Example: '8:00'
  ///
  /// Original API field name: <code>suntotal</code>
  @JsonKey(name: 'suntotal')
  String? sunTotal;

  /// The relative amount of sunshine compared to maximal possible time that day in %.
  /// Can range form 0 to 100.
  ///
  /// Example: 50
  ///
  /// Original API field name: <code>sunrelative</code>
  @JsonKey(name: 'sunrelative')
  double? sunRelative;

  SunPerDay({
    this.day,
    this.dayShort,
    this.sunTotal,
    this.sunRelative,
  });

  /// Creates a [SunPerDay] from a JSON object.
  factory SunPerDay.fromJson(Map<String, dynamic> json) =>
      _$SunPerDayFromJson(json);

  /// Creates a list of [SunPerDay] from a JSON list.
  static List<SunPerDay> listFromJson(List<dynamic> json) {
    return json.map((value) => SunPerDay.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'SunPerDay(day: $day, dayShort: $dayShort, sunTotal: $sunTotal, sunRelative: $sunRelative)';
  }

  /// The duration of the sunshine on this day.
  /// Parsed from [sunTotal].
  Duration? get sunDuration {
    if (sunTotal == null) {
      return null;
    }
    List<String> parts = sunTotal!.split(':');
    if (parts.length != 2) {
      return null;
    }
    return Duration(hours: int.parse(parts[0]), minutes: int.parse(parts[1]));
  }
}
