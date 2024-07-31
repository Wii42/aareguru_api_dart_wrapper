import 'json_parser.dart';

class Coordinate {
  double? lat;
  double? lon;

  Coordinate({this.lat, this.lon});

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return Coordinate(
      lat: p.parseDouble(json['lat']),
      lon: p.parseDouble(json['lon']),
    );
  }

  @override
  toString() {
    return 'Coordinate{lat: $lat, lon: $lon}';
  }
}
