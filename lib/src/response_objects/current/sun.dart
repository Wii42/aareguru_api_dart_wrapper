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
    return Sun(
      today: json['today'] != null ? SunPerDay.fromJson(json['today']) : null,
      forecast: json['forecast'] != null
          ? SunPerDay.listFromJson(json['forecast'].values.toList())
          : null,
      sunLocations: json['sunlocations'] != null
          ? SunLocation.listFromJson(json['sunlocations'])
          : null,
    );
  }

  @override
  String toString() {
    return 'Sun(today: $today, forecast: $forecast, sunLocations: $sunLocations)';
  }
}
