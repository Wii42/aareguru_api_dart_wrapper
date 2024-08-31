import 'package:aareguru_api/json_conversion.dart';
import 'package:json_annotation/json_annotation.dart';

part 'today.g.dart';

/// Short overview of the Aare stats for a location.
///
/// For all data, see [Current].
@CustomJsonSerializable()
class Today {
  /// Current temperature of the Aare in °C, rounded to one decimal place.
  ///
  /// Original API field name: <code>aare</code>
  @JsonKey(name: 'aare')
  double? aareTemperature;

  /// Current temperature of the Aare in °C, not rounded precise.
  ///
  /// Api field name: <code>aare_prec</code>
  @JsonKey(name: 'aare_prec')
  double? aarePreciseTemperature;

  /// Description of the water temperature.
  ///
  /// Example: "Gschider chli käfele"
  ///
  /// Original API field name: <code>text</code>
  @JsonKey(name: 'text')
  String? aareTemperatureText;

  /// Short version (less than 15 characters) of the description of the water temperature.
  ///
  /// Example: "Gschider käfele"
  ///
  /// Original API field name: <code>text_short</code>
  @JsonKey(name: 'text_short')
  String? aareTemperatureTextShort;

  /// Timestamp of the data.
  DateTime? time;

  /// Display name of the city.
  ///
  /// Example: "Bärn"
  String? name;

  /// Long name of the city, often the location of measurement.
  ///
  /// Example: "Bern, Schönau"
  ///
  /// Original API field name: <code>longname</code>
  @JsonKey(name: 'longname')
  String? longName;

  Today({
    this.aareTemperature,
    this.aarePreciseTemperature,
    this.aareTemperatureText,
    this.aareTemperatureTextShort,
    this.time,
    this.name,
    this.longName,
  });

  /// Creates a [Today] from a JSON object.
  factory Today.fromJson(Map<String, dynamic> json) => _$TodayFromJson(json);

  @override
  String toString() {
    return 'Today('
        'aareTemperature: $aareTemperature, '
        'aarePreciceTemperature: $aarePreciseTemperature, '
        'text: $aareTemperatureTextShort, textShort: $aareTemperatureTextShort, '
        'time: $time, name: $name, longName: $longName)';
  }
}
