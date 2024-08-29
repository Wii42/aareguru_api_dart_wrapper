import 'package:json_annotation/json_annotation.dart';

import 'converters.dart';

/// Custom [JsonSerializable] class that uses custom converters to parse JSON objects consistently and robustly.
class CustomJsonSerializable extends JsonSerializable {
  const CustomJsonSerializable({
    super.anyMap,
    super.checked,
    super.constructor,
    super.createFieldMap,
    super.createJsonKeys,
    super.createFactory,
    super.createToJson = false,
    super.disallowUnrecognizedKeys,
    super.explicitToJson = true,
    super.fieldRename,
    super.ignoreUnannotated,
    super.includeIfNull,
    super.genericArgumentFactories,
    super.createPerFieldToJson,
  }) : super(converters: defaultConverters);

  /// Default converters used by [CustomJsonSerializable].
  static const List<JsonConverter<dynamic, dynamic>> defaultConverters = [
    StringJsonConverter(),
    IntJsonConverter(),
    DoubleJsonConverter(),
    BoolJsonConverter(),
    DateTimeJsonConverter(),
    UriJsonConverter(),
    CityWidgetMapJsonConverter(),
    DurationJsonConverter(),
    LatLngJsonConverter(),
    ScaleJsonConverter(),
    MapToSunPerDayListJsonConverter(),
  ];
}
