import '../json_parser.dart';
import 'sun_location.dart';
import 'sun_per_day.dart';

/// Contains data about the sunshine duration now and in the future.
class Sun {
  /// Data for today.
  SunPerDay? today;

  /// Data for the next days.
  List<SunPerDay>? forecast;

  /// Sunrise and sunset times for different locations in the city.
  ///
  /// Original API field name: <code>sunlocations</code>
  List<SunLocation>? sunLocations;

  Sun({
    this.today,
    this.forecast,
    this.sunLocations,
  });

  /// Creates a [Sun] from a JSON object.
  factory Sun.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return Sun(
      today: p.parseObject(json['today'], (dynamic e) => SunPerDay.fromJson(e)),
      forecast: p.parseList(
          json['forecast'].values, (dynamic e) => SunPerDay.fromJson(e)),
      sunLocations: p.parseList(
          json['sunlocations'], (dynamic e) => SunLocation.fromJson(e)),
    );
  }

  @override
  String toString() {
    return 'Sun(today: $today, forecast: $forecast, sunLocations: $sunLocations)';
  }
}
