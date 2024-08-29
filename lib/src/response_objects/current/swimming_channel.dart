import 'package:aareguru_api/json_conversion.dart';
import 'package:json_annotation/json_annotation.dart';

import '../json_parser.dart';

part 'swimming_channel.g.dart';

/// Contains the state of a swimming channel.
///
/// A swimming channel is an artificial chanel to exit a river,
/// for example the 'Bueber' in the Marzili public swimming pool in Bern.
@MyJsonSerializable()
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
  @JsonKey(name: 'state_open_flag')
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
  factory SwimmingChannel.fromJson(Map<String, dynamic> json) =>
      _$SwimmingChannelFromJson(json);

  @override
  String toString() {
    return 'SwimmingChannel(state: $state, isOpen: $isOpen, source: $source, time: $time)';
  }
}
