import 'city_widget.dart';

class WidgetData {
  Map<String, CityWidget>? values;
  List<CityKey>? cities;

  WidgetData({
    this.values,
    this.cities,
  });

  factory WidgetData.fromJson(Map<String, dynamic> json) {
    print(json['values'].runtimeType);
    Map<String, dynamic>? values = json['values'];
    return WidgetData(
      values: values?.map(
        (k, e) => MapEntry(k.toString(), CityWidget.fromJson(e, k.toString())),
      ),
      cities:
          json['cities'] != null ? CityKey.listFromJson(json['cities']) : null,
    );
  }

  @override
  String toString() {
    return 'WidgetData(values: $values, cities: $cities)';
  }
}

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
