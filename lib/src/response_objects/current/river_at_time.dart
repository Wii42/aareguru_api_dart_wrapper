import 'package:aareguru_api/json_conversion.dart';

part 'river_at_time.g.dart';

/// Contains the flow and temperature data of a river at a given time.
@CustomJsonSerializable()
class RiverAtTime {
  /// Timestamp of the data.
  DateTime? timestamp;

  ///Flow in m³/s.
  double? flow;

  ///Temperature in °C.
  double? temperature;

  RiverAtTime({
    this.timestamp,
    this.flow,
    this.temperature,
  });

  /// Creates a [RiverAtTime] from a JSON object.
  factory RiverAtTime.fromJson(Map<String, dynamic> json) =>
      _$RiverAtTimeFromJson(json);

  /// Creates a list of [RiverAtTime] from a JSON list.
  static List<RiverAtTime> listFromJson(List<dynamic> json) {
    return json.map((value) => RiverAtTime.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'RiverAtTime(timestamp: $timestamp, flow: $flow, temperature: $temperature)';
  }
}
