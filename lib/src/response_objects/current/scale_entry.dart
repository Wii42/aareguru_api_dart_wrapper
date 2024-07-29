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
    return ScaleEntry(
      value: int.tryParse(json['value'].toString()),
      text: json['text'].toString(),
      position: json['position'].toString(),
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
