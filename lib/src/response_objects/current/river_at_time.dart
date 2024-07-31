import '../json_parser.dart';

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
    JsonParser p = JsonParser();
    return RiverAtTime(
      timestamp: p.parseDateTime(json['timestamp']),
      flow: p.parseDouble(json['flow']),
      temperature: p.parseDouble(json['temperature']),
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
