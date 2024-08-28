import '../json_parser.dart';

/// Bundles a value with a timestamp.
class ValueAtTime {
  /// The value at the given time.
  double? value;

  /// The timestamp of the value.
  DateTime? timestamp;

  ValueAtTime({
    this.value,
    this.timestamp,
  });

  /// Creates a [ValueAtTime] from a JSON object.
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
