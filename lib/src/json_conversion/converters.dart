import 'package:aareguru_api/aareguru_api.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart';

import 'date_time_seconds_parser.dart';
import 'lat_long_parser.dart';

//  provides classes to parse JSON objects consistently and robustly, to avoid runtime errors.

/// Parses a JSON object to a Dart object, using the provided [fromJson] function.
T? _parseObject<T>(dynamic value, T Function(dynamic) fromJson) {
  if (value == null) {
    return null;
  }
  return fromJson(value);
}

List<T>? parseList<T>(dynamic values, T Function(dynamic) fromJson) {
  if (values == null) {
    return null;
  }
  Iterable<dynamic> list = values;
  return list.map<T>((value) => fromJson(value)).toList();
}

class StringJsonConverter implements JsonConverter<String?, dynamic> {
  const StringJsonConverter();

  @override
  String? fromJson(dynamic json) {
    return _parseObject<String>(json, (v) => v.toString());
  }

  @override
  dynamic toJson(String? object) {
    return object;
  }
}

class IntJsonConverter implements JsonConverter<int?, dynamic> {
  const IntJsonConverter();

  @override
  int? fromJson(dynamic json) {
    return _parseObject<int?>(
        json, (v) => DoubleJsonConverter().fromJson(v)?.toInt());
  }

  @override
  dynamic toJson(int? object) {
    return object;
  }
}

class DoubleJsonConverter implements JsonConverter<double?, dynamic> {
  const DoubleJsonConverter();

  @override
  double? fromJson(dynamic json) {
    return _parseObject<double?>(json, (v) => double.tryParse(v.toString()));
  }

  @override
  dynamic toJson(double? object) {
    return object;
  }
}

class BoolJsonConverter implements JsonConverter<bool?, dynamic> {
  const BoolJsonConverter();

  @override
  bool? fromJson(dynamic json) {
    return _parseObject<bool?>(json, (v) => bool.tryParse(v.toString()));
  }

  @override
  dynamic toJson(bool? object) {
    return object;
  }
}

/// Expects seconds since epoch
class DateTimeJsonConverter implements JsonConverter<DateTime?, dynamic> {
  const DateTimeJsonConverter();

  @override
  DateTime? fromJson(dynamic json) {
    return _parseObject<DateTime?>(
        json,
        (v) => DateTimeSecondsParser.tryParseSecondsSinceEpoch(
            int.tryParse(v.toString())));
  }

  @override
  dynamic toJson(DateTime? object) {
    if (object == null) {
      return null;
    }
    return object.millisecondsSinceEpoch ~/ 1000;
  }
}

class UriJsonConverter implements JsonConverter<Uri?, dynamic> {
  const UriJsonConverter();

  @override
  Uri? fromJson(dynamic json) {
    return _parseObject<Uri?>(json, (v) => Uri.tryParse(v.toString()));
  }

  @override
  dynamic toJson(Uri? object) {
    return object.toString();
  }
}

class CityWidgetMapJsonConverter
    implements JsonConverter<Map<String, CityWidget?>?, dynamic> {
  const CityWidgetMapJsonConverter();

  @override
  Map<String, CityWidget?>? fromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    Map<String, dynamic>? map = json;
    return map?.map(
      (k, e) => MapEntry(k.toString(), CityWidget.fromJsonWithCity(e, k)),
    );
  }

  @override
  dynamic toJson(Map<String, CityWidget?>? object) {
    return object;
  }
}

class DurationJsonConverter implements JsonConverter<Duration?, dynamic> {
  const DurationJsonConverter();

  @override
  Duration? fromJson(dynamic json) {
    return _parseObject<Duration?>(
        IntJsonConverter().fromJson(json), (v) => Duration(seconds: v));
  }

  @override
  dynamic toJson(Duration? object) {
    return object?.inSeconds;
  }
}

class LatLngJsonConverter implements JsonConverter<LatLng?, dynamic> {
  const LatLngJsonConverter();

  @override
  LatLng? fromJson(dynamic json) {
    return _parseObject<LatLng?>(json, (v) => LatLongParser.fromJson(v));
  }

  @override
  dynamic toJson(LatLng? object) {
    return object;
  }
}

abstract class ListJsonConverter<T>
    implements JsonConverter<List<T>?, dynamic> {
  const ListJsonConverter();

  T Function(dynamic) get parseJson;

  @override
  List<T>? fromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    Iterable<dynamic> list = json;
    return list.map<T>((value) => parseJson(value)).toList();
  }

  @override
  dynamic toJson(List<T>? object) {
    return object;
  }
}

class CityKeyListJsonConverter extends ListJsonConverter<CityKey> {
  const CityKeyListJsonConverter();

  @override
  CityKey Function(dynamic) get parseJson => (value) => CityKey.fromJson(value);
}

class ScaleJsonConverter implements JsonConverter<Scale<ScaleEntry>?, dynamic> {
  const ScaleJsonConverter();

  @override
  Scale<ScaleEntry>? fromJson(dynamic json) => Scale.fromJson(json);

  @override
  dynamic toJson(Scale<ScaleEntry>? object) {
    return object?.entries;
  }
}

class MapToSunPerDayListJsonConverter
    implements JsonConverter<List<SunPerDay>?, Map<String, dynamic>> {
  const MapToSunPerDayListJsonConverter();

  @override
  List<SunPerDay>? fromJson(Map<String, dynamic> json) {
    return parseList(json.values, (dynamic e) => SunPerDay.fromJson(e));
  }

  @override
  Map<String, dynamic> toJson(List<SunPerDay>? object) {
    throw UnimplementedError();
  }
}
