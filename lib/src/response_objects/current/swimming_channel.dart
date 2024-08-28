import '../json_parser.dart';

/// Contains the state of a swimming channel.
///
/// A swimming channel is an artificial chanel to exit a river,
/// for example the 'Bueber' in the Marzili public swimming pool in Bern.
class SwimmingChannel {
  /// The state of the swimming channel.
  /// Normally either 'open' or 'closed'.
  ///
  /// Example: 'open'
  String? state;

  /// Flag if the swimming channel is open.
  /// Should be the same as [state] but as a boolean.
  ///
  /// Original API field name: <code>state_open_flag</code>
  bool? isOpen;

  /// Source of the information whether the swimming channel is open.
  ///
  /// Example: 'badmeister'
  String? source;

  /// Timestamp of the data.
  DateTime? time;

  SwimmingChannel({
    this.state,
    this.isOpen,
    this.source,
    this.time,
  });

  /// Creates a [SwimmingChannel] from a JSON object.
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
