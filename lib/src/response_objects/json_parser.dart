import 'package:aareguru_api/src/date_time_seconds_parser.dart';

import 'city_widget.dart';
import 'coordinate.dart';

class JsonParser {
  T? parseObject<T>(dynamic value, T Function(dynamic) fromJson) {
    if (value == null) {
      return null;
    }
    return fromJson(value);
  }

  String? parseString(dynamic value) => parseObject(value, (v) => v.toString());

  int? parseInt(dynamic value) =>
      parseObject<int?>(value, (v) => parseDouble(value)?.toInt());

  double? parseDouble(dynamic value) =>
      parseObject<double?>(value, (v) => double.tryParse(v.toString()));

  bool? parseBool(dynamic value) =>
      parseObject<bool?>(value, (v) => bool.tryParse(v.toString()));

  parseCoordinate(dynamic value) =>
      parseObject(value, (v) => Coordinate.fromJson(v));

  /// expects seconds since epoch
  DateTime? parseDateTime(dynamic value) {
    return parseObject<DateTime?>(
        value,
        (v) => DateTimeSecondsParser.tryParseSecondsSinceEpoch(
            int.tryParse(v.toString())));
  }

  Uri? parseUri(dynamic value) =>
      parseObject<Uri?>(value, (v) => Uri.tryParse(v.toString()));

  CityWidget? parseCityWidget(dynamic value, dynamic city) {
    if (value == null) {
      return null;
    }
    return CityWidget.fromJson(value, city?.toString());
  }

  Map<String, CityWidget?>? parseCityWidgetMap(dynamic values) {
    if (values == null) {
      return null;
    }
    Map<String, dynamic>? map = values;
    return map?.map(
      (k, e) => MapEntry(k.toString(), parseCityWidget(e, k)),
    );
  }

  List<T>? parseList<T>(dynamic values, T Function(dynamic) fromJson) {
    if (values == null) {
      return null;
    }
    Iterable<dynamic> list = values;
    return list.map<T>((value) => fromJson(value)).toList();
  }
}
