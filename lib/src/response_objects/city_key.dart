import 'package:aareguru_api/json_conversion.dart';

part 'city_key.g.dart';

/// Bundles the unique identifier and the display name of a city.
@CustomJsonSerializable()
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
  factory CityKey.fromJson(Map<String, dynamic> json) =>
      _$CityKeyFromJson(json);

  /// Creates a list of [CityKey] from a JSON list.
  static List<CityKey> listFromJson(List<dynamic> json) {
    return json.map((value) => CityKey.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'CityKey(key: $key, name: $name)';
  }
}
