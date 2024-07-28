class Coordinate {
  double? lat;
  double? lon;

  Coordinate({this.lat, this.lon});

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(
      lat: double.tryParse(json['lat'].toString()),
      lon: double.tryParse(json['lon'].toString()),
    );
  }

  @override
  toString() {
    return 'Coordinate{lat: $lat, lon: $lon}';
  }
}