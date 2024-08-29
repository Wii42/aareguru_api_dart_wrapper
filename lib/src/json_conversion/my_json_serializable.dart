import 'package:json_annotation/json_annotation.dart';

import 'converters.dart';

class MyJsonSerializable extends JsonSerializable {
  const MyJsonSerializable({
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
  }) : super(converters: const [
          StringJsonConverter(),
          IntJsonConverter(),
          DoubleJsonConverter(),
          BoolJsonConverter(),
          DateTimeJsonConverter(),
          UriJsonConverter(),
          CityWidgetMapJsonConverter(),
          DurationJsonConverter(),
          LatLngJsonConverter(),
          //CityKeyListJsonConverter(),
          ScaleJsonConverter(),
          MapToSunPerDayListJsonConverter(),
        ]);
}
