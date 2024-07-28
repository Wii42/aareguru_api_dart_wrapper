class CityKey {
  String? key;
  String? name;

  CityKey({
    this.key,
    this.name,
  });

  factory CityKey.fromJson(Map<String, dynamic> json) {
    return CityKey(
      key: json['key'].toString(),
      name: json['name'].toString(),
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
