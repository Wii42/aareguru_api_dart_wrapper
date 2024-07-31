import '../json_parser.dart';

class Notification {
  DateTime? time;
  String? author;
  String? event;

  Notification({
    this.time,
    this.author,
    this.event,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return Notification(
      time: p.parseDateTime(json['time']),
      author: p.parseString(json['author']),
      event: p.parseString(json['event']),
    );
  }

  @override
  String toString() {
    return 'Notification(time: $time, author: $author, event: $event)';
  }
}
