import 'city_key.dart';
import 'city_widget.dart';
import 'json_parser.dart';

class WidgetData {
  Map<String, CityWidget?>? values;
  List<CityKey>? cities;

  WidgetData({
    this.values,
    this.cities,
  });

  factory WidgetData.fromJson(Map<String, dynamic> json) {
    JsonParser p = JsonParser();
    return WidgetData(
      values: p.parseCityWidgetMap(json['values']),
      cities: p.parseList(json['cities'], (dynamic e) => CityKey.fromJson(e)),
    );
  }

  @override
  String toString() {
    return 'WidgetData(values: $values, cities: $cities)';
  }
}
