import '../json_parser.dart';
import 'sun_location.dart';
import 'sun_per_day.dart';

class Sun {
  SunPerDay? today;
  List<SunPerDay>? forecast;
  List<SunLocation>? sunLocations; // in API "sunlocations"

  Sun({
    this.today,
    this.forecast,
    this.sunLocations,
  });

  factory Sun.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return Sun(
      today: p.parseObject(json['today'], (dynamic e) => SunPerDay.fromJson(e)),
      forecast:
          p.parseList(json['forecast'].values, (dynamic e) => SunPerDay.fromJson(e)),
      sunLocations: p.parseList(
          json['sunlocations'], (dynamic e) => SunLocation.fromJson(e)),
    );
  }

  @override
  String toString() {
    return 'Sun(today: $today, forecast: $forecast, sunLocations: $sunLocations)';
  }
}
