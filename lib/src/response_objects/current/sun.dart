import 'package:aareguru_api/json_conversion.dart';
import 'package:json_annotation/json_annotation.dart';

import 'sun_location.dart';
import 'sun_per_day.dart';

part 'sun.g.dart';

/// Contains data about the sunshine duration now and in the future.
@CustomJsonSerializable()
class Sun {
  /// Data for today.
  SunPerDay? today;

  /// Data for the next days.
  List<SunPerDay>? forecast;

  /// Sunrise and sunset times for different locations in the city.
  ///
  /// Original API field name: <code>sunlocations</code>
  @JsonKey(name: 'sunlocations')
  List<SunLocation>? sunLocations;

  Sun({
    this.today,
    this.forecast,
    this.sunLocations,
  });

  /// Creates a [Sun] from a JSON object.
  factory Sun.fromJson(Map<String, dynamic> json) => _$SunFromJson(json);

  @override
  String toString() {
    return 'Sun(today: $today, forecast: $forecast, sunLocations: $sunLocations)';
  }
}
