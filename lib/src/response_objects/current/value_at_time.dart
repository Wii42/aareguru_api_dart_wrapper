import 'package:aareguru_api/src/date_time_seconds_parser.dart';

class ValueAtTime {
  double? value;
  DateTime? timestamp;

  ValueAtTime({
    this.value,
    this.timestamp,
  });

  factory ValueAtTime.fromJson(Map<String, dynamic> json) {
    return ValueAtTime(
      value: double.tryParse(json['value'].toString()),
      timestamp: DateTimeSecondsParser.tryParseSecondsSinceEpoch(
          int.tryParse(json['timestamp'].toString())),
    );
  }

  @override
  String toString() {
    return 'ValueAtTime(value: $value, time: $timestamp)';
  }
}
