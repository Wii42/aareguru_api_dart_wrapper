import 'package:aareguru_api/src/date_time_seconds_parser.dart';

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
    return SwimmingChannel(
      state: json['state'].toString(),
      isOpen: bool.tryParse(json['state_open_flag'].toString()),
      source: json['source'].toString(),
      time: DateTimeSecondsParser.tryParseSecondsSinceEpoch(
          int.tryParse(json['time'].toString())),
    );
  }

  @override
  String toString() {
    return 'SwimmingChannel(state: $state, isOpen: $isOpen, source: $source, time: $time)';
  }
}
