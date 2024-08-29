import 'package:aareguru_api/json_conversion.dart';

import 'city_key.dart';
import 'city_widget.dart';
import 'json_parser.dart';

part 'widget_data.g.dart';

/// Data over all cities, optimized for widgets.
@MyJsonSerializable()
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
  factory WidgetData.fromJson(Map<String, dynamic> json) =>
      _$WidgetDataFromJson(json);

  @override
  String toString() {
    return 'WidgetData(values: $values, cities: $cities)';
  }
}
