import 'city_key.dart';
import 'city_widget.dart';
import 'json_parser.dart';

/// Data over all cities, optimized for widgets.
class WidgetData {
  /// Map with over all cities and their associated data.
  ///
  /// Example: {'bern': CityWidget, 'thun': CityWidget}
  Map<String, CityWidget?>? values;

  /// A list to map the city key to the city name for all cities.
  List<CityKey>? cities;

  WidgetData({
    this.values,
    this.cities,
  });

  /// Creates a [WidgetData] from a JSON object.
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
