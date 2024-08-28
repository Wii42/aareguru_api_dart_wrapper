import 'json_parser.dart';

/// Short overview of the Aare stats for a location.
///
/// For all data, see [Current].
class Today {
  /// Current temperature of the Aare in °C, rounded to one decimal place.
  ///
  /// Original API field name: <code>aare</code>
  double? aareTemperature;

  /// Current temperature of the Aare in °C, not rounded precise.
  ///
  /// Api field name: <code>aare_prec</code>
  double? aarePreciceTemperature;

  /// Description of the water temperature.
  ///
  /// Example: "Gschider chli käfele"
  ///
  /// Original API field name: <code>text</code>
  String? aareTemperatureText;

  /// Short version (less than 15 characters) of the description of the water temperature.
  ///
  /// Example: "Gschider käfele"
  ///
  /// Original API field name: <code>text_short</code>
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
  String? longName;

  Today({
    this.aareTemperature,
    this.aarePreciceTemperature,
    this.aareTemperatureText,
    this.aareTemperatureTextShort,
    this.time,
    this.name,
    this.longName,
  });

  /// Creates a [Today] from a JSON object.
  factory Today.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return Today(
      aareTemperature: p.parseDouble(json['aare']),
      aarePreciceTemperature: p.parseDouble(json['aare_prec']),
      aareTemperatureText: json['text'].toString(),
      aareTemperatureTextShort: json['text_short'].toString(),
      time: p.parseDateTime(json['time']),
      name: p.parseString(json['name']),
      longName: p.parseString(json['longname']),
    );
  }

  @override
  String toString() {
    return 'Today{aareTemperature: $aareTemperature, aarePreciceTemperature: $aarePreciceTemperature, text: $aareTemperatureTextShort, textShort: $aareTemperatureTextShort, time: $time, name: $name, longName: $longName}';
  }
}
