class DateTimeSecondsParser {
  static DateTime? tryParseSecondsSinceEpoch(int? seconds) {
    if (seconds == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  }
}
