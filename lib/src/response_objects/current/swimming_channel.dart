import '../json_parser.dart';

class SwimmingChannel {
  String? state;
  bool? isOpen; // in API "state_open_flag"
  String? source;
  DateTime? time;

  SwimmingChannel({
    this.state,
    this.isOpen,
    this.source,
    this.time,
  });

  factory SwimmingChannel.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return SwimmingChannel(
      state: p.parseString(json['state']),
      isOpen: p.parseBool(json['state_open_flag']),
      source: p.parseString(json['source']),
      time: p.parseDateTime(json['time']),
    );
  }

  @override
  String toString() {
    return 'SwimmingChannel(state: $state, isOpen: $isOpen, source: $source, time: $time)';
  }
}
