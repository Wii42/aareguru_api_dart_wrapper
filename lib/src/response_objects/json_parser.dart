import 'package:aareguru_api/src/date_time_seconds_parser.dart';
import 'package:aareguru_api/src/lat_long_parser.dart';
import 'package:latlong2/latlong.dart';

import 'city_widget.dart';

/// Class which provides methods to parse JSON objects consistently.
class JsonParser {
  /// Parses a JSON object to a Dart object, using the provided [fromJson] function.
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

  /// Expects seconds since epoch
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
    return CityWidget.fromJson(value);
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

  Duration? parseDuration(dynamic value) =>
      parseObject<Duration?>(parseInt(value), (v) => Duration(seconds: v));

  LatLng? parseLatLng(dynamic value) =>
      parseObject<LatLng?>(value, (v) => LatLongParser.fromJson(v));
}
