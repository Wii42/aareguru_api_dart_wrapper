import 'city_key.dart';
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
