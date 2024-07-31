import 'json_parser.dart';

class CityKey {
  String? key;
  String? name;

  CityKey({
    this.key,
    this.name,
  });

  factory CityKey.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return CityKey(
      key: p.parseString(json['key']),
      name: p.parseString(json['name']),
    );
  }

  static List<CityKey> listFromJson(List<dynamic> json) {
    return json.map((value) => CityKey.fromJson(value)).toList();
  }

  @override
  String toString() {
    return 'CityKey(key: $key, name: $name)';
  }
}
