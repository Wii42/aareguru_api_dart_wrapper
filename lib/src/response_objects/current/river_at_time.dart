import 'package:aareguru_api/src/date_time_seconds_parser.dart';

class RiverAtTime {
  DateTime? timestamp;
  double? flow;
  double? temperature;

  RiverAtTime({
    this.timestamp,
    this.flow,
    this.temperature,
  });

  factory RiverAtTime.fromJson(Map<String, dynamic> json) {
    return RiverAtTime(
      timestamp: json['timestamp'] != null
          ? DateTimeSecondsParser.tryParseSecondsSinceEpoch(
              int.tryParse(json['timestamp'].toString()))
          : null,
      flow: double.tryParse(json['flow'].toString()),
      temperature: double.tryParse(json['temperature'].toString()),
    );
  }

  static List<RiverAtTime> listFromJson(List<dynamic> json) {
    return json.map((value) => RiverAtTime.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'RiverAtTime(timestamp: $timestamp, flow: $flow, temperature: $temperature)';
  }
}
