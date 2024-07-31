import '../json_parser.dart';

class ValueAtTime {
  double? value;
  DateTime? timestamp;

  ValueAtTime({
    this.value,
    this.timestamp,
  });

  factory ValueAtTime.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return ValueAtTime(
      value: p.parseDouble(json['value']),
      timestamp: p.parseDateTime(json['timestamp']),
    );
  }

  @override
  String toString() {
    return 'ValueAtTime(value: $value, time: $timestamp)';
  }
}
