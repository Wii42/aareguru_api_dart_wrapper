import '../json_parser.dart';

class ScaleEntry {
  int? value;
  String? text;
  String? position;

  ScaleEntry({
    this.value,
    this.text,
    this.position,
  });

  factory ScaleEntry.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return ScaleEntry(
      value: p.parseInt(json['value']),
      text: p.parseString(json['text']),
      position: p.parseString(json['position']),
    );
  }

  static List<ScaleEntry> listFromJson(List<dynamic> json) {
    return json.map((value) => ScaleEntry.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'ScaleEntry(value: $value, text: $text, position: $position)';
  }
}
