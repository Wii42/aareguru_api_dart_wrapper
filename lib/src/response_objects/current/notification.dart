import 'package:aareguru_api/json_conversion.dart';

part 'notification.g.dart';

@CustomJsonSerializable()
class Notification {
  DateTime? time;
  String? author;
  String? event;

  Notification({
    this.time,
    this.author,
    this.event,
  });

  /// Creates a [Notification] from a JSON object.
  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  @override
  String toString() {
    return 'Notification(time: $time, author: $author, event: $event)';
  }
}
