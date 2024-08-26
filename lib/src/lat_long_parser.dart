import 'package:aareguru_api/src/response_objects/json_parser.dart';
import 'package:latlong2/latlong.dart';

/// Parses a JSON object to a [LatLng] object.
class LatLongParser {
  /// Parses a JSON object to a [LatLng] object.
  /// Should be used instead of [LatLng.fromJson] for parsing requests
  /// from the Aare.guru API.
  static LatLng? fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    double? lat = p.parseDouble(json['lat']);
    double? lon = p.parseDouble(json['lon']);
    if (lat == null || lon == null) {
      return null;
    }
    return LatLng(lat, lon);
  }
}
