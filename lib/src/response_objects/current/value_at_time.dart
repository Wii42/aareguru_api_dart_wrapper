import 'package:aareguru_api/json_conversion.dart';

part 'value_at_time.g.dart';

/// Bundles a value with a timestamp.
@CustomJsonSerializable()
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
  factory ValueAtTime.fromJson(dynamic json) => _$ValueAtTimeFromJson(json);

  @override
  String toString() {
    return 'ValueAtTime(value: $value, time: $timestamp)';
  }
}
