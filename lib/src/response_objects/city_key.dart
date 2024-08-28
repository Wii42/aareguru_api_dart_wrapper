import 'json_parser.dart';

/// Bundles the unique identifier and the display name of a city.
class CityKey {
  /// Unique identifier of the city.
  ///
  /// Example: 'bern'
  String? key;

  /// Display name of the city.
  ///
  /// Example: 'Bärn'
  String? name;

  /// Bundles the unique identifier and the display name of a city.
  CityKey({
    this.key,
    this.name,
  });

  /// Creates a [CityKey] from a JSON object.
  factory CityKey.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return CityKey(
      key: p.parseString(json['key']),
      name: p.parseString(json['name']),
    );
  }

  /// Creates a list of [CityKey] from a JSON list.
  static List<CityKey> listFromJson(List<dynamic> json) {
    return json.map((value) => CityKey.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'CityKey(key: $key, name: $name)';
  }
}
