/// A class that provides a method to parse a date time from seconds since epoch.
class DateTimeSecondsParser {
  /// Parses a date time from seconds since epoch. If [seconds] is null, null is returned.
  static DateTime? tryParseSecondsSinceEpoch(int? seconds) {
    if (seconds == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  }
}
