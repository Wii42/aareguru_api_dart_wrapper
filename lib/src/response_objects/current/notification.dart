import 'package:aareguru_api/src/date_time_seconds_parser.dart';

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
    return Notification(
      time: DateTimeSecondsParser.tryParseSecondsSinceEpoch(
          int.tryParse(json['time'].toString())),
      author: json['author'].toString(),
      event: json['event'].toString(),
    );
  }

  @override
  String toString() {
    return 'Notification(time: $time, author: $author, event: $event)';
  }
}
